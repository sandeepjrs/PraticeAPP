import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick 2.0


import "./"

Window {
    id: mainWindow
    visible: true
//    height: Screen.height/2
//    width: Screen.width/2
    height: 800/2
    width: 480/2




    ColumnLayout
    {
        id: mainRowLayout
        anchors.fill: parent
        //anchors.margins: 20
        spacing: 10
        //Flow: width > height ? ColumnLayout.Top  : GridLayout.TopToBottom

        Rectangle
        {
            height: mainWindow.height- mainWindow.height*.80
            width: mainWindow.width
            color: "black"
            border.color: "white"

        }


    Rectangle
    {
        id: root
        height: mainWindow.height
        width: mainWindow.width

        GridView {
            anchors.fill: parent

        GridLayout {

            id: homeScreen
            anchors.fill: parent
            anchors.margins: 10
            //anchors.bottomMargin: mainWindow.height- mainWindow.height*.75
            rowSpacing: 10
            columnSpacing: 10
            Layout.minimumHeight:20
            flow:  width > height ? GridLayout.LeftToRight  : GridLayout.TopToBottom
            visible: true

            Rectangle {
                id:starterRect
                Layout.fillWidth: true
                Layout.fillHeight: true
//                Layout.minimumHeight : 50
//                Layout.minimumWidth: 50
                color: "grey"
                Label {
                    anchors.centerIn: parent
                    text: "Starter"
                    color: "black"
                    font.pixelSize: mainWindow.height-mainWindow.height*.94
                    font.italic: true
                }

                MouseArea{
                    anchors.fill: parent

                    onPressed:  {
                        console.log("starter clicked")

                        parent.color ="blue"
                    }

                    onReleased:  {
                        parent.color ="grey"
                        root.state="STARTER_SCREEN"
                        homeScreen.visible = false


                    }
                }
            }
            Rectangle {
                id:mainCourseRect
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "red"
                Label {
                    anchors.centerIn: parent
                    text: "Main Course"
                    color: "black"
                    font.pixelSize: mainWindow.height-mainWindow.height*.94
                    font.italic: true
                }
                MouseArea{
                    anchors.fill: parent

                    onPressed:  {
                        console.log("MainCourse clicked")

                        parent.color ="blue"
                    }

                    onReleased:  {
                        parent.color ="red"
                    }
                }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "yellow"
                Label {
                    anchors.centerIn: parent
                    text: "Desert"
                    color: "black"
                    font.pixelSize: mainWindow.height-mainWindow.height*.94
                    font.italic: true
                }
                MouseArea{
                    anchors.fill: parent

                    onPressed:  {
                        console.log("Desert clicked")

                        parent.color ="blue"
                    }

                    onReleased:  {
                        parent.color ="yellow"
                    }
                }



            }
        }
        }


        GridLayout
        {

            id: mainScreenOnlyStarter
            anchors.fill: parent
            anchors.margins: 20
            rowSpacing: 20
            columnSpacing: 20
            flow:  width > height ? GridLayout.LeftToRight  : GridLayout.TopToBottom
            visible: false
            z:0



            Row{

                spacing: 2

                Rectangle
                {
                    height: mainWindow.height-50
                    width: mainWindow.width-50
                    //border.color: "black"
                    //color: "#00000000"

                    ListView
                    {
                        height: parent.height
                        width: parent.width
                        model: stModel
                        delegate :
                            Rectangle{
                            height:  mainWindow.height-mainWindow.height*.75
                            width: mainWindow.height-mainWindow.height*.75
                            color: "#00000000"
                            FlistViewButton{
                                sizeButton : mainWindow.height - mainWindow.height*0.8
                                itemText : stItem + ", " + stPrice


                            }
                        }

                    }
                }

            }


        }

        states:
        [
            State {
                name: "HOME_SCREEN"
                PropertyChanges {
                    target: homeScreen


                }
            },
            State {
                name: "STARTER_SCREEN"

                PropertyChanges {
                    target: mainScreenOnlyStarter
                    visible:true


                }
            }

        ]

    }
}


}

