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

    property real fontSize: 30
    anchors.fill: parent
    id:root
    signal updatedCheckoutCost(int updatedCheckoutprice)

    Component {
        id: myChkDeligate

        Row
        {
            spacing: 10
            Rectangle
            {
                id : idChkItemRect
                height: chk_height-chk_height*0.9
                width: chk_width-chk_width*0.50
                color: "lightgrey"
                Text
                {
                    id :text1
                    text : "IDXXX"+"  "+chkItem
                    anchors.verticalCenter: parent
                    font.pixelSize :fontSize

                }
            }
            Rectangle
            {
                id : idChkPriceRect
                height: chk_height-chk_height*0.9
                width: chk_width-chk_width*.80
                color: "lightgrey"


                Row
                {
                    Text {  font.pixelSize: fontSize; text: chkSingleItemPrice }
                    Text {  font.pixelSize: fontSize; text: " x " }
                    Text {  font.pixelSize: fontSize; text: chkQuantity}
                    anchors.centerIn: parent
                }
            }

            Rectangle
            {
                id : idChkAmountRect
                height: chk_height-chk_height*0.9
                width: chk_width-chk_width*.85
                color: "lightgrey"
                Text
                {

                    id :text2

                    text : "Rs. "+chkAmount
                    anchors.centerIn: parent
                    anchors.verticalCenter: parent
                    font.pixelSize :fontSize
                    font.family: "Freedom"

                    //onTextChanged:{ text1.text=  index+1+". "+ addDot(chkItem) +"Rs "+chkAmount}
                }
            }


            Rectangle
            {
                id : delRect
                height: chk_height-chk_height*0.9
                width: chk_width-chk_width*.90
                //radius: 32/2
                border.color: "red"
                border.width: 7
                anchors.left: text1.right

                Text {

                    text: qsTr("x")
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
                        console.log(index)
                        chkModel.removeData(index)
                        updatedCheckoutCost(updateTotalAmount())



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
        spacing: 10

        anchors.leftMargin: chk_width-chk_width*.99


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


