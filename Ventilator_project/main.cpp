#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "database.h"
#include "tablemodel.h"
#include "tablemodel2.h"
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // Register Database class to use in QML
    qmlRegisterType<Database>("com.ventilatorproject.database", 1, 0, "Database");
    qmlRegisterType<TableModel>("com.ventilatorproject.tablemodel", 1, 0, "TableModel");
    qmlRegisterType<TableModel2>("com.ventilatorproject.tablemodel2", 1, 0, "TableModel2");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
