import QtQuick 2.0

Item {

    property string itemText : "Empty Value"
    property real sizeButton: 100


    Rectangle
    {
        id: mainRect
        height: sizeButton
        width: sizeButton
        color : "#a6ff4d"
        border.color: "#a6ff4d"
        border.width: 2

        radius: sizeButton/6


        Text
        {

            id :text1
            text: itemText
            font.pixelSize :(sizeButton-sizeButton* 0.85)
            anchors.centerIn: mainRect

        }




        MouseArea
        {
            anchors.fill: mainRect
            onPressed:
            {
                mainRect.color= "#669900"
                console.log(index , stItem)
            }

            onReleased:
            {
                mainRect.color= "#a6ff4d"
            }

            hoverEnabled: true
            onEntered: mainRect.state="F_ENTER"
            onExited:mainRect.state="F_EXIT"

            onClicked: {

            }
        }

        states:
            [

            State {
                name: "F_ENTER"
                PropertyChanges {
                    target: mainRect
                    border.color:  "darkgreen"

                }
            },
            State {
                name: "F_EXIT"
                PropertyChanges {
                    target: mainRect
                    border.color: "#a6ff4d"

                }
            }


        ]


        transitions: [
            Transition {
                from: "F_ENTER"
                to: "F_EXIT"

                ColorAnimation {
                    target: mainRect
                    duration: 1200
                }

            },
            Transition {
                from: "F_EXIT"
                to: "F_ENTER"
                ColorAnimation {
                    target: mainRect
                    duration: 500
                }

            }
        ]


    }

}
