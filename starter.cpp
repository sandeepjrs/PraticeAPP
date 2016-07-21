#include "starter.h"

QList<Starter> StarterModel::m_starters;
Starter::Starter(const QString &sId,const QString &stItem, const QString &stPrice)
    : m_stItem(stItem), m_stPrice(stPrice), m_sid(sId)
{

}

QString Starter::get_stItem() const
{

    return m_stItem;
}

QString Starter::get_stPrice() const
{
    return m_stPrice;
}

QString Starter::get_stId() const
{
    return m_sid;
}


StarterModel::StarterModel(QObject *parent)
    : QAbstractListModel(parent)
{

}

void StarterModel::addStarterItem(const Starter &starter)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_starters << starter;
    endInsertRows();

}

int StarterModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_starters.count();
}

QVariant StarterModel::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= m_starters.count())
        return QVariant();

    const Starter &starterObject = m_starters[index.row()];
    if (role == e_stItemRole)
        return starterObject.get_stItem();
    else if (role == e_stPriceRole)
        return starterObject.get_stPrice();
    else if(role==e_sId)
        return starterObject.get_stId();
    return QVariant();

}

QList<Starter> StarterModel::getStarterList()
{
    return m_starters;

}



QHash<int, QByteArray> StarterModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[e_stItemRole] = "stItem";
    roles[e_stPriceRole] = "stPrice";
    roles[e_sId]="stId";
    return roles;

}
