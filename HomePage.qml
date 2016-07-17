import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick 2.0
import QtQuick 2.7

Item
{
    property real home_hight
    property real home_width
    property real home_index: 3
   anchors.fill: parent
   signal homeClicked(int homeIndex)
    id:root

    ListModel {
        id: myModel

        ListElement {
            name: "Starter"
            cost: 2.45
        }
        ListElement {
            name: "Main Course"
            cost: 3.25
        }
        ListElement {
            name: "Desert"
            cost: 1.95
        }
    }


    Component {
        id: myDeligate


        Rectangle {
            height:300
            width:300
            border.color: "white"
            border.width: 5
            //Layout.alignment: Qt.AlignCenter
            color: "red"

            Text {
                id: tex11
                text: name
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
                    homeClicked(index)
                }

            }



        }
    }

    ListView
    {


        orientation: Qt.Horizontal
        anchors.fill: parent
        model: myModel
        delegate: myDeligate




    }

}
