// custommodel.cpp
#include "custommodel.h"
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QDebug>

CustomModel::CustomModel(QObject *parent)
    : QAbstractListModel(parent)
{
    // Open the database
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("datastorevaluenow.db");

    if (!db.open()) {
        qDebug() << "Error: Failed to open database." << db.lastError().text();
        return;
    }

    // Create the QSqlTableModel
    m_sqlModel = new QSqlTableModel(this, db);
    m_sqlModel->setTable("details");
    m_sqlModel->select(); // Fetch data from the table
}

int CustomModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;

    return m_sqlModel->rowCount();
}

// custommodel.cpp
// custommodel.cpp
QVariant CustomModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    if (role == Qt::DisplayRole) {
        QString rowData;
        for (int column = 0; column < m_sqlModel->columnCount(); ++column) {
            if (column > 0)
                rowData += " "; // Add space between columns
            rowData += m_sqlModel->data(m_sqlModel->index(index.row(), column)).toString();
        }
        return rowData;
    }

    return QVariant();
}




QHash<int, QByteArray> CustomModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[Qt::DisplayRole] = "display"; // Role name for displaying data
    return roles;
}

bool CustomModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (!index.isValid() || role != Qt::EditRole)
        return false;

    // Update data in the model
    if (!m_sqlModel->setData(m_sqlModel->index(index.row(), index.column()), value))
        return false;

    // Submit all changes to the database
    if (!m_sqlModel->submitAll()) {
        qDebug() << "Error: Failed to submit changes to the database." << m_sqlModel->lastError().text();
        m_sqlModel->revertAll(); // Revert changes if submission fails
        return false;
    }

    return true;
}
