import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.2


ApplicationWindow {

    id:root
    visible: true
    width: Screen.width
    height: Screen.height
    title: qsTr("Hello World")


    property real homeState

    Rectangle
    {
        id:idBanner
        anchors.top: parent.top
        height: root.height-root.height*.85
        width: root.width
        color: "#1B7652"
        z:2

        Row{
            spacing: 2

            Rectangle{
                height: idBanner.height
                width: idBanner.width/4

                color: idBanner.color
                Text {  id: idBannerBack;text: qsTr("<"); font.pixelSize: 80; color: "white"
                    anchors.centerIn: parent; visible: false;font.bold: false}

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(homeState==0){

                        }
                        else if(homeState==1){

                            idBannermid.text="Fooddiies"
                            idHomePage.visible=true
                            idStraterPage.visible=false
                            idBannerBack.visible=false
                        }
                        else if(homeState==2){
                            idBannermid.text="Fooddiies"
                            idHomePage.visible=true
                            idMainCourse.visible=false
                            idBannerBack.visible=false

                        }
                        else if(homeState==3){
                            idBannermid.text="Fooddiies"
                            idHomePage.visible=true
                            idDesertPage.visible=false
                            idBannerBack.visible=false

                        }

                    }
                }
            }
            Rectangle{
                height: idBanner.height
                width: idBanner.width/2

                color: idBanner.color
                Text {   id: idBannermid; text: qsTr("Fooddiies");font.pixelSize: 50; color: "white";anchors.centerIn: parent
                    font.bold: true}
            }
            Rectangle{
                height: idBanner.height
                width: idBanner.width/4

                color: idBanner.color
                Text {   id: idBannerLast; text: qsTr("Fooddiies");font.pixelSize: 25; color: "white" ;anchors.centerIn: parent
                    font.bold: true;visible: false}
            }

        }


    }




    SwipeView {
        id: swipeView
        anchors.top: idBanner.bottom
        currentIndex: tabBar.currentIndex
        height: root.height-root.height*.15
        width: root.width



        Page
        {

            Rectangle{
                id: idHomePage
                anchors.fill : parent
                visible: true
                HomePage{
                    onHomeClicked:{
                        homeState=homeIndex
                        switch(homeIndex)
                        {
                        case 0 :{



                            break
                        }

                        case 1 :{
                            idHomePage.visible=false
                            idStraterPage.visible=true
                            idBannerBack.visible=true
                            idBannermid.text="Starters"

                            break
                        }

                        case 2 : {
                            idHomePage.visible=false
                            idMainCourse.visible=true
                            idBannerBack.visible=true
                            idBannermid.text="MainCourse"

                            break
                        }
                        case 3 : {
                            idHomePage.visible=false
                            idDesertPage.visible=true
                            idBannerBack.visible=true
                            idBannermid.text="Deserts"

                            break
                        }

                        }



                    }
                }
            }


            Rectangle{
                anchors.centerIn: parent
                NewOrderDiaglog
                {
                    id:idNewOrderDiaglog
                    newOrderVisible: false
                    onOk: {
                        idNewOrderDiaglog.newOrderVisible=false
                    }

                }
            }


            Rectangle{
                id:idStraterPage
                anchors.fill : parent
                visible: false
                StarterPage{
                    onS_Clicked:
                    {
                        chkModel.addRawItem(itm,Number(prc))
                        idButtonCheckoutPage.text = "CheckOut ("+chkModel.getTotalCost()+")"

                    }

                }
            }

            Rectangle{
                id:idMainCourse
                anchors.fill : parent
                visible: false
                MainCoursePage{

                    onMc_Clicked: {
                        chkModel.addRawItem(itm,Number(prc))
                        idButtonCheckoutPage.text = "CheckOut ("+chkModel.getTotalCost()+")"
                    }
                }
            }

            Rectangle{
                id:idDesertPage
                anchors.fill : parent
                visible: false
                DesertPage{
                    onD_Clicked: {
                        chkModel.addRawItem(itm,Number(prc))
                        idButtonCheckoutPage.text = "CheckOut ("+chkModel.getTotalCost()+")"
                    }

                }
            }




        }


        Page {
            Rectangle{
                id:idCheckOutPage
                anchors.fill : parent
                visible: true
                CheckoutPage{
                    onUpdatedCheckoutCost:
                    {
                        idButtonCheckoutPage.text = "Checkout ("+chkModel.getTotalCost()+")"

                    }

                }
            }
        }
        Page {
            Rectangle
            {
                id: desTab

                anchors.fill: parent
                Column{

                    Rectangle
                    {
                        height: desTab.height- desTab.height*0.12
                        width: desTab.width


                        SearchPage
                        {
                            onAddFromSearch:
                            {
                                chkModel.addRawItem(itm,Number(prc))
                                idButtonCheckoutPage.text = "Checkout ("+chkModel.getTotalCost()+")"
                            }
                        }
                    }

                    Rectangle
                    {
                        border.color: "black"
                        border.width: 2
                        height: desTab.height- desTab.height*0.88
                        width: desTab.width
                        color: "yellow"
                        id: rowRect
                        z:1

                        Row
                        {
                            spacing: 0

                            TextEdit
                            {
                                id: findText
                                height: rowRect.height
                                width: rowRect.width -rowRect.width*.25
                                anchors.leftMargin: rowRect.width -rowRect.width*.60
                                font.pixelSize: 50


                            }
                            Button
                            {
                                height: rowRect.height
                                width: rowRect.width -rowRect.width*.75
                                text: "find"
                                z:1
                                onClicked:
                                {
                                    mySearchModel.removeAllData()
                                    mySearchModel.search(findText.text)
                                    //                                    console.log(findText.text)
                                }
                            }
                        }
                    }

                }

            }

        }



    }





    PageIndicator {
        count: 3
        spacing: 30

        currentIndex: swipeView.currentIndex
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        delegate: Rectangle {
            implicitWidth: 25
            implicitHeight: 25

            radius: width
            color: "black"

            opacity: index === swipeView.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

            Behavior on opacity {
                OpacityAnimator {
                    duration: 100
                }
            }
        }
    }


}

