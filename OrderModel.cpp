#include "OrderModel.h"

OrderModel::OrderModel(QObject *parent)
{

}

OrderModel::~OrderModel()
{

}

int OrderModel::rowCount(const QModelIndex &) const
{

}

QVariant OrderModel::data(const QModelIndex &index, int role) const
{

}

QHash<int, QByteArray> OrderModel::roleNames() const
{

}

QVariantMap OrderModel::get(int row) const
{

}

void OrderModel::append(const int &id, const int &type, const QString &name, const double &price, const double &price_pdv, const QString &image_name)
{

}

void OrderModel::set(int row, const int &id, const int &type, const QString &name, const double &price, const double &price_pdv, QString &image_name)
{

}

void OrderModel::remove(int row)
{

}
