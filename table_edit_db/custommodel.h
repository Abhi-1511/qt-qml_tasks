// custommodel.h
#ifndef CUSTOMMODEL_H
#define CUSTOMMODEL_H

#include <QAbstractTableModel>
#include <QSqlTableModel>

class CustomModel : public QAbstractTableModel
{
    Q_OBJECT

public:
    explicit CustomModel(QObject *parent = nullptr);
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    int columnCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole) override;

private:
     QSqlDatabase m_db;
    QSqlTableModel *m_sqlModel;
};

#endif // CUSTOMMODEL_H
