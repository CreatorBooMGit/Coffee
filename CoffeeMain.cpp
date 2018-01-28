#include "CoffeeMain.h"
#include <QDebug>
#include <QFile>
#include <QCoreApplication>
#include <QDir>

CoffeeMain::CoffeeMain()
{
    pr_cacheImagesDirectory = QString("%1/cache/images")
            .arg(QCoreApplication::applicationDirPath());

    if(!QDir(QString("%1/cache").arg(QCoreApplication::applicationDirPath())).exists())
    {
        QDir().mkdir(QString("%1/cache").arg(QCoreApplication::applicationDirPath()));
        QDir().mkdir(QString("%1/cache/images").arg(QCoreApplication::applicationDirPath()));
    }

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

QSqlQuery *CoffeeMain::getQuery()
{
    return query;
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
