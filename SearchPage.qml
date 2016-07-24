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
    property real rectHeight: search_height>search_width ? search_height-search_height*0.93: search_height-search_height*0.9

    property real fontSize: 30
    anchors.fill: parent
    id:root

    signal addFromSearch(string itm,string prc)


    Component {
        id: mysearchDeligate

        Rectangle{
            height: rectHeight
            width: search_width
            border.color: "white"
            border.width: 2
            color: "#4DAD87"

            Row
            {
                spacing: 5

                Rectangle
                {
                    id : idSearchIdRect
                    height: rectHeight
                    width: search_width-search_width*.80 //20
                    color: "transparent"


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
                    height: rectHeight
                    width: search_width-search_width*.60 //30
                    color: "transparent"


                    Row
                    {
                        Text { font.pixelSize :fontSize; text: searchItem }

                        anchors.centerIn: parent
                    }
                }

                Rectangle
                {
                    id : idSearchPriceRect
                    height: rectHeight
                    width: search_width-search_width*.80 //20
                    color: "transparent"
                    Text
                    {

                        id :text2

                        text : "Rs. "+searchPrice
                        anchors.centerIn: parent
                        anchors.verticalCenter: rect2
                        font.pixelSize :fontSize

                    }
                }


                Rectangle
                {
                    id : delRect
                    height: rectHeight
                    width: search_width-search_width*.85 //10
                    color: "transparent"

                    Button{
                        text: "+"
                        onClicked: {
                            addFromSearch(searchItem,searchPrice)
                        }
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
         spacing: 4

        add: Transition {
            NumberAnimation { property: "opacity"; from: 0; to: 1.0; duration: 200 }
            NumberAnimation { property: "scale"; from: 0; to: 1.0; duration: 200 }
        }


    }




}


