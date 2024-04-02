import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.12
import QtQuick.Controls 1.4
import QtQuick 2.2

Item {
    width: mainwindowid.width / 2
    height: mainwindowid.height / 5
    anchors.centerIn: parent
    property int waittime: 3
    signal gotoreleasepage()

    Rectangle {
        width: parent.width
        height: parent.height
        color: "black"
        anchors.centerIn: parent
        border.width: 3
        border.color: "white"

        BusyIndicator {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            running: timer.running
        }

        Text {
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            id: pleasewaittext
            text: "Hold for " + waittime + " sec"
            font.pointSize: parent.width * 0.04
            font.bold: true
            color: "white"
        }
    }

    Timer {
        id: timer
        interval: waittime * 1000
        running: holdid.visible===true?true:false
        repeat: false
        onTriggered: {
            timer.running = false;

            holdid.visible=false
        }
    }
}
