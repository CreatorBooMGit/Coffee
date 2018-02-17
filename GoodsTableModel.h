#ifndef GOODSTABLEMODEL_H
#define GOODSTABLEMODEL_H

#include <QAbstractListModel>
#include <QSqlQuery>

struct Good {
    int id;
    int type;
    QString name;

    double price;
    double price_pdv;

    QString image_name;
};

enum GoodRole {
    IdRole,
    TypeRole,
    NameRole,
    PriceRole,
    Price_pdvRole,
    Image_nameRole
};


class GoodsTableModel : public QAbstractListModel
{
    Q_OBJECT

public:
    GoodsTableModel(QObject *parent = nullptr);
//    GoodsTableModel(QSqlQuery *p_query, QObject *parent = nullptr);
    ~GoodsTableModel();


    Q_ENUM(GoodRole)

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

#endif // GOODSTABLE_H
