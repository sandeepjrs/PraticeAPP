import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick 2.0

Item
{
    property real starter_hight : Screen.height
    property real starter_width : Screen.width
    property real starter_colum: 5
    property real starter_row: 3
    property real marginBetweenEachCell: 4
    property real widthForOneCell: (starter_width- (marginBetweenEachCell*starter_colum))/starter_colum
    property real heightForOneCell : (starter_hight-marginBetweenEachCell*starter_row)/starter_row



    signal s_Clicked(string x, string y)
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
            color: "red"
            Text {
                id: tex11
                text: stItem + "  "+ stPrice
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
                    s_Clicked(stItem,stPrice)
                    console.log(starter_width)
                }


            }



        }
    }

    GridView
    {

        anchors.fill: parent
        anchors.leftMargin: marginBetweenEachCell*2.5

        cellWidth: widthForOneCell; cellHeight: heightForOneCell
        model: stModel

        delegate: myDeligate



    }

}
