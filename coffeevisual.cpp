#include "coffeevisual.h"
#include "CoffeeMain.h"
#include <QDebug>

CoffeeVisual::CoffeeVisual(QObject *parent) : QObject(parent)
{
    coffeeMain = new CoffeeMain();
}

CoffeeVisual::~CoffeeVisual()
{

}

void CoffeeVisual::test()
{
    qDebug() << "button clicked";
}

bool CoffeeVisual::singIn(QString login, QString password)
{
    if(login.isEmpty())
        return false;
    else
        return true;
}

QSqlQuery *CoffeeVisual::getQuery()
{
    return coffeeMain->getQuery();
}
