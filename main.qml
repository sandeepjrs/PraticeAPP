import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick 2.0
//import and


import "./"

Window {
    id: root
    visible: true
    property real c_val

Rectangle{
    anchors.fill: parent

    HomePage
    {
        id:home_page
        anchors.fill: parent
        home_hight: root.height
        home_width: root.width
        visible: true

        onHomeClicked:
        {
            c_val=homeIndex

            switch(c_val)
            {
            case 0 :
            {
                 home_page.visible=false
                break
            }

            case 1 :
            {
                console.log("1")
                break
            }

            case 2 :
            {
                console.log("2")
                break
            }
            default:
            {
                console.log("def")
            }
            }

            if(c_val==0)
            {

            }
        }

    }

}






 }











