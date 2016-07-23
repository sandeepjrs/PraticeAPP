#ifndef SEARCH_H
#define SEARCH_H


#include <QAbstractListModel>
#include <QDebug>

#include "starter.h"
#include "maincourse.h"
#include "desert.h"

class Search
{
public:
    Search(const QString id,const QString &item, const QString &singleItemPrice);

    QString get_Id() const;
    QString get_singleItemPrice() const;
    QString get_Item() const;



private:
    QString m_id;
    QString m_singleItemPrice;
    QString m_item;

};




class SearchModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum SearchRoles {
        e_id = Qt::UserRole + 1,
        e_item,
        e_singleItemPrice

    };

    SearchModel(QObject *parent = 0);
    void addSearchItem(const Search &searchItem);
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;


    //public slots:

    Q_INVOKABLE void search(QString item);
    Q_INVOKABLE bool removeAllData();







protected:
    QHash<int, QByteArray> roleNames() const;



private :
    QList<Search> m_SearchData;
};


#endif // SEARCH_H
