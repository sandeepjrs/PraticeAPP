import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick 2.0

Item
{
    property real mainCourse_hight : Screen.height
    property real mainCourse_width : Screen.width
    property real mainCourse_colum: mainCourse_hight>mainCourse_width ? 2 : 5
    property real mainCourse_row: mainCourse_hight>mainCourse_width ? 5 : 3
    property real marginBetweenEachCell: 0
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
            color: "yellow"
            Button {
                id: tex11
                text: mainCourseItem + "  "+ mainCoursePrice
                anchors.fill: parent
                //font.pixelSize: 30
                onClicked: {
                     mc_Clicked(mainCourseItem,mainCoursePrice)
                }


            }
//            MouseArea
//            {
//                anchors.fill: parent
//                onPressed:  {

//                    parent.color ="blue"
//                }

//                onReleased:  {
//                    parent.color ="red"
//                    mc_Clicked(MainCourseItem,MainCoursePrice)

//                }


//            }



        }
    }

    GridView
    {

        anchors.fill: parent
        anchors.leftMargin: marginBetweenEachCell*2.5
        anchors.bottomMargin: mainCourse_hight-mainCourse_hight*.82
        cellWidth: widthForOneCell; cellHeight: heightForOneCell
        model: mainCourseModel

        delegate: myDeligate



    }

}
