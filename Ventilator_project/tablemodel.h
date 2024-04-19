#ifndef TABLEMODEL_H
#define TABLEMODEL_H

#include <QAbstractTableModel>
#include <QList>
#include <QVariantMap>
#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>
#include <QFile>


class TableModel : public QAbstractTableModel
{
    Q_OBJECT

public:
    explicit TableModel(QObject *parent = nullptr);

    enum Role {
        TimestampRole = Qt::UserRole ,
        ParameterIDRole,
        ParameterValueRole,
    };

    // Methods for the model interface
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    int columnCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;
    Q_INVOKABLE void fetchData(int page);
    Q_INVOKABLE void insertData(const QString &timestamp, const QString &parameterId, const QString &parameterValue);
    Q_INVOKABLE void removeRow(int row);
    Q_INVOKABLE void nextPage();
    Q_INVOKABLE void previousPage();
protected:
    QHash<int, QByteArray> roleNames() const override;
signals:
    void currentPageChanged(int currentPage);
private:
    QList<QVariantMap> m_data; // Data retrieved from the database
    QModelIndex m_currentIndex;
    QSqlDatabase m_db;
    int m_pageSize=5;
    int m_currentPage=0;
    int m_totalPages=0;
    void updatePagination();
};

#endif // TABLEMODEL_H
