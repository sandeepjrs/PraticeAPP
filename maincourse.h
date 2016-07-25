#ifndef MAINCOURSE_H
#define MAINCOURSE_H



#include <QAbstractListModel>


class MainCourse
{
public:
    MainCourse(const QString &sId,const QString &stItem, const QString &stPrice);

    QString get_stItem() const;
    QString get_stPrice() const;
    QString get_stId() const;

private:
    QString m_stItem;
    QString m_stPrice;
    QString m_sid;
};




class MainCourseModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum StarterRoles {
        e_stItemRole = Qt::UserRole + 1,
        e_stPriceRole,
        e_sId
    };

    MainCourseModel(QObject *parent = 0);
    void addMainCourseItem(const MainCourse &mainCourse);
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

    QList<MainCourse> getStarterList();

protected:
    QHash<int, QByteArray> roleNames() const;



private :
    static QList<MainCourse> m_MainCourses;
};

#endif // MAINCOURSE_H
