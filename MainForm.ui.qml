import QtQuick 2.4

Rectangle {
    id: rectangle1

    width: 360
    height: 360

    GridView {
        id: homePage
        x: 0
        y: 0
        width: 360
        height: 360
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        model: ListModel {
            ListElement {
                name: "Grey"
                colorCode: "grey"
            }

            ListElement {
                name: "Red"
                colorCode: "red"
            }

            ListElement {
                name: "Blue"
                colorCode: "blue"
            }

            ListElement {
                name: "Green"
                colorCode: "green"
            }
        }
        cellHeight: 70
        anchors.top: parent.top
        delegate: Item {
            x: 5
            height: 50
            Column {
                Rectangle {
                    width: 40
                    height: 40
                    color: colorCode
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    x: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: true
                }
                spacing: 5
            }
        }
        cellWidth: 70

        Rectangle {
            id: rectangle2
            x: 0
            y: 0
            width: 120
            height: 360
            color: "#ffffff"
            anchors.rightMargin: 5
            anchors.leftMargin: 5
            anchors.bottomMargin: 5
            anchors.topMargin: 5
            anchors.fill: parent
        }

        Text {
            id: text1
            text: qsTr("TextRect1")
            z: 1
            anchors.rightMargin: -260
            anchors.leftMargin: -275
            anchors.bottomMargin: -311
            transformOrigin: Item.Center
            anchors.top: rectangle2.verticalCenter
            anchors.right: rectangle2.left
            anchors.bottom: rectangle2.verticalCenter
            anchors.left: rectangle2.horizontalCenter
            anchors.topMargin: -49
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 12
        }

        Rectangle {
            id: rectangle3
            color: "#ffffff"
            anchors.rightMargin: 5
            anchors.leftMargin: 5
            anchors.bottomMargin: 5
            anchors.topMargin: 5
            anchors.fill: parent
        }

        Rectangle {
            id: rectangle4
            color: "#ffffff"
            anchors.rightMargin: 5
            anchors.leftMargin: 5
            anchors.bottomMargin: 5
            anchors.topMargin: 5
            anchors.fill: parent
        }

    }
}
