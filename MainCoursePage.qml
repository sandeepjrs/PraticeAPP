import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick 2.0

Item
{
    property real mainCourse_hight : Screen.height
    property real mainCourse_width : Screen.width
    property real mainCourse_colum: 5
    property real mainCourse_row: 3
    property real marginBetweenEachCell: 4
    property real widthForOneCell: (mainCourse_width- (marginBetweenEachCell*mainCourse_colum))/mainCourse_colum
    property real heightForOneCell : (mainCourse_hight-marginBetweenEachCell*mainCourse_row)/mainCourse_row



    signal mc_Clicked(string itm, string prc)
    height: mainCourse_hight
    width: mainCourse_width
    id:root

    Component {
        id: myDeligate


        Rectangle {

            height: heightForOneCell
            width: widthForOneCell

            border.color: "white"
            border.width: 3
            color: "red"
            Text {
                id: tex11
                text: mainCourseItem + "  "+ mainCoursePrice
                anchors.centerIn: parent
                font.pixelSize: 30


            }
            MouseArea
            {
                anchors.fill: parent
                onPressed:  {

                    parent.color ="blue"
                }

                onReleased:  {
                    parent.color ="red"
                    mc_Clicked(MainCourseItem,MainCoursePrice)

                }


            }



        }
    }

    GridView
    {

        anchors.fill: parent
        anchors.leftMargin: marginBetweenEachCell*2.5

        cellWidth: widthForOneCell; cellHeight: heightForOneCell
        model: mainCourseModel

        delegate: myDeligate



    }

}
