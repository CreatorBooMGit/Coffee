#ifndef COFFEEVISUAL_H
#define COFFEEVISUAL_H

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
};

#endif // COFFEEVISUAL_H
