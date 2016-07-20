#ifndef MAINCOURSE_H
#define MAINCOURSE_H



#include <QAbstractListModel>


class MainCourse
{
public:
    MainCourse(const QString &stItem, const QString &stPrice);

    QString get_stItem() const;
    QString get_stPrice() const;

private:
    QString m_stItem;
    QString m_stPrice;
};




class MainCourseModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum StarterRoles {
        e_stItemRole = Qt::UserRole + 1,
        e_stPriceRole
    };

    MainCourseModel(QObject *parent = 0);
    void addMainCourseItem(const MainCourse &mainCourse);
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
     QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;


protected:
    QHash<int, QByteArray> roleNames() const;



private :
    QList<MainCourse> m_MainCourses;
};

#endif // MAINCOURSE_H
