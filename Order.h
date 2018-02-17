#ifndef OrderContent_H
#define OrderContent_H

#include "GoodsTableModel.h"

#include <QAbstractListModel>
#include <QSqlQuery>


class OrderContent : public QObject
{
    Q_OBJECT
public:
    OrderContent(QObject *parent = nullptr);
    ~OrderContent();
    Q_INVOKABLE QVariantMap get(int row) const;
    Q_INVOKABLE void append(const int &id);
    Q_INVOKABLE void set(int row, const int &id);
    Q_INVOKABLE void remove(int row);

private:
    QList<Good> goodsList;

    QSqlQuery query;
};


#endif // OrderContent_H
