#ifndef CHECKOUT_H
#define CHECKOUT_H

#include <QAbstractListModel>
#include <QDebug>

class Checkout
{
public:
    Checkout(const QString &item,const int &Amount);

    int get_Amount() const;
    QString get_Itemt() const;


private:
    int m_amount;
    QString m_item;

};




class CheckoutModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum StarterRoles {
        e_amount = Qt::UserRole + 1,
        e_item

    };

    CheckoutModel(QObject *parent = 0);
    void addCheckoutItem(const Checkout &amount);
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;


    //public slots:

    Q_INVOKABLE void addRawItem(QString item,int price);
    Q_INVOKABLE int getTotalCost();
    Q_INVOKABLE bool removeData(int index);
    Q_INVOKABLE int getAmount(int i);
    Q_INVOKABLE QString getItem(int i);





protected:
    QHash<int, QByteArray> roleNames() const;



private :
    QList<Checkout> m_amount;
};
#endif // CHECKOUT_H
