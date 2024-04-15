// databasemanager.cpp
#include "databasemanager.h"
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>

DatabaseManager::DatabaseManager(QObject *parent) : QObject(parent)
{
    // Initialize SQLite database driver
    m_database = QSqlDatabase::addDatabase("QSQLITE");
}

DatabaseManager::~DatabaseManager()
{
    if (m_database.isOpen())
        m_database.close();
}

bool DatabaseManager::openDatabase(const QString &dbName)
{
    // Set the database name
    m_database.setDatabaseName(dbName);

    // Open the database
    if (!m_database.open()) {
        qDebug() << "Error opening database:" << m_database.lastError().text();
        return false;
    }

    return true;
}

bool DatabaseManager::createTable()
{
    // Create a table if it doesn't exist
    QSqlQuery query;
    if (!query.exec("CREATE TABLE IF NOT EXISTS records (id INTEGER PRIMARY KEY AUTOINCREMENT, data TEXT)")) {
        qDebug() << "Error creating table:" << query.lastError().text();
        return false;
    }

    return true;
}

bool DatabaseManager::insertRecord(const QString &data)
{
    // Insert a record into the table
    QSqlQuery query;
    query.prepare("INSERT INTO records (data) VALUES (:data)");
    query.bindValue(":data", data);
    if (!query.exec()) {
        qDebug() << "Error inserting record:" << query.lastError().text();
        return false;
    }

    return true;
}

bool DatabaseManager::deleteRecord(const QString &data)
{
    // Delete a record from the table
    QSqlQuery query;
    query.prepare("DELETE FROM records WHERE data = :data");
    query.bindValue(":data", data);
    if (!query.exec()) {
        qDebug() << "Error deleting record:" << query.lastError().text();
        return false;
    }

    return true;
}

bool DatabaseManager::updateRecord(const QString &oldData, const QString &newData)
{
    // Update a record in the table
    QSqlQuery query;
    query.prepare("UPDATE records SET data = :newData WHERE data = :oldData");
    query.bindValue(":newData", newData);
    query.bindValue(":oldData", oldData);
    if (!query.exec()) {
        qDebug() << "Error updating record:" << query.lastError().text();
        return false;
    }

    return true;
}
