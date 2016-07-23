import QtQuick 2.0
import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick 2.0

Item {


    property real search_height :Screen.height
    property real search_width :Screen.width
    property real search_index: 3

    property real fontSize: 55
    anchors.fill: parent
    id:root

    signal addFromSearch(string itm,string prc)


    Component {
        id: mysearchDeligate


        Row
        {
            spacing: 10


            Rectangle
            {
                id : idSearchIdRect
                height: search_height-search_height*.90
                width: search_width-search_width*.80
                color: "lightgrey"


                Text
                {

                    id :text1
                    text : "  "+searchId
                    font.pixelSize :fontSize
                    anchors.centerIn: parent

                }
            }
            Rectangle
            {
                id : idSearchItemRect
                height: search_height-search_height*.90
                width: search_width-search_width*.53
                color: "lightgrey"


                Row
                {
                    Text { font.pixelSize :fontSize; text: searchItem }

                    anchors.centerIn: parent
                }
            }

            Rectangle
            {
                id : idSearchPriceRect
                height: search_height-search_height*.90
                width: search_width-search_width*.80
                color: "lightgrey"
                Text
                {

                    id :text2

                    text : "Rs. "+searchPrice
                    anchors.centerIn: parent
                    anchors.verticalCenter: rect2
                    font.pixelSize :fontSize
                    font.family: "Freedom"

                }
            }


            Rectangle
            {
                id : delRect
                height: search_height-search_height*.90
                width: search_width-search_width*.90
                //radius: 32/2
                border.color: "green"
                border.width: 7
                anchors.left: text1.right

                Text {

                    text: qsTr("+")
                    font.bold: true
                    font.pixelSize: fontSize
                    anchors.centerIn: delRect
                    color: "red"
                }

                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        console.log("clicked ADD")
                         addFromSearch(searchItem,searchPrice)

                    }
                }
            }



        }
    }




    ListView
    {

        id: searchListView
        anchors.fill: parent
        model: mySearchModel
        delegate: mysearchDeligate






        add: Transition {
            NumberAnimation { property: "opacity"; from: 0; to: 1.0; duration: 200 }
            NumberAnimation { property: "scale"; from: 0; to: 1.0; duration: 200 }
        }

//        displaced: Transition {
//            NumberAnimation { properties: "x,y"; duration: 400; easing.type: Easing.OutBounce }
//        }




    }




}


