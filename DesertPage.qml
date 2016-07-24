import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick 2.0

Item
{
    property real desert_hight : Screen.height
    property real desert_width : Screen.width
    property real desert_colum: desert_hight>desert_width ? 2 : 5
    property real desert_row: desert_hight>desert_width ? 5 : 3
    property real marginBetweenEachCell: 0
    property real widthForOneCell: (desert_width- (marginBetweenEachCell*desert_colum))/desert_colum
    property real heightForOneCell : (desert_hight-marginBetweenEachCell*desert_row)/desert_row



    signal d_Clicked(string itm, string prc)
    height: desert_hight
    width: desert_width
    id:root

    Component {
        id: myDeligate


        Rectangle {

            height: heightForOneCell
            width: widthForOneCell

            border.color: "white"
            border.width: 3
            color: "pink"
            Button {
                id: tex11
                text: desertItem + "  "+ desertPrice
                anchors.fill: parent
                //font.pixelSize: 30
                onClicked: {
                    d_Clicked(desertItem,desertPrice)
                }


            }
//            MouseArea
//            {
//                anchors.fill: parent
//                onPressed:  {

//                    parent.color ="blue"
//                }

//                onReleased:  {
//                    parent.color ="red"
//                    d_Clicked(desertItem,desertPrice)

//                }


//            }



        }
    }

    GridView
    {

        anchors.fill: parent
        anchors.leftMargin: marginBetweenEachCell*2.5
        anchors.bottomMargin: desert_hight-desert_hight*.82
        cellWidth: widthForOneCell; cellHeight: heightForOneCell
        model: desertModel

        delegate: myDeligate



    }

}
