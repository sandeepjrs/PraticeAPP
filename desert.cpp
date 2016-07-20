#include "desert.h"


Desert::Desert(const QString &stItem, const QString &stPrice)
    : m_stItem(stItem), m_stPrice(stPrice)
{

}

QString Desert::get_stItem() const
{

    return m_stItem;
}

QString Desert::get_stPrice() const
{
    return m_stPrice;
}


DesertModel::DesertModel(QObject *parent)
: QAbstractListModel(parent)
{

}

void DesertModel::addDesertItem(const Desert &desert)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_Deserts << desert;
    endInsertRows();
}

int DesertModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_Deserts.count();
}

QVariant DesertModel::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= m_Deserts.count())
            return QVariant();

        const Desert &DesertObject = m_Deserts[index.row()];
        if (role == e_stItemRole)
            return DesertObject.get_stItem();
        else if (role == e_stPriceRole)
            return DesertObject.get_stPrice();
        return QVariant();

}

QHash<int, QByteArray> DesertModel::roleNames() const
{
    QHash<int, QByteArray> roles;
       roles[e_stItemRole] = "desertItem";
       roles[e_stPriceRole] = "desertPrice";
       return roles;

}

