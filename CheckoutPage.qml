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
    height: chk_height
    width: chk_width
    id:root
    signal updatedCheckoutCost(int updatedCheckoutprice)

    Component {
        id: myChkDeligate


        Rectangle
        {
            id : rect1
            height: 60
            width: 250
            color : "blue"
            //radius: rect1.width-rect1.width*.4


            Text
            {

                id :text1
                text: chkItem+"    "+chkAmount
                font.pixelSize :rect1.height-rect1.height*.8
                anchors.centerIn: parent

            }


            MouseArea
            {
                anchors.fill: parent
                onDoubleClicked:
                {
                    onDoubleClicked:
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
        height: chk_height
        width: chk_width
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

}


