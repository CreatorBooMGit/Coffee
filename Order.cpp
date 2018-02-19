#include "Order.h"
#include <QCoreApplication>

OrderContent::OrderContent(QObject *parent) : QObject(parent)
{
    dateTime = QDateTime::currentDateTime();
    discount = 15;
}

OrderContent::~OrderContent()
{

}

QVariantMap OrderContent::getPosition(int row) const
{
    const Good good = goodsList.value(row);
    return {{"id", good.id},
        {"type", good.type},
        {"name", good.name},
        {"price", good.price},
        {"price_pdv", good.price_pdv},
        {"image_name", good.image_name}};
}

QVariantMap OrderContent::appendPosition(const int &id)
{
    query.prepare("SELECT goods.id, goods.goodType_id, goods.name, goods.price, addons.filename + '.' + addons.extension as filenameAddon \n"
                  "FROM goods \n"
                  "LEFT JOIN addons ON goods.addon_id = addons.id \n"
                  "WHERE goods.id = :id");
    query.bindValue(":id", id);
    query.exec();

    if(!query.next())
        return QVariantMap();

    goodsList.push_back({
                            query.value("id").toInt(),
                            query.value("goodType_id").toInt(),
                            query.value("name").toString(),
                            query.value("price").toInt(),
                            query.value("price").toInt() + query.value("price").toInt() * 0.2,
                            "file:///" + QCoreApplication::applicationDirPath() +"/cache/images/" + query.value("filenameAddon").toString()
                        });

    return getPosition(goodsList.length() - 1);
}

void OrderContent::removePosition(int row)
{
    goodsList.removeAt(row);
}

QString OrderContent::getDate() const
{
    return dateTime.toString("dd.MM.yyyy");
}

QString OrderContent::getTime() const
{
    return dateTime.toString("HH:mm");
}

double OrderContent::getSum() const
{
    double sum = 0;

    for(Good good : goodsList)
        sum += good.price;

    return sum;
}

double OrderContent::getSumDiscount() const
{
    return getSum() - getSum() * getDiscount();
}

double OrderContent::getSumPDV() const
{
    double sum = 0;

    for(Good good : goodsList)
        sum += good.price_pdv;

    return sum;
}

double OrderContent::getSumPDVDiscount() const
{

}

double OrderContent::getDiscount() const
{
    return discount;
}
