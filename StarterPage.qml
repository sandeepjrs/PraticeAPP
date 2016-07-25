import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick 2.0

Item
{
    property real starter_hight : Screen.height
    property real starter_width : Screen.width
    property real starter_colum: starter_hight>starter_width ? 2 : 5
    property real starter_row: starter_hight>starter_width ? 5 : 3
    property real marginBetweenEachCell: 0
    property real widthForOneCell: (starter_width- (marginBetweenEachCell*starter_colum))/starter_colum
    property real heightForOneCell : (starter_hight-marginBetweenEachCell*starter_row)/starter_row



    signal s_Clicked(string id,string itm, string prc)
    height: starter_hight
    width: starter_width
    id:root




    Component {
        id: myDeligate


        Rectangle {


            height: heightForOneCell
            width: widthForOneCell

            border.color: "white"
            border.width: 3
            color: "lightgreen"

            Button
            {

                Column{
                    spacing: 1
                    Rectangle{height: heightForOneCell-heightForOneCell*.86;width: 150;Text{text: stId;font.pixelSize: 20;anchors.centerIn: parent } color: "transparent"}
                    Rectangle{height: heightForOneCell-heightForOneCell*.86;width: 150;Text{text: "<b>"+stItem;font.pixelSize: 35;anchors.centerIn: parent;font.capitalization:Font.Capitalize} color: "transparent"}
                    Rectangle{height: heightForOneCell-heightForOneCell*.86;width: 150;Text{text: "Rs. <b>"+stPrice;font.pixelSize: 25;anchors.centerIn: parent } color: "transparent"}
                    anchors.centerIn: parent
                }
                anchors.fill: parent

                onClicked:
                {
                    s_Clicked(stId,stItem,stPrice)
                }
            }



        }
    }

    GridView
    {

        anchors.fill: parent
        anchors.leftMargin: marginBetweenEachCell*2.5
        anchors.bottomMargin: starter_hight-starter_hight*.82
        maximumFlickVelocity:10000

        cellWidth: widthForOneCell; cellHeight: heightForOneCell
        model: stModel

        delegate: myDeligate



    }

}
