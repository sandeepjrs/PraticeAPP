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


    Component {
        id: myChkDeligate

        Rectangle{
            height: rect_height
            width: chk_width
            color: "#7DB7E7"
            border.width: 2
            border.color: "white"


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
                        text : "IDXXX"
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
        anchors.fill: parent
        model: chkModel
        delegate: myChkDeligate
        spacing: 4

        // anchors.leftMargin: chk_width-chk_width*.99


        //        add: Transition {
        //            NumberAnimation { property: "opacity"; from: 0; to: 1.0; duration: 200 }
        //            NumberAnimation { property: "scale"; from: 0; to: 1.0; duration: 200 }
        //        }

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

    //    function addDot(item)
    //    {
    //        var i;
    //        var len;
    //        len=item.length;
    //        for(i=0;i<dotLength-len;i++)
    //        {
    //            item=item+".";
    //        }

    //        return item

    //    }

}


