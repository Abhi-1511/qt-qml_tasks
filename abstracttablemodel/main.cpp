#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtSql>
#include "tablemodel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    // Initialize SQLite database
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("datastorevaluenow.db");

    // Check if the database is opened successfully
    if (!db.open()) {
        qWarning() << "Error opening database:" << db.lastError().text();
        return -1;
    }

    // Create an instance of TableModel
    TableModel tableModel;

    // Expose the model to QML
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("tableModel", &tableModel);

    // Load the QML file
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
