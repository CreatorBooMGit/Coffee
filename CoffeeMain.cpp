#include "CoffeeMain.h"
#include <QDebug>

CoffeeMain::CoffeeMain()
{
    database = QSqlDatabase::addDatabase("QODBC3");
    database.setDatabaseName("DRIVER={SQL Server}; SERVER=DESKTOP-6NSSRH1\\SQLEXPRESS;DATABASE=coffee;Trusted_Connection=yes");
    database.setUserName("test");
    database.setPassword("test");

    qDebug() << database.open();
}

CoffeeMain::~CoffeeMain()
{
    database.close();
}
