// custommodel.h
#ifndef CUSTOMMODEL_H
#define CUSTOMMODEL_H

#include <QAbstractListModel>
#include <QSqlTableModel>

class CustomModel : public QAbstractListModel
{
    Q_OBJECT

public:
    explicit CustomModel(QObject *parent = nullptr);
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole) override;

private:
    QSqlTableModel *m_sqlModel;
};

#endif // CUSTOMMODEL_H
