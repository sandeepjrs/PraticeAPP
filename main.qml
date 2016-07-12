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

    HomePage
    {
    home_hight: root.height
    home_width: root.width

    }




}

