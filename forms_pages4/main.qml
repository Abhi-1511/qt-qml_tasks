import QtQuick 2.15
import QtQuick.Window 2.15
Window {
    width: 800
    height: 600
    visible: true
    title: qsTr("Hello World")
    Registration{
        id:regid
    }
    Confirmation{
        id:confirmid
        visible: false
        anchors.centerIn: parent
    }
    Component.onCompleted: {
        regid.sendData.connect(confirmid.g)
        popid.saveClicked.connect(regid.popi)
        popid.deleteClicked.connect(regid.popj)


    }
    Popup{
        id:popid
        visible:false
    }

}

