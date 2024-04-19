// tablemodel2.cpp
#include "TableModel2.h"

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QDebug>
#include <QSqlError>

TableModel2::TableModel2(QObject *parent)
    : QAbstractTableModel(parent)
{
    QString dbFilePath = "VentilatorProject.db";
    m_db = QSqlDatabase::addDatabase("QSQLITE");
    m_db.setDatabaseName(dbFilePath);
    m_db.open();
     fetchData(m_currentPage);
    m_timer = new QTimer(this);
    connect(m_timer, &QTimer::timeout, this, &TableModel2::onTimerTimeout);
    m_timer->start(60000); // 1 minutes in milliseconds
    updatePagination();
}
bool TableModel2::onTimerTimeout()
{
    // Delete the oldest two rows
    if (rowCount() >= 2) {
        removeRow(0);
        removeRow(0);
        return true;
    } else if (rowCount() == 1) {
        removeRow(0);
        return true;
    }

    // Fetch data again
    fetchData(m_currentPage);
    return true;
}

void TableModel2::fetchData(int page)
{
    int offset = page * m_pageSize;
    QSqlDatabase db = QSqlDatabase::database();

    m_data.clear();
    QSqlQuery query;
    query.prepare("SELECT * FROM system_log LIMIT :pageSize OFFSET :offset");
    query.bindValue(":pageSize", m_pageSize);
    query.bindValue(":offset", offset);
    if (!query.exec()) {
        qDebug() << "Error fetching data:" << query.lastError().text();
        return;
    }

    while (query.next()) {
        QVariantMap row;
        row["timestamp"] = query.value("timestamp").toString();
        row["category"] = query.value("category").toString();
        row["eventname"] = query.value("eventname").toString();
        row["eventvalue"] = query.value("eventvalue").toString();
        row["source"] = query.value("source").toString();
        m_data.append(row);
    }
    emit dataChanged(createIndex(0, 0), createIndex(rowCount() - 1, columnCount() - 1));
}

int TableModel2::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;

    return m_data.size();
}

int TableModel2::columnCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;

    // Assuming all rows have the same number of columns
    return m_data.isEmpty() ? 0 : m_data.first().keys().size();
}

QVariant TableModel2::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || index.row() >= m_data.size() || index.column() >= columnCount())
        return QVariant();
    if (role >= Qt::UserRole) {
        const QVariantMap &row = m_data[index.row()];
        switch (role) {
        case TimestampRole:
            return row.value("timestamp").toString();
        case CategoryRole:
            return row.value("category").toString();
        case EventNameRole:
            return row.value("eventname").toString();
        case EventValueRole:
            return row.value("eventvalue").toString();
        case SourceRole:
            return row.value("source").toString();
        default:
         return QVariant();
        }
    }
return QVariant();
}

QVariant TableModel2::headerData(int section, Qt::Orientation orientation, int role) const
{
    if (role != Qt::DisplayRole)
        return QVariant();

    if (orientation == Qt::Horizontal) {
        // Assuming column timestamps are stored as keys in the first row of m_data
        return m_data.isEmpty() ? QVariant() : m_data.first().keys().at(section);
    } else {
        // Return row numbers for vertical headers
        return section + 1;
    }
}
QHash<int, QByteArray> TableModel2::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[TimestampRole] = "timestamp";
    roles[CategoryRole] = "category";
    roles[EventNameRole] = "eventname";
    roles[EventValueRole] = "eventvalue";
    roles[SourceRole] = "source";
    return roles;
}
void TableModel2::insertData(const QString &timestamp, const QString &category, const QString &eventname, const QString &eventvalue, const QString &source)
{
    if (rowCount() >= 12) {
        qDebug() << "Maximum capacity reached. Deleting oldest row and inserting new data.";

        // Delete the oldest row (first row)
        removeRow(1);
    }

    QSqlQuery query(m_db);
    query.prepare("INSERT INTO system_log (timestamp, category, eventname, eventvalue, source) VALUES (:timestamp, :category, :eventname, :eventvalue, :source)");
    query.bindValue(":timestamp", timestamp);
    query.bindValue(":category", category);
    query.bindValue(":eventname", eventname);
    query.bindValue(":eventvalue", eventvalue);
    query.bindValue(":source", source);

    if (!query.exec()) {
        qDebug() << "Error inserting data:" << query.lastError().text();
        return;
    }

   fetchData(m_currentPage);
    emit layoutChanged();
    // Notify views that the data has changed
    emit dataChanged(createIndex(0, 0), createIndex(rowCount() - 1, columnCount() - 1));
// updatePagination();
}

void TableModel2::removeRow(int row)
{
    if (row < 0 || row >= m_data.size())
        return;

    QString timestamp = m_data[row]["timestamp"].toString();
    QSqlQuery query(m_db);
    query.prepare("DELETE FROM system_log WHERE timestamp = :timestamp");
    query.bindValue(":timestamp", timestamp);

    if (!query.exec()) {
        qDebug() << "Error deleting row:" << query.lastError().text();
        return;
    }

    beginRemoveRows(QModelIndex(), row, row);
    m_data.removeAt(row);
    endRemoveRows();
  //  updatePagination();
}
void TableModel2::nextPage()
{
    qDebug()<<"next function ";
    qDebug()<<m_currentPage<<"current page in next";
    if (m_currentPage < m_totalPages - 1) {
        qDebug()<<m_currentPage;
        ++m_currentPage;
        fetchData(m_currentPage);
    }
}

void TableModel2::previousPage()
{
    qDebug()<<"previous function";
    qDebug()<<m_currentPage<<"current page in prev";
    //qDebug()<<m_totalPages<<" total pages ";
    if (m_currentPage > 0) {
        qDebug()<<m_currentPage;
        --m_currentPage;
       fetchData(m_currentPage);
    }
}

void TableModel2::updatePagination()
{
    // Fetch total number of rows
    QSqlQuery countQuery("SELECT COUNT(*) FROM system_log");
    if (countQuery.next()) {
        int totalRows = countQuery.value(0).toInt();
        m_totalPages = totalRows / m_pageSize + (totalRows % m_pageSize == 0 ? 0 : 1);
        qDebug()<<m_totalPages<<" total pages ";
    }
}

