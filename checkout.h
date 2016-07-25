#ifndef CHECKOUT_H
#define CHECKOUT_H

#include <QAbstractListModel>
#include <QDebug>

class Checkout
{
public:
    Checkout(const QString &id,const QString &item, const int &Amount, const int quantity, const int &singleItemPrice);

    QString get_id() const;
    int get_Amount() const;
    int get_quantity() const;
    int get_singleItemPrice() const;
    QString get_Itemt() const;



private:
    QString m_id;
    int m_amount;
    int m_quantity;
    int m_singleItemPrice;
    QString m_item;

};




class CheckoutModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum StarterRoles {
        e_amount = Qt::UserRole + 1,
        e_quantity,
        e_item,
        e_singleItemPrice,
        e_id

    };

    CheckoutModel(QObject *parent = 0);
    void addCheckoutItem(const Checkout &amount);
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;


    //public slots:

    Q_INVOKABLE void addRawItem(QString id,QString item, int price);
    Q_INVOKABLE int getTotalCost();
    Q_INVOKABLE bool removeData(int index);
    Q_INVOKABLE int getAmount(int i);
    Q_INVOKABLE void removeAllData();
    QString getItem(int i);
    int searchItemGetQuantity(QString item);





protected:
    QHash<int, QByteArray> roleNames() const;



private :
    QList<Checkout> m_amount;
};
#endif // CHECKOUT_H
