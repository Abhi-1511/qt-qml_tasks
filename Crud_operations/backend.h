#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>

class Backend : public QObject
{
    Q_OBJECT
public:
    explicit Backend(QObject *parent = nullptr);

signals:
    databaseAlreadyExists();
public slots:
    void createDatabase(const QString &dbName);
    void insertData(const QString &name, const QString &petName);
    void deleteData(const QString &name);
    void updateData(const QString &name, const QString &petName);

private:
    QSqlDatabase m_db;
};

#endif // BACKEND_H
