#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "findroute.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // Create instance of FindRoute
    FindRoute findRoute;

    // QML Context
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("findRoute", &findRoute);

    // Load QML
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return app.exec();
}
