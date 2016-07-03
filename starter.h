#ifndef STARTER_H
#define STARTER_H
#include <QAbstractListModel>


class Starter
{
public:
    Starter(const QString &stItem, const QString &stPrice);

    QString get_stItem() const;
    QString get_stPrice() const;

private:
    QString m_stItem;
    QString m_stPrice;
};




class StarterModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum StarterRoles {
        e_stItemRole = Qt::UserRole + 1,
        e_stPriceRole
    };

    StarterModel(QObject *parent = 0);
    void addStarterItem(const Starter &starter);
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
     QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;


protected:
    QHash<int, QByteArray> roleNames() const;



private :
    QList<Starter> m_starters;
};

#endif // STARTER_H
