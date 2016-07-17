import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick 2.0
import QtQuick 2.3
import QtQuick.Window 2.1
//import and


import "./"

Window {
    id: root
    visible: true
    property real c_val



    Rectangle{
        anchors.fill: parent


        TabView {
            id: tabView

            anchors.fill: parent


            Layout.minimumWidth: 360
            Layout.minimumHeight: 360
            Layout.preferredWidth: 480
            Layout.preferredHeight: 640
            Tab {
                title: "Home"

                Rectangle
                {
                    anchors.fill: parent

                   HomePage
                   {
                       home_hight: root.height
                       home_width: root.width

                   }
                }

            }

            Tab {
                title: "Starter"

                Rectangle
                {
                    anchors.fill: parent

                    StarterPage
                    {
                        starter_hight: root.height
                        starter_width: root.width
                        onS_Clicked:
                        {
                            chkModel.addRawItem(x,Number(y))
                            chkTab.title = "Checkout ("+chkModel.getTotalCost()+")"
                            //console.log(chkModel.getTotalCost())
                        }

                    }
                }

            }
            Tab {
                id:chkTab
                title: "Checkout ("+chkModel.getTotalCost()+")"

                Rectangle
                {
                    anchors.fill: parent

                    CheckoutPage
                    {
                        chk_height: root.height
                        chk_width: root.width
                        onUpdatedCheckoutCost:
                        {
                            chkTab.title = "Checkout ("+chkModel.getTotalCost()+")"
                            console.log(updatedCheckoutprice)
                        }

                    }
                }

            }

        }
    }


}
