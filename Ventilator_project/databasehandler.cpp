// databasehandler.cpp

#include "databasehandler.h"
#include <QSqlQuery>
#include <QSqlError>

DatabaseHandler::DatabaseHandler(QObject *parent) : QObject(parent)
{
    // Initialize database
    m_database = QSqlDatabase::addDatabase("QSQLITE");
    m_database.setDatabaseName("ventilatorproject.db");
    if (!m_database.open()) {
        qDebug() << "Error: Failed to open database:" << m_database.lastError();
    } else {
        qDebug() << "Database opened successfully!";
    }

    // Create tables if they don't exist
    QSqlQuery query;
    query.exec("CREATE TABLE IF NOT EXISTS patient_details (pname TEXT PRIMARY KEY, peekp INT, breathrate INT, spontbr INT, tv INT, fio2 INT, ieratio INT, spo2hr INT, minutevol INT)");
    // Add similar queries for other tables
}

bool DatabaseHandler::addPatient(const QString &name, int peekp, int breathrate, int spontbr, int tv, int fio2, int ieratio, int spo2hr, int minutevol)
{
    QSqlQuery query;
    query.prepare("INSERT INTO patient_details (pname, peekp, breathrate, spontbr, tv, fio2, ieratio, spo2hr, minutevol) "
                  "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
    query.addBindValue(name);
    query.addBindValue(peekp);
    query.addBindValue(breathrate);
    query.addBindValue(spontbr);
    query.addBindValue(tv);
    query.addBindValue(fio2);
    query.addBindValue(ieratio);
    query.addBindValue(spo2hr);
    query.addBindValue(minutevol);
    return query.exec();
}
