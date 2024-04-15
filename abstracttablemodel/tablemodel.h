#ifndef TABLEMODEL_H
#define TABLEMODEL_H

#include <QAbstractTableModel>
#include <QList>
#include <QVariantMap>

class TableModel : public QAbstractTableModel
{
    Q_OBJECT

public:
    explicit TableModel(QObject *parent = nullptr);

    enum Role {
        NameRole = Qt::UserRole ,
        PasswordRole,
        PasswordcRole,
        AgeRole,
        GenderRole
    };

    // Methods for the model interface
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    int columnCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;
    // Method to fetch data from the database
    void fetchData();

protected:
    QHash<int, QByteArray> roleNames() const override;

private:
    QList<QVariantMap> m_data; // Data retrieved from the database
    QModelIndex m_currentIndex;
};

#endif // TABLEMODEL_H
