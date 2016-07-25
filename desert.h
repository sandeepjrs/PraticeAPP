#ifndef DESERT_H
#define DESERT_H


#include <QAbstractListModel>


class Desert
{
public:
    Desert(const QString &sId,const QString &stItem, const QString &stPrice);

    QString get_stItem() const;
    QString get_stPrice() const;
    QString get_stId() const;

private:
    QString m_stItem;
    QString m_stPrice;
     QString m_sid;
};




class DesertModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum StarterRoles {
        e_stItemRole = Qt::UserRole + 1,
        e_stPriceRole,
        e_sId
    };

    DesertModel(QObject *parent = 0);
    void addDesertItem(const Desert &desert);
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
     QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

     QList<Desert> getStarterList();

protected:
    QHash<int, QByteArray> roleNames() const;



private :
    static QList<Desert> m_Deserts;
};


#endif // DESERT_H
