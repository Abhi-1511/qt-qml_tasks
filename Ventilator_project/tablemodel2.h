// tablemodel2.h
#ifndef TABLEMODEL2_H
#define TABLEMODEL2_H

#include <QAbstractTableModel>
#include <QList>
#include <QVariantMap>
#include <QObject>
#include <QSqlDatabase>
#include <QTimer>

class TableModel2 : public QAbstractTableModel
{
    Q_OBJECT

public:
    explicit TableModel2(QObject *parent = nullptr);

    enum Role {
        TimestampRole = Qt::UserRole,
        CategoryRole,
        EventNameRole,
        EventValueRole,
        SourceRole,
    };

    // Methods for the model interface
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    int columnCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;

    Q_INVOKABLE void insertData(const QString &timestamp, const QString &category, const QString &eventname, const QString &eventvalue, const QString &source);
    Q_INVOKABLE void removeRow(int row);
     Q_INVOKABLE void fetchData(int page);
    Q_INVOKABLE void nextPage();
    Q_INVOKABLE void previousPage();

protected:
    QHash<int, QByteArray> roleNames() const override;


private:
    QList<QVariantMap> m_data; // Data retrieved from the database
    QSqlDatabase m_db;
    QTimer* m_timer;
    int m_pageSize=5;
    int m_currentPage=0;
    int m_totalPages=0;
    void updatePagination();
    bool onTimerTimeout(); // Slot to handle timer timeout
};

#endif // TABLEMODEL2_H


