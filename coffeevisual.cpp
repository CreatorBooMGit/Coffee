#include "coffeevisual.h"
#include "CoffeeMain.h"
#include <QDebug>

CoffeeVisual::CoffeeVisual(QObject *parent) : QObject(parent)
{
    CoffeeMain coffeeMain;
}

CoffeeVisual::~CoffeeVisual()
{

}

void CoffeeVisual::test()
{
    qDebug() << "button clicked";
}
