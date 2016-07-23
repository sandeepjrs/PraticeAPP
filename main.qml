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
    property real h_index
    property real quantity



    Rectangle{
        anchors.fill: parent


        TabView {
            id: tabView

            anchors.fill: parent



            Tab {
                title: "Home"
                id: homeTab

                Rectangle
                {
                    anchors.fill: parent

                    id: rootTab1

                    Rectangle
                    {
                        anchors.fill: parent
                        state: "HOME"
                        id: s_home
                        visible: true


                        HomePage
                        {

                            home_hight: root.height
                            onHomeClicked:
                            {
                                switch(homeIndex)
                                {
                                case 0 :
                                {

                                    break
                                }

                                case 1 :
                                {
                                    s_home.visible=false
                                    s_starter.visible=true
                                    homeTab.title="Starter"


                                    break
                                }

                                case 2 :
                                {
                                    s_home.visible=false
                                    mc_mainCourse.visible=true
                                    homeTab.title="Main Course"
                                    break
                                }
                                case 3 :
                                {
                                    s_home.visible=false
                                    d_desert.visible=true
                                    homeTab.title="Desert"
                                    break
                                }
                                default:
                                {
                                    console.log("def")
                                }
                                }

                                rootTab1.state="HOME"

                            }

                        }

                    }



                    Rectangle
                    {
                        anchors.fill: parent
                        state: "STARTER"
                        visible: false
                        id: s_starter

                        StarterPage
                        {


                            starter_hight: root.height
                            anchors.fill: parent

                            onS_Clicked:
                            {
                                chkModel.addRawItem(itm,Number(prc))
                                chkTab.title = "Checkout ("+chkModel.getTotalCost()+")"

                            }

                        }
                    }

                    Rectangle
                    {
                        anchors.fill: parent
                        state: "MAINCOURSE"
                        visible: false

                        id: mc_mainCourse
                        MainCoursePage
                        {
                            onMc_Clicked:
                            {
                                chkModel.addRawItem(itm,Number(prc))
                                chkTab.title = "Checkout ("+chkModel.getTotalCost()+")"
                            }


                        }
                    }

                    Rectangle
                    {
                        anchors.fill: parent
                        state: "DESERT"
                        visible: false
                        id: d_desert
                        DesertPage
                        {
                            onD_Clicked:
                            {
                                chkModel.addRawItem(itm,Number(prc))
                                chkTab.title = "Checkout ("+chkModel.getTotalCost()+")"
                            }

                        }
                    }





                    Rectangle
                    {
                        z:1
                        id:backButton
                        height: 100
                        width: 100
                        color: "blue"
                        border.color: "yellow"
                        border.width: 5
                        visible: false



                        MouseArea
                        {
                            id: dragArea
                            anchors.fill: parent
                            onClicked:
                            {
                                s_home.visible=true
                                s_starter.visible=false
                                d_desert.visible=false
                                mc_mainCourse.visible=false
                                homeTab.title="Home"
                                rootTab1.state="BACK"

                            }
                            drag.target: rootTab1


                        }
                    }

                    states:
                        [
                        State
                        {
                            name : "HOME"
                            PropertyChanges { target: backButton; visible:true}
                        },

                        State
                        {
                            name : "BACK"
                            PropertyChanges { target: backButton; visible:false}
                        },

                        State
                        {
                            name : "MAINCOURSE"
                            PropertyChanges { target: backButton; visible:false}
                        },

                        State
                        {
                            name : "DESERT"
                            PropertyChanges { target: backButton; visible:false}
                        }

                    ]

                }
            }







            Tab {
                title: "Search"
                id: desTab
                Rectangle
                {


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
                                     chkTab.title = "Checkout ("+chkModel.getTotalCost()+")"
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

