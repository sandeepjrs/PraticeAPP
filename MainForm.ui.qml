import QtQuick 2.4

Rectangle {
    property alias mouseArea: mouseArea

    width: 360
    height: 360

    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }

    Text {
        id: text1
        anchors.centerIn: parent
        text: "Hello World"
    }
    states: [
        State {
            name: "State1"

            PropertyChanges {
                target: text1
                text: "State 2"
            }
        },
        State {
            name: "State2"
            PropertyChanges {
                target: text1
                text: "Hello World"
            }
        }
    ]
}
