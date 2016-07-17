import QtQuick 2.0
import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick 2.0

Item {


    property real chk_height
    property real chk_width
    property real chk_index: 3
    property real dotLength : 40
    property string fullString
    anchors.fill: parent
    id:root
    signal updatedCheckoutCost(int updatedCheckoutprice)

    Component {
        id: myChkDeligate


        Rectangle
        {
            id : rect1
            height: 30
            width: 250



            Text
            {

                id :text1

                text : index+1+". "+ addDot(chkItem) +"Rs "+chkAmount

                font.pixelSize :30

                onTextChanged:
                {
                    text1.text=  index+1+". "+ addDot(chkItem) +"Rs "+chkAmount
                    //                    text1.AlignJustify.valueOf(40)
                    horizontalAlignment: text1.AlignRight



                }


            }

            Rectangle
            {
                height: 30
                width: 30
                radius: 30/2
                border.color: "red"
                border.width: 5
                anchors.left: text1.right
                anchors.leftMargin: 20
                Text {

                    text: qsTr("X")
                    font.bold: true
                    font.pixelSize: 30
                    anchors.centerIn: parent
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
        currentIndex: 0


        add: Transition {
            NumberAnimation { property: "opacity"; from: 0; to: 1.0; duration: 200 }
            NumberAnimation { property: "scale"; from: 0; to: 1.0; duration: 200 }
        }

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

    function addDot(item)
    {
        var i;
        var len;
        len=item.length;
        for(i=0;i<dotLength-len;i++)
        {
            item=item+".";
        }

        return item

    }

}


