#ifndef COFFEEVISUAL_H
#define COFFEEVISUAL_H

#include "CoffeeMain.h"
#include "GoodsTableModel.h"

#include <QObject>

class CoffeeVisual : public QObject
{
    Q_OBJECT
public:
    explicit CoffeeVisual(QObject *parent = 0);
    ~CoffeeVisual();

public slots:
    void test();
    bool singIn(QString login, QString password);
    QSqlQuery *getQuery();

private:
    CoffeeMain *coffeeMain;
};

#endif // COFFEEVISUAL_H
