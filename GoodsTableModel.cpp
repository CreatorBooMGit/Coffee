#include "GoodsTableModel.h"

GoodsTableModel::GoodsTableModel(QObject *parent) : QAbstractListModel(parent)
{
    goodsList.append({1, 1, "name1", 10.00, 12.00, "icon.name"});
    goodsList.append({1, 1, "name1", 10.00, 12.00, "icon.name"});
    goodsList.append({1, 1, "name1", 10.00, 12.00, "icon.name"});
}

//GoodsTableModel::GoodsTableModel(QSqlQuery *p_query, QObject *parent) : QAbstractListModel(parent)
//{
//    query = p_query;

//    goodsList.append({1, 1, "name1", 10.00, 12.00, "icon.name"});

//    query->prepare("SELECT * FROM goods");
//    query->exec();

//    while(query->next())
//    {
//        append(query->value("id").toInt(),
//               query->value("type").toInt(),
//               query->value("name").toString(),
//               query->value("price").toInt(),
//               query->value("price").toInt() + query->value("price").toInt() * 0.2,
//               query->value("icon").toInt());
//    }
//}

GoodsTableModel::~GoodsTableModel()
{

}

int GoodsTableModel::rowCount(const QModelIndex &) const
{
    return goodsList.count();
}

QVariant GoodsTableModel::data(const QModelIndex &index, int role) const
{
    if (index.row() < rowCount())
        switch (role) {
        case IdRole: return goodsList.at(index.row()).id;
        case TypeRole: return goodsList.at(index.row()).type;
        case NameRole: return goodsList.at(index.row()).name;
        case PriceRole: return goodsList.at(index.row()).price;
        case Price_pdvRole: return goodsList.at(index.row()).price_pdv;
        case Image_nameRole: return goodsList.at(index.row()).image_name;
        default: return QVariant();
        }
    return QVariant();
}

QHash<int, QByteArray> GoodsTableModel::roleNames() const
{
    static const QHash<int, QByteArray> roles {
        { IdRole, "id" },
        { TypeRole, "type" },
        { NameRole, "name" },
        { PriceRole, "price" },
        { Price_pdvRole, "price_pdv" },
        { Image_nameRole, "image_name" }
    };
    return roles;
}

QVariantMap GoodsTableModel::get(int row) const
{
    const Good good = goodsList.value(row);
    return {{"id", good.id},
        {"type", good.type},
        {"name", good.name},
        {"price", good.price},
        {"price_pdv", good.price_pdv},
        {"image_name", good.image_name}};
}

void GoodsTableModel::append(const int &id, const int &type, const QString &name, const double &price, const double &price_pdv, const QString &image_name)
{
    goodsList.push_back({id, type, name, price, price_pdv, image_name});
}

void GoodsTableModel::set(int row, const int &id, const int &type, const QString &name, const double &price, const double &price_pdv, QString &image_name)
{
    if (row < 0 || row >= goodsList.count())
        return;

    goodsList.replace(row, {id, type, name, price, price_pdv, image_name});
    dataChanged(index(row, 0), index(row, 0), {IdRole, TypeRole, NameRole, PriceRole, Price_pdvRole, Image_nameRole});
}

void GoodsTableModel::remove(int row)
{
    if (row < 0 || row >= goodsList.count())
        return;

    beginRemoveRows(QModelIndex(), row, row);
    goodsList.removeAt(row);
    endRemoveRows();
}
