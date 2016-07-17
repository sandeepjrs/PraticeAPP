#include "checkout.h"


Checkout::Checkout(const QString &item, const int &Amount)
    :m_amount(Amount), m_item(item)
{

}

int Checkout::get_Amount() const
{
    return m_amount;
}

QString Checkout::get_Itemt() const
{
    return m_item;
}

CheckoutModel::CheckoutModel(QObject *parent)
    :QAbstractListModel(parent)
{

}

void CheckoutModel::addCheckoutItem(const Checkout &amount)
{

    beginInsertRows(QModelIndex(), rowCount(),rowCount());
    m_amount<<amount;
    endInsertRows();
}

int CheckoutModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_amount.count();
}

QVariant CheckoutModel::data(const QModelIndex &index, int role) const
{

    if (index.row() < 0 || index.row() >= m_amount.count())
        return QVariant();

    const Checkout &checkoutObject = m_amount[index.row()];
    if (role == e_amount)
        return checkoutObject.get_Amount();

    else if (role == e_item)
        return checkoutObject.get_Itemt();

    return QVariant();
}

bool CheckoutModel::removeData(int index)
{
     beginRemoveRows(QModelIndex(),index,index);
     m_amount.removeAt(index);
     endRemoveRows();
     return 0;
}

int CheckoutModel::getAmount(int i)
{
    return m_amount.at(i).get_Amount();
}

QString CheckoutModel::getItem(int i)
{
    return m_amount.at(i).get_Itemt();
}

void CheckoutModel::addRawItem(QString item, int price)
{
    addCheckoutItem(Checkout(item,price));
}

int CheckoutModel::getTotalCost()
{
   int am=0;
   if(m_amount.count()!=1)
   {
    for(int i=0;i<rowCount();i++)
    {
       am+=m_amount.at(i).get_Amount();

    }

    return am;
   }

   return m_amount.at(0).get_Amount();

}

QHash<int, QByteArray> CheckoutModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[e_amount] = "chkAmount";
    roles[e_item] = "chkItem";
    return roles;

}
