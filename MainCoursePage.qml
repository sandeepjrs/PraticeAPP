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



    signal mc_Clicked(string id,string itm, string prc)
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

                Column{
                    spacing: 1
                    Rectangle{height: heightForOneCell-heightForOneCell*.86;width: 150;Text{text: mainCourseId;font.pixelSize: 20;anchors.centerIn: parent } color: "transparent"}
                    Rectangle{height: heightForOneCell-heightForOneCell*.86;width: 150;Text{text: "<b>"+mainCourseItem;font.pixelSize: 35;anchors.centerIn: parent;font.capitalization:Font.Capitalize} color: "transparent"}
                    Rectangle{height: heightForOneCell-heightForOneCell*.86;width: 150;Text{text: "Rs. <b>"+mainCoursePrice;font.pixelSize: 25;anchors.centerIn: parent } color: "transparent"}
                    anchors.centerIn: parent
                }
                 anchors.fill: parent
                onClicked: {
                     mc_Clicked(mainCourseId,mainCourseItem,mainCoursePrice)
                }


            }




        }
    }

    GridView
    {

        anchors.fill: parent
        anchors.leftMargin: marginBetweenEachCell*2.5
        anchors.bottomMargin: mainCourse_hight-mainCourse_hight*.82
        cellWidth: widthForOneCell; cellHeight: heightForOneCell
        model: mainCourseModel
        maximumFlickVelocity:10000
        delegate: myDeligate



    }

}
