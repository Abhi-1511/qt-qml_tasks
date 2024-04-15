// databasemanager.h
#ifndef DATABASEMANAGER_H
#define DATABASEMANAGER_H

#include <QObject>
#include <QSqlDatabase>

class DatabaseManager : public QObject
{
    Q_OBJECT
public:
    explicit DatabaseManager(QObject *parent = nullptr);
    ~DatabaseManager();

public slots:
    bool openDatabase(const QString &dbName);
    bool createTable();
    bool insertRecord(const QString &data);
    bool deleteRecord(const QString &data);
    bool updateRecord(const QString &oldData, const QString &newData);

private:
    QSqlDatabase m_database;
};

#endif // DATABASEMANAGER_H
