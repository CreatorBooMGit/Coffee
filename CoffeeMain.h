#ifndef COFFEEMAIN_H
#define COFFEEMAIN_H

#include <QSqlDatabase>

class CoffeeMain
{
public:

    CoffeeMain();
    ~CoffeeMain();

private:
    QSqlDatabase database;
    QSqlQuery *query = nullptr;

};

#endif // COFFEEMAIN_H
