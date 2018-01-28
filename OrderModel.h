#ifndef ORDERMODEL_H
#define ORDERMODEL_H

#include "GoodsTableModel.h"

#include <QAbstractListModel>
#include <QSqlQuery>


class OrderModel : public QAbstractItemModel
{
    Q_OBJECT
public:
    OrderModel(QObject *parent = nullptr);
    ~OrderModel();

    int rowCount(const QModelIndex & = QModelIndex()) const;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    QHash<int, QByteArray> roleNames() const;

    Q_INVOKABLE QVariantMap get(int row) const;
    Q_INVOKABLE void append(const int &id, const int &type, const QString &name, const double &price, const double &price_pdv, const QString &image_name);
    Q_INVOKABLE void set(int row, const int &id, const int &type, const QString &name, const double &price, const double &price_pdv, QString &image_name);
    Q_INVOKABLE void remove(int row);

private:
    QList<Good> goodsList;

    QSqlQuery query;
};


#endif // ORDERMODEL_H
