import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.12
import QtQuick.Controls 1.4
import QtQuick 2.2

Item {
    width: mainwindowid.width / 1.5
    height: mainwindowid.height / 3
    anchors.centerIn: parent
    property int waittime: 2
    signal gotoreleasepage()

    Rectangle {
        id:pausenotificationrect
        width: parent.width/1.5
        height: parent.height/3
        color: "black"
        anchors.centerIn: parent
        border.width: 3
        border.color: "white"

        Text {
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            id: pleasewaittext
            text: "Do You want to Pause"
            font.pointSize: parent.width * 0.04
            font.bold: true
            color: "white"
        }
        Rectangle {
            id: confirmRect
            width: parent.width * 0.4
            height: parent.height * 0.3
            color: "green"
            anchors.bottom: parent.bottom;anchors.bottomMargin: 20
            anchors.left: parent.left;anchors.leftMargin: 20
            radius:15
            border.width:2
            border.color:"black"
            Text {
                anchors.centerIn: parent
                text: "Confirm"
                color: "white"
                font.pointSize: 15
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Confirm clicked")

                }
            }
        }
        Rectangle {
            id: cancleRect
            width: parent.width * 0.4
            height: parent.height * 0.3
            color: "gray"
            anchors.bottom: parent.bottom;anchors.bottomMargin: 20
            anchors.right: parent.right;anchors.rightMargin: 20
            radius:15
            border.width:2
            border.color:"black"
            Text {
                anchors.centerIn: parent
                text: "Cancel"
                color: "white"
                font.pointSize: 15
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Cancle clicked")

                }
            }
        }

    }
}

