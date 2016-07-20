#include "maincourse.h"



MainCourse::MainCourse(const QString &stItem, const QString &stPrice)
    : m_stItem(stItem), m_stPrice(stPrice)
{

}

QString MainCourse::get_stItem() const
{

    return m_stItem;
}

QString MainCourse::get_stPrice() const
{
    return m_stPrice;
}


MainCourseModel::MainCourseModel(QObject *parent)
: QAbstractListModel(parent)
{

}

void MainCourseModel::addMainCourseItem(const MainCourse &mainCourse)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_MainCourses << mainCourse;
    endInsertRows();
}

int MainCourseModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_MainCourses.count();
}

QVariant MainCourseModel::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= m_MainCourses.count())
            return QVariant();

        const MainCourse &MainCourseObject = m_MainCourses[index.row()];
        if (role == e_stItemRole)
            return MainCourseObject.get_stItem();
        else if (role == e_stPriceRole)
            return MainCourseObject.get_stPrice();
        return QVariant();

}

QHash<int, QByteArray> MainCourseModel::roleNames() const
{
    QHash<int, QByteArray> roles;
       roles[e_stItemRole] = "mainCourseItem";
       roles[e_stPriceRole] = "mainCoursePrice";
       return roles;

}


