#ifndef DESERT_H
#define DESERT_H


#include <QAbstractListModel>


class Desert
{
public:
    Desert(const QString &stItem, const QString &stPrice);

    QString get_stItem() const;
    QString get_stPrice() const;

private:
    QString m_stItem;
    QString m_stPrice;
};




class DesertModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum StarterRoles {
        e_stItemRole = Qt::UserRole + 1,
        e_stPriceRole
    };

    DesertModel(QObject *parent = 0);
    void addDesertItem(const Desert &desert);
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
     QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;


protected:
    QHash<int, QByteArray> roleNames() const;



private :
    QList<Desert> m_Deserts;
};


#endif // DESERT_H
