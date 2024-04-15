#include "backend.h"
#include <QDebug>
#include <QSqlError>
#include <QDir>
#include <QSqlRecord>

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
        query.exec("CREATE TABLE IF NOT EXISTS details (name TEXT PRIMARY KEY, password TEXT,passwordc TEXT,agess TEXT,gender TEXT)");
    }
}


void Backend::insertData(const QString &name, const QString &password,const QString &passwordc,const QString &agess,const QString &gender)
{
    qDebug() << name;
    qDebug() << password;
    qDebug() <<passwordc;
    qDebug() << agess;
    qDebug() << gender;
    QSqlQuery query;
    query.prepare("INSERT INTO details (name,password,passwordc,agess,gender) VALUES (:name, :password,:passwordc,:agess,:gender)");
    query.bindValue(":name", name);
    query.bindValue(":password", password);
    query.bindValue(":passwordc", passwordc);
    query.bindValue(":agess", agess);
    query.bindValue(":gender", gender);

    if (!query.exec()) {
        qDebug() << "Error: failed to insert data into details table:" << query.lastError().text();
    } else {
        qDebug() << "Data inserted successfully";
        //emit dataInserted(name, password, passwordc, agess, gender);
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

void Backend::updateData(const QString &name1, const QString &password1, const QString &passwordc1, const QString &agess1, const QString &gender1)
{
    QSqlQuery query;
    query.prepare("UPDATE details SET password = :password, passwordc = :passwordc, agess = :agess, gender = :gender WHERE name = :name");
    query.bindValue(":name", name1);
    query.bindValue(":password", password1);
    query.bindValue(":passwordc", passwordc1);
    query.bindValue(":agess", agess1);
    query.bindValue(":gender", gender1);
    if (!query.exec()) {
        qDebug() << "Error: failed to update data in details table:" << query.lastError().text();
    } else {
        qDebug() << "Data updated successfully";
    }
}
void Backend::fetchRows() {
    // Fetch rows from the database
    QSqlQuery query(m_db);
    if (!query.exec("SELECT * FROM details")) {
        qDebug() << "Error fetching rows:" << query.lastError().text();
        return;
    }

    QVariantList rows;
    while (query.next()) {
        QVariantMap row;
        row["name"] = query.value(0).toString();
        row["password"] = query.value(1).toString();
        row["passwordc"] = query.value(2).toString();
        row["agess"] = query.value(3).toString();
        row["gender"] = query.value(4).toString();
        rows.append(row);
    }

    emit rowsFetched(rows);
}
void Backend::updateDataFromModel(const QVariantList &rows)
{
    QSqlQuery query(m_db);
    qDebug() << "hi1";
    for (const auto &row : rows) {
        QVariantMap rowData = row.toMap();
        QString name = rowData.value("name").toString();
        QString password = rowData.value("password").toString();
        QString passwordc = rowData.value("passwordc").toString();
        QString agess = rowData.value("agess").toString();
        QString gender = rowData.value("gender").toString();
        qDebug() << "Row Data:" << name << password << passwordc << agess << gender;

        // Update the database with the modified data
        query.prepare("UPDATE details SET password = :password, passwordc = :passwordc, agess = :agess, gender = :gender WHERE name = :name");
        qDebug() << "Update Query:" << query.lastQuery();
        qDebug() << "Binding Values:" << password << passwordc << agess << gender << name;
        query.bindValue(":password", password);
        query.bindValue(":passwordc", passwordc);
        query.bindValue(":agess", agess);
        query.bindValue(":gender", gender);
        query.bindValue(":name", name);
        if (!query.exec()) {
            qDebug() << "Error updating data:" << query.lastError().text();
            return;
        }
    }
}
