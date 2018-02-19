#ifndef OrderContent_H
#define OrderContent_H

#include "GoodsTableModel.h"

#include <QAbstractListModel>
#include <QDateTime>
#include <QSqlQuery>


class OrderContent : public QObject
{
    Q_OBJECT
public:
    OrderContent(QObject *parent = nullptr);
    ~OrderContent();

    Q_INVOKABLE QVariantMap getPosition(int row) const;
    Q_INVOKABLE QVariantMap appendPosition(const int &id);
    Q_INVOKABLE void removePosition(int row);

    Q_INVOKABLE QString getDate() const;
    Q_INVOKABLE QString getTime() const;

    Q_INVOKABLE double getSum() const;
    Q_INVOKABLE double getSumDiscount() const;
    Q_INVOKABLE double getSumPDV() const;
    Q_INVOKABLE double getSumPDVDiscount() const;

    Q_INVOKABLE double getDiscount() const;

private:
    QSqlQuery query;

    QList<Good> goodsList;
    QDateTime dateTime;
    double discount;
};


#endif // OrderContent_H
