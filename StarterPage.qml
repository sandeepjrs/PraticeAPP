import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick 2.0

Item
{
    property real starter_hight
    property real starter_width
    property real starter_index: 3
    height: starter_hight
    width: starter_width
    id:root



    Component {
        id: myDeligate


        Rectangle {
            //     height: starter_hight > starter_width ? starter_hight/starter_index : starter_hight
            //     width: starter_hight > starter_width  ? starter_width            : starter_width/starter_index

            //            height: starter_hight/4
            //            width: starter_width/4

            height: 100
            width: 100
            radius: 20
            border.color: "white"
            border.width: 1
            //Layout.alignment: Qt.AlignCenter
            color: "red"
            Text {
                id: tex11
                text: stPrice + "  "+ stItem
                anchors.centerIn: parent
                font.pixelSize: Screen.pixelDensity*2


            }
            MouseArea
            {
                anchors.fill: parent
                onPressed:  {

                    parent.color ="blue"
                }

                onReleased:  {
                    parent.color ="red"
                }

            }



        }
    }

    GridView
    {
        height: starter_hight
        width: starter_width
        model: stModel
//        flow: GridView.FlowLeftToRight
        delegate: myDeligate


    }

}
