//#ifndef GOODSTABLE_H
//#define GOODSTABLE_H

//#include <QAbstractListModel>

//struct Good {
//    int id;
//    int type;
//    QString name;

//    double price;
//    double price_pdv;

//    QString image_name;
//};

//enum GoodRole {
//    IdRole,
//    TypeRole,
//    NameRole,
//    PriceRole,
//    Price_pdvRole,
//    Image_nameRole
//};

//class GoodsTableModel : public QAbstractListModel
//{
//    Q_OBJECT

//public:
//    GoodsTableModel(QObject *parent = nullptr);
//    ~GoodsTableModel();


//    Q_ENUM(GoodRole)

//    int rowCount(const QModelIndex & = QModelIndex()) const;
//    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
//    QHash<int, QByteArray> roleNames() const;

//    Q_INVOKABLE QVariantMap get(int row) const;
//    Q_INVOKABLE void append(const int &rcd, const QString &connectionName, const QString &host, const int &port, const bool &autoConnection);
//    Q_INVOKABLE void set(int row, const int &rcd, const QString &connectionName, const QString &host, const int &port, const bool &autoConnection);
//    Q_INVOKABLE void remove(int row);
//};

//#endif // GOODSTABLE_H
