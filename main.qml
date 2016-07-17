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
    property real quantity

    Rectangle{
        anchors.fill: parent


        TabView {
            id: tabView

            anchors.fill: parent



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
                        anchors.fill: parent
                        onS_Clicked:
                        {

//                            if(chkModel.searchItemGetQuantity(itm)==0)
//                            {
//                                quantity=1
//                            }
//                            else
//                            {
//                                quantity=chkModel.searchItemGetQuantity(itm)+1;
//                            }
//                                console.log(quantity)

                            chkModel.addRawItem(itm,Number(prc))
                            chkTab.title = "Checkout ("+chkModel.getTotalCost()+")"

                        }

                    }
                }

            }
            Tab {
                id:chkTab
                title: "Checkout ("+chkModel.getTotalCost()+")"

                Rectangle
                {
                    id: chkRect
                    anchors.fill: parent


                    CheckoutPage

                    {
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

