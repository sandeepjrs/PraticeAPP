import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick 2.0


import "./"

Window {
    id: root
    visible: true
    height: Screen.height/2
    width: Screen.width/2
    //    height: 800/2
    //    width: 480/2

    Rectangle
    {
        id: rect1
        height: root.height
        width: root.width
        //border.color: "black"
        // radius: rect1.height/2
        // border.width: 10

        //        HomePage
        //        {
        //            home_hight: rect1.height-50
        //            home_width: rect1.width-50
        //            anchors.centerIn: parent

        //        }

        Row{

            spacing: 2


            Rectangle{

                height: root.height
                width: root.width/2
                StarterPage
                {
                    //            starter_hight:root.height
                    //            starter_width: root.width

                    starter_hight:root.height
                    starter_width: root.width/2

                    onS_Clicked:
                    {
                        console.log(x,y)
                        chkModel.addRawItem(x,Number(y))

                    }
                }
            }


            Rectangle{

                height: root.height
                width: root.width/2
                CheckoutPage
                {
                    chk_height: root.height
                    chk_width: root.width/2


                }

            }
        }



    }




}

