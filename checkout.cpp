#include "checkout.h"


Checkout::Checkout(const QString &item, const int &Amount, const int quantity, const int &singleItemPrice)
    :m_amount(Amount), m_item(item), m_quantity(quantity),m_singleItemPrice(singleItemPrice)
{

}

int Checkout::get_Amount() const
{
    return m_amount;
}

int Checkout:: get_quantity() const
{
    return m_quantity;
}

int Checkout::get_singleItemPrice() const
{
    return m_singleItemPrice;
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

    else if (role==e_quantity)
        return checkoutObject.get_quantity();

    else if (role==e_singleItemPrice)
        return checkoutObject.get_singleItemPrice();

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

int CheckoutModel::searchItemGetQuantity(QString item)
{

    if(m_amount.count()==0)
    {
        qWarning()<<"No item in checkout model";
        return -1;
    }
    else
    {
        for(int i=0;i<m_amount.count();i++)
        {
            if(m_amount.at(i).get_Itemt()==item)
            {
                //quant++;
                //quant=m_amount.at(i).get_quantity();
                qWarning()<<"chk running";
                return i;


            }

        }

        return -1;
    }

    qWarning()<<"function out";


}

void CheckoutModel::addRawItem(QString item, int price)
{
    int amt_index;
    amt_index=searchItemGetQuantity(item);
    qWarning()<<"amt index  "+ amt_index;
    if(amt_index==-1)
    {
        addCheckoutItem(Checkout(item,price,1,price));
    }
    else
    {

        int quant=m_amount.at(amt_index).get_quantity()+1;
        addCheckoutItem(Checkout(item,quant*price,quant,price));
        removeData(amt_index);
    }
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
    roles[e_quantity]="chkQuantity";
    roles[e_item] = "chkItem";
    roles[e_singleItemPrice] = "chkSingleItemPrice";
    return roles;

}
