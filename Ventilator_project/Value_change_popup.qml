import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.12
import QtQuick.Controls 1.4
import QtQuick 2.2

Item {
    width: mainwindowid.width/2.5
    height: mainwindowid.height/1.8
    property int textvalue:8
     property int alotedvalue:8
    signal gotoopenscreen()
    Open_screen{
        enabled:false
        Rectangle{
            width:parent.width
            height:parent.height
            color:"red"
            opacity:0.2
        }
    }

    Rectangle {
        anchors.right:parent.right;anchors.rightMargin: 100
        anchors.verticalCenter: parent.verticalCenter
        height: parent.height * 0.6
        width: parent.width * 0.5
        border.width:4
        border.color:"white"
        RadialGradient {
            anchors.fill: parent
            gradient: Gradient {
                GradientStop { position: 0.7; color: "black" }
                GradientStop { position: 0.6; color: "#4F70A3" }
                GradientStop { position: 0.0; color: "#516B82" }
            }
        }
        Text {
            id: popuptextid
            text: textvalue
            font.pointSize: parent.width * 0.4
            color:"white"
            anchors.centerIn: parent
        }
    }
    Rectangle {
        anchors.left:parent.left;anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        height: parent.height * 0.9
        width: parent.width * 0.2
        color: "transparent"
        Rectangle {
            anchors.top:parent.top;anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            height: parent.height * 0.25
            width: parent.width*0.8
            radius:height/1.5
            color: "#576373"
            Text {
                anchors.centerIn: parent
                font.pointSize: parent.width*0.4
                color:"white"
                font.bold: true
                text: "▲" // Unicode character for "up"
                MouseArea{
                    anchors.fill:parent
                    onClicked: {
                        textvalue+=1
                    }
                }
            }
        }
        Rectangle {

            anchors.centerIn:  parent
            height: parent.height * 0.25
            width: parent.width*0.8
            radius:height/1.5
            color: "#576373"
            Text {
                anchors.centerIn: parent
                font.pointSize: parent.width*0.4
                color:"white"
                font.bold: true
                text: "▼" // Unicode character for "down"
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    textvalue-=1
                }
            }

        }
        Rectangle {
            anchors.bottom:parent.bottom;anchors.bottomMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            height: parent.height * 0.25
            width: parent.width*0.8
            radius:height/1.5
            color: "#576373"
            Text {
                anchors.centerIn: parent
                font.pointSize: parent.width*0.7
                color:"white"
                font.bold: true
                text: "↺" // Unicode character for "reset"
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    textvalue=alotedvalue
                }
            }

        }
    }
    Rectangle {
        anchors.bottom:parent.bottom;anchors.bottomMargin: 8
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height * 0.15
        width: parent.width *0.3
        color: "#56D250"
        radius:15
        Text {
            anchors.centerIn: parent
            font.pointSize: parent.width*0.2
            color:"white"
            font.bold: true
            text: "✓"
        }
        MouseArea{
            anchors.fill:parent
            onClicked: {
                alotedvalue=textvalue
                gotoopenscreen()
            }
        }
    }
}
