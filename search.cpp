#include "search.h"



Search::Search(const QString id, const QString &item, const QString &singleItemPrice)
    :m_id(id),m_item(item),m_singleItemPrice(singleItemPrice)
{



}

QString Search::get_Id() const
{
    return m_id;
}

QString Search::get_singleItemPrice() const
{
    return m_singleItemPrice;
}

QString Search::get_Item() const
{
    return m_item;
}

SearchModel::SearchModel(QObject *parent)
    :QAbstractListModel(parent)
{

}

void SearchModel::addSearchItem(const Search &searchItem)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_SearchData << searchItem;
    endInsertRows();

}

int SearchModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_SearchData.count();
}

QVariant SearchModel::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= m_SearchData.count())
        return QVariant();

    const Search &searchObject = m_SearchData[index.row()];
    if (role == e_id)
        return searchObject.get_Id();
    else if (role == e_item)
        return searchObject.get_Item();
    else if(role==e_singleItemPrice)
        return searchObject.get_singleItemPrice();
    return QVariant();
}


void SearchModel::search(QString item)
{
    if(item=="")
    {

    }
    else
    {
        StarterModel strModel;
        for (int i = 0; i < strModel.rowCount(); i++)
        {
            if(strModel.getStarterList().at(i).get_stItem().startsWith(item,Qt::CaseInsensitive))
            {
                qWarning()<<"yes I am present  "+strModel.getStarterList().at(i).get_stItem();
                addSearchItem(Search(strModel.getStarterList().at(i).get_stId(),
                                     strModel.getStarterList().at(i).get_stItem(),
                                     strModel.getStarterList().at(i).get_stPrice()));
            }
        }
    }


}


bool SearchModel::removeAllData()
{
    for(int index=m_SearchData.count();index>=0;index--)
    {
        beginRemoveRows(QModelIndex(),index,index);
        m_SearchData.removeAt(index);
        endRemoveRows();
    }
    return 0;

}



QHash<int, QByteArray> SearchModel::roleNames() const
{

    QHash<int, QByteArray> roles;
    roles[e_id] = "searchId";
    roles[e_item] = "searchItem";
    roles[e_singleItemPrice]="searchPrice";
    return roles;

}
