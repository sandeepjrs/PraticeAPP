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
                Text {  id: idBannerBack;text: qsTr("<"); font.pixelSize: 80; color: "black"
                    anchors.centerIn: parent; visible: false;font.bold: false}

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(homeState==0){

                        }
                        else if(homeState==1){
                            idStraterPage.visible=false

                        }
                        else if(homeState==2){
                            idMainCourse.visible=false
                        }
                        else if(homeState==3 ){
                            idDesertPage.visible=false
                        }

                        idBannermid.text="Fooddiies"
                        idHomePage.visible=true
                        idBannerBack.visible=false
                        swipeView.currentIndex=0
                        homeState=4

                    }
                }
            }
            Rectangle{
                height: idBanner.height
                width: idBanner.width/2

                color: idBanner.color
                Text {   id: idBannermid;
                    text: qsTr("Fooddiies")
                    font.pixelSize: 50; color: "white";anchors.centerIn: parent
                    font.bold: true}
            }
            Rectangle{
                height: idBanner.height
                width: idBanner.width/4

                color: idBanner.color
                Text {   id: idBannerLast; text:"Rs. "+"0";font.pixelSize: 40; color: "lightgreen" ;anchors.centerIn: parent
                    font.bold: true;visible: true}
            }

        }




    }




    SwipeView {
        id: swipeView
        anchors.top: idBanner.bottom
        currentIndex: tabBar.currentIndex
        height: root.height-root.height*.15
        width: root.width
        onCurrentIndexChanged:
        {
            if(homeState==1||homeState==2||homeState==3)
            {

                swipeView.currentIndex=0
            }

            else if(swipeView.currentIndex==0){
                idBannermid.text=qsTr("Fooddiies")

            }
            else if(swipeView.currentIndex==1){
                idBannermid.text=qsTr("CheckOut")
            }
            else if(swipeView.currentIndex==2){
                idBannermid.text=qsTr("Search")
            }

            if(chkModel.getTotalCost()==0){
                idNoItems.visible=true
            }
            else{
                idNoItems.visible=false
            }
        }

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

                            chkModel.removeAllData()
                            idBannerLast.text = "Rs. "+chkModel.getTotalCost()

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
                        chkModel.addRawItem(id,itm,Number(prc))
                        idBannerLast.text = "Rs. "+chkModel.getTotalCost()

                    }

                }
            }

            Rectangle{
                id:idMainCourse
                anchors.fill : parent
                visible: false
                MainCoursePage{

                    onMc_Clicked: {
                        chkModel.addRawItem(id,itm,Number(prc))
                        idBannerLast.text = "Rs. "+chkModel.getTotalCost()
                    }
                }
            }

            Rectangle{
                id:idDesertPage
                anchors.fill : parent
                visible: false
                DesertPage{
                    onD_Clicked: {
                        chkModel.addRawItem(id,itm,Number(prc))
                        idBannerLast.text = "Rs. "+chkModel.getTotalCost()
                    }

                }
            }




        }


        Page {
            Rectangle{
                id:idCheckOutPage
                anchors.fill : parent
                visible: true
                Text {
                    id: idNoItems
                    text: qsTr("<b>oops!! </b>No Items In the CheckOut <b>:( ")
                    anchors.centerIn: parent
                }
                CheckoutPage{
                    onUpdatedCheckoutCost:
                    {
                        idBannerLast.text = "Rs. "+chkModel.getTotalCost()
                        if(chkModel.getTotalCost()==0){
                            idNoItems.visible=true
                        }
                        else{
                            idNoItems.visible=false
                        }

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
                        border.color: "#4DAD87"
                        border.width: 4
                        height: root.height>root.width ? desTab.height- desTab.height*0.93 : desTab.height- desTab.height*0.88
                        width: desTab.width
                        color: "white"
                        id: rowRect
                        z:1

                        Row
                        {
                            spacing: 0
                            Rectangle{
                                height: rowRect.height
                                width: root.width -root.width*.25
                                color: "transparent"

                                TextEdit
                                {
                                    id: findText

                                    anchors.leftMargin: root.width -root.width*.98
                                    anchors.topMargin:rowRect.height-rowRect.height*.70
                                    anchors.fill: parent
                                    anchors.centerIn: parent
                                    font.pixelSize: 30
                                    onTextChanged: {
                                        mySearchModel.removeAllData()
                                        mySearchModel.search(findText.text)
                                    }


                                }
                            }
                            Rectangle{

                                height: rowRect.height
                                width: root.width -root.width*.74
                                color: "#4DAD87"
                                Button
                                {
                                    anchors.fill: parent
                                    text: "Search"
                                    z:1

                                    onClicked:
                                    {
                                        mySearchModel.removeAllData()
                                        mySearchModel.search(findText.text)

                                    }
                                }
                            }
                        }
                    }

                    Rectangle
                    {
                        height: desTab.height- desTab.height*0.12
                        width: desTab.width


                        SearchPage
                        {
                            onAddFromSearch:
                            {
                                chkModel.addRawItem(ids,itm,Number(prc))
                                idBannerLast.text = "Rs. "+chkModel.getTotalCost()
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
            color: "green"

            opacity: index === swipeView.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

            Behavior on opacity {
                OpacityAnimator {
                    duration: 100
                }
            }
        }
    }


}

