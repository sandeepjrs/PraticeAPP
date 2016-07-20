import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick 2.0
import QtQuick 2.7

Item
{
    property real home_hight
    property real home_width :Screen.width
    property real home_index: 2

    property real home_colum: 2
    property real home_row: 2
    property real marginBetweenEachCell: 5
    property real widthForOneCell: (home_width- (marginBetweenEachCell*home_colum))/home_colum
    property real heightForOneCell : (home_hight-marginBetweenEachCell*home_row)/home_row
    anchors.fill: parent
    signal homeClicked(int homeIndex)
    id:root

    ListModel {
        id: myModel

        ListElement {
            name: "New Order"

        }
        ListElement {
            name: "Starter"

        }
        ListElement {
            name: "Main Course"

        }
        ListElement {
            name: "Desert"

        }
    }


    Component {
        id: myDeligate


        Rectangle {
            height:heightForOneCell
            width:widthForOneCell
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

    GridView
    {



        cellWidth: widthForOneCell
        cellHeight: heightForOneCell
        anchors.fill: parent
        model: myModel
        delegate: myDeligate
        interactive: false

    }

}
