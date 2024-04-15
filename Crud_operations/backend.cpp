#include "backend.h"
#include <QDebug>
#include <QSqlError>
#include <QDir>

Backend::Backend(QObject *parent) : QObject(parent)
{

}

void Backend::createDatabase(const QString &dbName)
{
    QString databaseName = dbName + ".db";

    // Check if the database file already exists
    if (QFile::exists(databaseName)) {
        qDebug() << "Database already exists";
        emit databaseAlreadyExists();
        //return;
    }

    m_db = QSqlDatabase::addDatabase("QSQLITE");
    m_db.setDatabaseName(databaseName);

    if (!m_db.open()) {
        qDebug() << "Error: connection with database failed";
    } else {
        qDebug() << "Database opened successfully";
        QSqlQuery query;
        query.exec("CREATE TABLE IF NOT EXISTS details (name TEXT PRIMARY KEY, petname TEXT)");
    }
}


void Backend::insertData(const QString &name, const QString &petName)
{

    QSqlQuery query;
    query.prepare("INSERT INTO details (name, petname) VALUES (:name, :petname)");
    query.bindValue(":name", name);
    query.bindValue(":petname", petName);
    if (!query.exec()) {
        qDebug() << "Error: failed to insert data into details table:" << query.lastError().text();
    } else {
        qDebug() << "Data inserted successfully";
    }
}

void Backend::deleteData(const QString &name)
{
    QSqlQuery query;
    query.prepare("DELETE FROM details WHERE name = :name");
    query.bindValue(":name", name);
    if (!query.exec()) {
        qDebug() << "Error: failed to delete data from details table:" << query.lastError().text();
    } else {
        qDebug() << "Data deleted successfully";
    }
}

void Backend::updateData(const QString &name, const QString &petName)
{
    QSqlQuery query;
    query.prepare("UPDATE details SET petname = :petname WHERE name = :name");
    query.bindValue(":name", name);
    query.bindValue(":petname", petName);
    if (!query.exec()) {
        qDebug() << "Error: failed to update data in details table:" << query.lastError().text();
    } else {
        qDebug() << "Data updated successfully";
    }
}
