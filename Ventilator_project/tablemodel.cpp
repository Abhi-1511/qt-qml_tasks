#include "TableModel.h"
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QDebug>
#include <QSqlError>
TableModel::TableModel(QObject *parent)
    : QAbstractTableModel(parent)
{
    QString dbFilePath = "VentilatorProject.db";
    m_db = QSqlDatabase::addDatabase("QSQLITE");
    m_db.setDatabaseName(dbFilePath);
    m_db.open();
     fetchData(m_currentPage);
    updatePagination();
}

void TableModel::fetchData(int page)
{
    int offset = page * m_pageSize;
    QSqlDatabase db = QSqlDatabase::database();

    m_data.clear();
    QSqlQuery query;
    query.prepare("SELECT * FROM monitor_log LIMIT :pageSize OFFSET :offset");
    query.bindValue(":pageSize", m_pageSize);
    query.bindValue(":offset", offset);
    if (!query.exec()) {
        qDebug() << "Error fetching data:" << query.lastError().text();
        return;
    }

    while (query.next()) {
        QVariantMap row;
        row["timestamp"] = query.value("timestamp").toString();
        row["parameterid"] = query.value("parameterid").toString();
        row["parametervalue"] = query.value("parametervalue").toString();
        m_data.append(row);
    }
    updatePagination();
    //fetchData(m_currentPage);
    emit dataChanged(createIndex(0, 0), createIndex(rowCount() - 1, columnCount() - 1));
}


int TableModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;

    return m_data.size();
}

int TableModel::columnCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;

    // Assuming all rows have the same number of columns
    return m_data.isEmpty() ? 0 : m_data.first().keys().size();
}

QVariant TableModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || index.row() >= m_data.size() || index.column() >= columnCount())
        return QVariant();

    if (role >= Qt::UserRole) {
        const QVariantMap &row = m_data[index.row()];
        switch (role) {
        case TimestampRole:
            return row.value("timestamp").toString();
        case ParameterIDRole:
            return row.value("parameterid").toString();
        case ParameterValueRole:
            return row.value("parametervalue").toString();
        }
    }

    return QVariant();
}


QVariant TableModel::headerData(int section, Qt::Orientation orientation, int role) const
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

QHash<int, QByteArray> TableModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[TimestampRole] = "timestamp";
    roles[ParameterIDRole] = "parameterid";
    roles[ParameterValueRole] = "parametervalue";
    return roles;
}
void TableModel::insertData(const QString &timestamp, const QString &parameterId, const QString &parameterValue)
{
    qDebug() <<rowCount()<<" row count ";
    if (rowCount() >= 12) {
        qDebug() << "Maximum capacity reached. Deleting oldest row and inserting new data.";

        // Delete the oldest row (first row)
        removeRow(1);
    }
    // Prepare the SQL query
    QSqlQuery query;
    query.prepare("INSERT INTO monitor_log (timestamp, parameterid, parametervalue) VALUES (:timestamp, :parameterid, :parametervalue)");

    // Bind values to the query
    query.bindValue(":timestamp", timestamp);
    query.bindValue(":parameterid", parameterId);
    query.bindValue(":parametervalue", parameterValue);

    // Execute the query
    if (!query.exec()) {
        qDebug() << "Error inserting data:" << query.lastError().text();
        return;
    }

    // If insertion is successful, fetch the updated data
   fetchData(m_currentPage);
    updatePagination();
    emit layoutChanged();
    // Notify views that the data has changed
    emit dataChanged(createIndex(0, 0), createIndex(rowCount() - 1, columnCount() - 1));
}
void TableModel::removeRow(int row)
{
    qDebug() << "removerow inside";
    if (row < 0 || row >= m_data.size())
        return;

    // Extract the primary key of the row to be deleted
    QString timestamp = m_data[row]["timestamp"].toString(); // Assuming "timestamp" is the primary key

    // Prepare the SQL query to delete the row from the database table
    QSqlQuery query;
    query.prepare("DELETE FROM monitor_log WHERE timestamp = :timestamp");
    query.bindValue(":timestamp", timestamp);

    // Execute the query
    if (!query.exec()) {
        qDebug() << "Error deleting row:" << query.lastError().text();
        return;
    }
    fetchData(m_currentPage);
    updatePagination();
    // Remove the row from the internal data structure (m_data)
    beginRemoveRows(QModelIndex(), row, row);
    m_data.removeAt(row);
    endRemoveRows();
}
void TableModel::nextPage()
{
    if (m_currentPage < m_totalPages - 1) {
        ++m_currentPage;
        fetchData(m_currentPage);
    }
}

void TableModel::previousPage()
{
    if (m_currentPage > 0) {
        --m_currentPage;
        fetchData(m_currentPage);
    }
}

void TableModel::updatePagination()
{
    QSqlQuery countQuery("SELECT COUNT(*) FROM monitor_log");
    if (countQuery.next()) {
        int totalRows = countQuery.value(0).toInt();
        m_totalPages = totalRows / m_pageSize + (totalRows % m_pageSize == 0 ? 0 : 1);
    }
     emit currentPageChanged(m_currentPage);
}
