#include "custommodel.h"
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QDebug>


CustomModel::CustomModel(QObject *parent)
    : QAbstractTableModel(parent)
{
    // Open the database
    m_db = QSqlDatabase::addDatabase("QSQLITE");
    m_db.setDatabaseName("datastorevaluenow.db");

    if (!m_db.open()) {
        qDebug() << "Error: Failed to open database." << m_db.lastError().text();
        return;
    }

    // Create the QSqlTableModel
    m_sqlModel = new QSqlTableModel(this, m_db);
    m_sqlModel->setTable("details");
    m_sqlModel->select(); // Fetch data from the table
}

int CustomModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return m_sqlModel->rowCount();
}

int CustomModel::columnCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return m_sqlModel->columnCount();
}

QVariant CustomModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    if (role == Qt::DisplayRole) {
        // Display data from the database
        return m_sqlModel->data(m_sqlModel->index(index.row(), index.column()));
    }

    return QVariant();
}

QVariant CustomModel::headerData(int section, Qt::Orientation orientation, int role) const
{
    if (role != Qt::DisplayRole)
        return QVariant();

    if (orientation == Qt::Horizontal) {
        // Fetch column header data from QSqlTableModel
        return m_sqlModel->headerData(section, orientation, Qt::DisplayRole);
    } else {
        return section + 1; // Display row numbers for vertical headers
    }
}

bool CustomModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    Q_UNUSED(index)
    Q_UNUSED(value)
    Q_UNUSED(role)
    return false; // Indicate that editing is not supported
}
