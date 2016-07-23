import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {

    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")


    property real homeState



    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex


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
                            idButtonHomePage.text="BACK"

                            break
                        }

                        case 2 : {
                            idHomePage.visible=false
                            idMainCourse.visible=true
                            idButtonHomePage.text="BACK"

                            break
                        }
                        case 3 : {
                            idHomePage.visible=false
                            idDesertPage.visible=true
                            idButtonHomePage.text="BACK"

                            break
                        }

                        }



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
                        border.color: black
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



    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            id:idButtonHomePage
            text: qsTr("Home")
            onClicked: {
                if(homeState==0){

                }
                else if(homeState==1){

                    idButtonHomePage.text="Home"
                    idHomePage.visible=true
                    idStraterPage.visible=false
                }
                else if(homeState==2){
                    idButtonHomePage.text="Home"
                    idHomePage.visible=true
                    idMainCourse.visible=false

                }
                else if(homeState==3){
                    idButtonHomePage.text="Home"
                    idHomePage.visible=true
                    idDesertPage.visible=false

                }
            }


        }
        TabButton {
            id: idButtonCheckoutPage
            text: qsTr("CheckOut(0)")
        }
        TabButton {
            text: qsTr("Search")
        }
    }


}
//    }


//}
