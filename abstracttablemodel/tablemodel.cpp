#include "TableModel.h"
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QDebug>
#include <QSqlError>
TableModel::TableModel(QObject *parent)
    : QAbstractTableModel(parent)
{
    // Fetch data from the database
    fetchData();
}

void TableModel::fetchData()
{
    // Initialize SQLite database
    QSqlDatabase db = QSqlDatabase::database();

    // Clear existing data
    m_data.clear();

    // Fetch data from the 'details' table
    QSqlQuery query("SELECT * FROM details");

    while (query.next()) {
        QVariantMap row;
        row["name"] = query.value("name").toString();
        row["password"] = query.value("password").toString();
        row["passwordc"] = query.value("passwordc").toString();
        row["agess"] = query.value("agess").toInt();
        row["gender"] = query.value("gender").toString();
        m_data.append(row);
    }

    // Notify views that data has changed
    //emit dataChanged(createIndex(0, 0), createIndex(rowCount() - 1, columnCount() - 1));
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
        case NameRole:
            return row.value("name").toString();
        case PasswordRole:
            return row.value("password").toString();
        case PasswordcRole:
            return row.value("passwordc").toString();
        case AgeRole:
            return row.value("agess").toInt();
        case GenderRole:
            return row.value("gender").toString();
        }
    }

    return QVariant();
}


QVariant TableModel::headerData(int section, Qt::Orientation orientation, int role) const
{
    if (role != Qt::DisplayRole)
        return QVariant();

    if (orientation == Qt::Horizontal) {
        // Assuming column names are stored as keys in the first row of m_data
        return m_data.isEmpty() ? QVariant() : m_data.first().keys().at(section);
    } else {
        // Return row numbers for vertical headers
        return section + 1;
    }
}

QHash<int, QByteArray> TableModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[PasswordRole] = "password";
    roles[PasswordcRole] = "passwordc";
    roles[AgeRole] = "agess";
    roles[GenderRole] = "gender";
    return roles;
}
bool TableModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    qDebug() << "Getting inside setData:";

    // Ensure the role is EditRole
    // if (role != Qt::EditRole){
    //     qDebug() << "Getting inside setData:Qt::EditRole";
    //     return false;
    // }

    // Check if the index is valid and within the bounds of the model's data
    if (index.isValid() && index.row() < m_data.size() && index.column() < columnCount()) {
        qDebug() << "Getting inside setData's 1st if:";
        QVariantMap &row = m_data[index.row()]; // Get the item at the given index

        // Update the item's data based on the specified role
        switch (role) {
        case 0: // Name
            row["name"] = value.toString();
            qDebug() << "case0 name";
            break;
        case 1: // Password
            row["password"] = value.toString();
            qDebug() << "case1 password";
            break;
        case 2: // Password Confirmation
            row["passwordc"] = value.toString();
            qDebug() << "case2 passname";
            break;
        case 3: // Age
            row["agess"] = value.toInt();
            qDebug() << "case3 age";
            break;
        case 4: // Gender
            row["gender"] = value.toString();
            qDebug() << "case4 gender";
            break;
        default:
            return false;
        }

        // Update the corresponding data in the database
        QSqlQuery query;
        query.prepare("UPDATE details SET password = :password, passwordc = :passwordc, agess = :age, gender = :gender WHERE name = :name");
        query.bindValue(":name", row["name"]);
        query.bindValue(":password", row["password"]);
        query.bindValue(":passwordc", row["passwordc"]);
        query.bindValue(":age", row["agess"]);
        query.bindValue(":gender", row["gender"]);

        qDebug() << "Name:" << row["name"];
        qDebug() << "Password:" << row["password"];
        qDebug() << "Password Confirmation:" << row["passwordc"];
        qDebug() << "Age:" << row["agess"];
        qDebug() << "Gender:" << row["gender"];
        if (!query.exec()) {
            qDebug() << "Error updating record:" << query.lastError().text();
            return false;
        }

        // Emit the dataChanged signal to notify views of the change
        emit dataChanged(index, index, {Qt::EditRole});
        return true;
    }

    return false;
}
