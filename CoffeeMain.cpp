#include "CoffeeMain.h"
#include <QDebug>
#include <QFile>
#include <QCoreApplication>
#include <QDir>

CoffeeMain::CoffeeMain()
{
    pr_cacheImagesDirectory = QString("%1/cache/images")
            .arg(QCoreApplication::applicationDirPath());

    QDir *dir = new QDir;
    dir->setCurrent(pr_cacheImagesDirectory);
    if(dir->exists())
        dir->mkdir(pr_cacheImagesDirectory);

    delete dir;

    database = QSqlDatabase::addDatabase("QODBC3");
    database.setDatabaseName("DRIVER={SQL Server}; SERVER=DESKTOP-6NSSRH1\\SQLEXPRESS;DATABASE=coffee;Trusted_Connection=yes");
    database.setUserName("test");
    database.setPassword("test");

    qDebug() << database.open();

    query = new QSqlQuery(database);

    loadCacheImages();
}

CoffeeMain::~CoffeeMain()
{
    database.close();
}

bool CoffeeMain::loadCacheImages()
{
    bool tResult = false;

    tResult = query->prepare("SELECT * "
                             "FROM addons ");
    tResult = query->exec();

    while(query->next())
    {
        QString tFilename = QString("%1/%3.%4")
                .arg(pr_cacheImagesDirectory)
                .arg(query->value("filename").toString())
                .arg(query->value("extension").toString());
        qDebug() << tFilename;

        QFile tFile(tFilename);
        if(tFile.open(QIODevice::WriteOnly | QIODevice::Truncate))
        {
            tFile.write(query->value("data").toByteArray());
            tFile.close();
            qDebug() << "File saved";
        }
        else
        {
            qDebug() << "File not open/create";
        }
    }
}
