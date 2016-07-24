import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2

Dialog {
    property bool newOrderVisible: false
    id: dateDialog
    visible: newOrderVisible
    title: "Choose a date"
    signal ok()


    standardButtons: StandardButton.Ok | StandardButton.Cancel
    onAccepted:
    {
        ok()
    }

    Rectangle{
        anchors.fill: parent
        Text {
            id: content
            text: qsTr("It will clear will all the check out Item")
            anchors.centerIn: parent
        }
    }


}
