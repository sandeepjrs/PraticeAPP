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
    Component {
        id: myChkDeligate
        Rectangle
        {

            height: 50
            width: 200
            color : "pink"
            border.color: "white"
            border.width: 2

            radius: 50

            Text
            {

                id :text1
                text: chkAmount+"    " + chkItem
                font.pixelSize :10
                anchors.centerIn: parent

            }


            MouseArea
            {
                anchors.fill: parent
                onDoubleClicked:
                {
                    onDoubleClicked:
                    {
                        //                       chkListView.currentIndex=index
                        console.log(index)
                        chkModel.removeData(index)
                        //textAmt.text = "Amount : " +  updateTotalAmount()


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


