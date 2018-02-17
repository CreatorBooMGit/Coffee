#include "Order.h"
#include <QCoreApplication>

OrderContent::OrderContent(QObject *parent) : QObject(parent)
{

}

OrderContent::~OrderContent()
{

}

QVariantMap OrderContent::get(int row) const
{
    const Good good = goodsList.value(row);
    return {{"id", good.id},
        {"type", good.type},
        {"name", good.name},
        {"price", good.price},
        {"price_pdv", good.price_pdv},
        {"image_name", good.image_name}};
}

void OrderContent::append(const int &id)
{
    //    query.prepare("SELECT goods.id, goods.goodType_id, goods.name, goods.price, addons.filename + '.' + addons.extension as filenameAddon \n"
    //                  "FROM goods \n"
    //                  "LEFT JOIN addons ON goods.addon_id = addons.id \n"
    //                  "WHERE goods.id = :id");
    //    query.bindValue(":id", id);
    //    query.exec();

    //    if(!query.next())
    //        return;

    //    goodsList.push_back({
    //                            query.value("id").toInt(),
    //                            query.value("goodType_id").toInt(),
    //                            query.value("name").toString(),
    //                            query.value("price").toInt(),
    //                            query.value("price").toInt() + query.value("price").toInt() * 0.2,
    //                            "file:///" + QCoreApplication::applicationDirPath() +"/cache/images/" + query.value("filenameAddon").toString()
    //                        });
    goodsList.push_back({1, 1, "Good 1", 23.50, 23.50 * 1.2, "file:///" + QCoreApplication::applicationDirPath() +"/cache/images/" + "venski.png"});
}

void OrderContent::set(int row, const int &id)
{

}

void OrderContent::remove(int row)
{
    goodsList.removeAt(row);
}
