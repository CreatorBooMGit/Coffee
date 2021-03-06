#include "CoffeeMain.h"
#include "GoodsTableModel.h"
#include "Order.h"
#include "coffeevisual.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDebug>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    CoffeeVisual coffeeVisual;

    qmlRegisterType<GoodsTableModel>("com.coffee.main", 1, 0, "GoodsTableModel");
    qmlRegisterType<OrderContent>("com.coffee.main", 1, 0, "OrderContent");
    qDebug() << "Loaded";

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("coffeeVisual", &coffeeVisual);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));


    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
