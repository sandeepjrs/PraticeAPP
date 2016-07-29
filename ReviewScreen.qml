import QtQuick 2.0
import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick 2.0
import QtQuick.Controls.Styles 1.4


Item {


    id : root
    property real notf_height :Screen.height-Screen.height*.40
    property real notf_width :Screen.width-Screen.width*.20
    property string notf_text: ""
    property bool notf_visible: false
    property real totalAmount
    property real vat :fixDec((totalAmount*.1),2)
    property real otherTax :fixDec((totalAmount*.05),2)
    property real total : fixDec((totalAmount+vat+otherTax),2)

    opacity: .80
    anchors.centerIn: parent

    signal okClicked()
    signal canelClicked()

    visible: notf_visible
    Rectangle{
        id:reviewRoot
        height: notf_height
        width: notf_width
        color: "black"
        anchors. centerIn: parent
        radius:notf_width-notf_width*.98

        Text {
            id: title
            text: qsTr("<u>Review Screen")
            color: "white"
            font.pixelSize: 35
            anchors.horizontalCenter: reviewRoot.horizontalCenter

        }
        Grid{
            rows :6
            columns: 2
            spacing: notf_width-notf_width*.90

            Rectangle{height: 20;width: 200; color: "transparent";Text{font.pixelSize: 50;color:"white";text:"<b>Amount : "}}
            Rectangle{height: 20;width: 200; color: "transparent";Text{font.pixelSize: 50;color:"white";text:"<b> Rs : "+totalAmount}}

            Rectangle{height: 20;width: 200; color: "transparent";Text{font.pixelSize: 50;color:"white";text:"<b>Vat : "}}
            Rectangle{height: 20;width: 200; color: "transparent";Text{font.pixelSize: 50;color:"white";text:"<b>Rs :"+ vat}}

            Rectangle{height: 20;width: 200; color: "transparent";Text{font.pixelSize: 50;color:"white";text:"<b>OtherTax :  "}}
            Rectangle{height: 20;width: 200; color: "transparent";Text{font.pixelSize: 50;color:"white";text:"<b>Rs : "+ otherTax}}

            Rectangle{height: 20;width: 200; color: "transparent";Text{font.pixelSize: 50;color:"white";text:"<b>Total :  "}}
            Rectangle{height: 20;width: 200; color: "transparent";Text{font.pixelSize: 50;color:"white";text:"<b>Rs : "+ total}}

            Rectangle{height: 20;width: 200; color: "transparent";Text{font.pixelSize: 50;color:"white";text:"<b>Tabel No :  "}}

            ComboBox {
                currentIndex: 2
                model: [1,2,3,4,5,6,7]
                width: 150
                height: notf_height-notf_height*.92
                style:ComboBoxStyle{
                    textColor: "black"
                }



            }


            anchors.centerIn: parent

        }




        Column{
            anchors.bottom: parent.bottom
            anchors.bottomMargin: notf_height-notf_height*.98
            spacing: 5



            Rectangle{
                id:idLineRect
                height: 5
                width: notf_width
                color: black
            }

            Row{

                //spacing: notf_width-notf_width*.99
                anchors.horizontalCenter: parent.horizontalCenter

                Rectangle{
                    height: notf_height-notf_height*.90
                    width: notf_width/2
                    color: "transparent"
                    Button{
                        text:"Continue"
                        anchors.fill: parent
                        onClicked: {
                            okClicked()
                        }

                    }
                }
                Rectangle{
                    height: notf_height-notf_height*.90
                    width: notf_width/2
                    color: "transparent"
                    Button{
                        text:"Cancel"
                        anchors.fill: parent
                        onClicked: {
                            canelClicked()
                        }
                    }
                }
            }
        }


    }

    function fixDec(val,prec)
    {
        return val.toPrecision(prec);


    }


}
