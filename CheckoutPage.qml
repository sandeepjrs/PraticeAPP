import QtQuick 2.0
import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick 2.0

Item {


    property real chk_height :Screen.height
    property real chk_width :Screen.width
    property real chk_index: 3
    property real rect_height :chk_height>chk_width ? chk_height-chk_height*0.93: chk_height-chk_height*0.9


    property real fontSize: 30
    anchors.fill: parent
    id:root
    signal updatedCheckoutCost(int updatedCheckoutprice)
    signal orderClicked()

    Rectangle{
        id:idOrderRect
        height: rect_height
        width: chk_width
        color: "#4DAD87"
        border.color: "white"
        border.width: 2
        Button{
            text: "Order!"
            anchors.fill: parent
            onClicked: {
                orderClicked()
            }

        }

    }


    Component {
        id: myChkDeligate

        Rectangle{
            height: rect_height
            width: chk_width
            color: "#7DB7E7"
            border.width: 2
            border.color: "white"
            //anchors.top: idButtonRect.bottom



            Row
            {
                spacing: 5
                Rectangle
                {
                    id : idChkIDRect
                    height: rect_height
                    width: chk_width-chk_width*.85 //15
                    color: "transparent"

                    Text
                    {
                        id :text0
                        text : chkId
                        anchors.centerIn: parent
                        font.pixelSize :fontSize

                    }
                }
                Rectangle
                {
                    id : idChkItemRect
                    height: rect_height
                    width: chk_width-chk_width*.70 //30
                    color: "transparent"

                    Text
                    {
                        id :text1
                        text : chkItem
                        anchors.centerIn: parent
                        font.pixelSize :fontSize
                        font.bold: true

                    }
                }
                Rectangle
                {
                    id : idChkPriceRect
                    height: rect_height
                    width: chk_width-chk_width*.70 //30
                    color: "transparent"

                    Row
                    {
                        Text {  font.pixelSize: fontSize; text: chkSingleItemPrice}
                        Text {  font.pixelSize: fontSize; text: " x " }
                        Text {  font.pixelSize: fontSize; text: chkQuantity}
                        anchors.centerIn: parent

                    }
                }

                Rectangle
                {
                    id : idChkAmountRect
                    height: rect_height
                    width: chk_width-chk_width*.90 //10
                    color: "transparent"

                    Text
                    {

                        id :text2

                        text : "Rs. "+chkAmount
                        anchors.centerIn: parent
                        font.pixelSize :fontSize
                        font.family: "Freedom"


                    }
                }


                Rectangle
                {
                    id : delRect
                    height: rect_height
                    width: chk_width-chk_width*.90 //10
                    radius: delRect.height/2
                    anchors.left: text1.right
                    color: "transparent"

                    Text {

                        text: qsTr("x")
                        font.bold: true
                        font.pixelSize: fontSize+20
                        anchors.centerIn: delRect
                        color: "red"

                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            console.log(index)
                            chkModel.removeData(index)
                            updatedCheckoutCost(updateTotalAmount())



                        }
                    }
                }


            }
        }
    }




    ListView
    {

        id: chkListView
        anchors.top: idOrderRect.bottom
        anchors.bottom: parent.bottom
        model: chkModel
        delegate: myChkDeligate
        spacing: 4


        displaced: Transition {
            NumberAnimation { properties: "x,y"; duration: 400; easing.type: Easing.OutBounce }
        }




    }


    function updateTotalAmount()
    {
        var val;
        val= chkModel.getTotalCost();
        return val;
    }



}


