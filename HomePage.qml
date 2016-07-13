import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick 2.0

Item
{
    property real home_hight
    property real home_width
    property real home_index: 3
    height: home_hight
    width: home_width
    id:root

    ListModel {
        id: myModel

        ListElement {
            name: "Apple"
            cost: 2.45
        }
        ListElement {
            name: "Orange"
            cost: 3.25
        }
        ListElement {
            name: "Banana"
            cost: 1.95
        }
    }


    Component {
        id: myDeligate


        Rectangle {
            height: home_hight > home_width ? home_hight/home_index : home_hight
            width: home_hight > home_width  ? home_width            : home_width/home_index
            border.color: "white"
            border.width: 5
            //Layout.alignment: Qt.AlignCenter
            color: "red"
            Text {
                id: tex11
                text: name + "  "+ cost
                anchors.centerIn: parent
                font.pixelSize: Screen.pixelDensity*5


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

    ListView
    {


        orientation: home_hight > home_width ? Qt.Vertical : Qt.Horizontal
        anchors.fill: parent
        model: myModel
        delegate: myDeligate


    }

}
