import QtQuick 2.0
import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick 2.0

Item {


    property real chk_height :Screen.height
    property real chk_width :Screen.width
    property real chk_index: 3
    property real rect_height :chk_height>chk_width ? chk_height-chk_height*0.93: chk_height-chk_height*0.9
    Rectangle{

    }

}
