import QtQuick 2.0

Item {

    property string itemText : "---"

    Rectangle
    {
        id: mainRect
        height: 100
        width: 200
        color : "#a6ff4d"
        border.color: "white"
        border.width: 2

        radius: 50


        Text
        {

            id :text1
            text: itemText
            font.pixelSize :14

            anchors.centerIn: mainRect

        }




        MouseArea
        {
            anchors.fill: mainRect
            onPressed:
            {
                mainRect.color= "#669900"
//                //                    totalAmount=totalAmount+updateTotalAmount(stPrice)
//                //                    console.log(totalAmount)

//                chkModel.addRawItem(stItem,Number(stPrice))
//                //console.log();

//                textAmt.text = "Amount : " +  updateTotalAmount()
            }

            onReleased:
            {
                mainRect.color= "#a6ff4d"
            }
        }


    }

}
