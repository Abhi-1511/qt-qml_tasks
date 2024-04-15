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
    rowsFetched(const QVariantList &rows);
    //void dataInserted(const QString &name, const QString &password, const QString &passwordc, const QString &agess, const QString &gender);
public slots:
    void updateDataFromModel(const QVariantList &rows);
    void fetchRows();
    void createDatabase(const QString &dbName);
    void insertData(const QString &name, const QString &password,const QString &passwordc,const QString &agess,const QString &gender);
    void deleteData(const QString &name);
    void updateData(const QString &name1, const QString &password1,const QString &passwordc1,const QString &agess1,const QString &gender1);


private:
    QSqlDatabase m_db;
};

#endif // BACKEND_H
