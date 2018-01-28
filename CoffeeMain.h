#ifndef COFFEEMAIN_H
#define COFFEEMAIN_H

#include "GoodsTableModel.h"

#include <QSqlDatabase>
#include <QSqlQuery>

class CoffeeMain
{
public:
    CoffeeMain();
    ~CoffeeMain();

    QSqlQuery *getQuery();

private:
    QSqlDatabase database;
    QSqlQuery *query = nullptr;

    QString pr_cacheImagesDirectory;

private:
    bool loadCacheImages();
};

#endif // COFFEEMAIN_H
