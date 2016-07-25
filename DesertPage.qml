import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick 2.0

Item
{
    property real desert_hight : Screen.height
    property real desert_width : Screen.width
    property real desert_colum: desert_hight>desert_width ? 2 : 5
    property real desert_row: desert_hight>desert_width ? 5 : 3
    property real marginBetweenEachCell: 0
    property real widthForOneCell: (desert_width- (marginBetweenEachCell*desert_colum))/desert_colum
    property real heightForOneCell : (desert_hight-marginBetweenEachCell*desert_row)/desert_row



    signal d_Clicked(string id,string itm, string prc)
    height: desert_hight
    width: desert_width
    id:root

    Component {
        id: myDeligate


        Rectangle {

            height: heightForOneCell
            width: widthForOneCell

            border.color: "white"
            border.width: 3
            color: "pink"
            Button {

                Column{
                    spacing: 1
                    Rectangle{height: heightForOneCell-heightForOneCell*.86;width: 150;Text{text: desertId;font.pixelSize: 20;anchors.centerIn: parent } color: "transparent"}
                    Rectangle{height: heightForOneCell-heightForOneCell*.86;width: 150;Text{text: "<b>"+desertItem;font.pixelSize: 35;anchors.centerIn: parent;font.capitalization:Font.Capitalize} color: "transparent"}
                    Rectangle{height: heightForOneCell-heightForOneCell*.86;width: 150;Text{text: "Rs. <b>"+desertPrice;font.pixelSize: 25;anchors.centerIn: parent } color: "transparent"}
                    anchors.centerIn: parent
                }
                anchors.fill: parent
                onClicked: {
                    d_Clicked(desertId,desertItem,desertPrice)
                }


            }




        }
    }

    GridView
    {

        anchors.fill: parent
        anchors.leftMargin: marginBetweenEachCell*2.5
        anchors.bottomMargin: desert_hight-desert_hight*.82
        cellWidth: widthForOneCell; cellHeight: heightForOneCell
        model: desertModel
        maximumFlickVelocity:10000
        delegate: myDeligate



    }

}
