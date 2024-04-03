import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.12
import QtQuick.Controls 1.4
import QtQuick 2.2

Item {
    id:itemid
    width: mainwindowid.width/2.5
    height: mainwindowid.height/1.8
    anchors.centerIn: parent
    x:mainwindowid.width/3
    y:mainwindowid.height/3
    property int alotedvalue:0
    property int givenvalue:0
    property int givenid:0
    property int givenvalueupdater:0
    property int minimumgivenvalue:0
    signal gotoopenscreen(int givenids,int av)


    function assignedvalues(id_s,val2){
        valuechangepopupid.visible=true
        valuechangepopupid.enabled=true
        openscreenid.visible=true
        openscreenid.enabled=false
        givenvalue=val2
        givenvalueupdater=val2
        givenid=id_s
    }

    Rectangle {
        id:rectid
        anchors.centerIn: parent
        height: parent.height * 0.6
        width: parent.width * 0.5
        border.width:4
        border.color:"red"
        RadialGradient {
            anchors.fill: parent
            gradient: Gradient {
                GradientStop { position: 0.6; color: "black" }
                GradientStop { position: 0.3; color: "#4F70A3" }
                GradientStop { position: 0.0; color: "#516B82" }
            }
        }
        Text {
            id: popuptextid
            text: givenvalue
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
                        givenvalue+=1
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
                    givenvalue-=1
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
                text: "↺"
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    givenvalue=givenvalueupdater
                }
            }

        }
    }
    Rectangle {
        anchors.bottom:parent.bottom;anchors.bottomMargin: 8
        anchors.left: parent.left;anchors.leftMargin: 90
        height: parent.height * 0.15
        width: parent.width *0.25
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
                alotedvalue=givenvalue
                console.log(givenvalue+" givenvalues")
                console.log(alotedvalue+" alotedvalues")
                gotoopenscreen(givenid,popuptextid.text)
            }
        }
    }
    Rectangle{
        anchors.bottom:parent.bottom;anchors.bottomMargin: 8
        anchors.right: parent.right;anchors.rightMargin: 90
        height: parent.height * 0.15
        width: parent.width *0.25
        color: "red"
        radius:15
        Text {
            anchors.centerIn: parent
            font.pointSize: parent.width*0.2
            color:"white"
            font.bold: true
            text: "\u2717"
        }
        MouseArea{
            anchors.fill:parent
            onClicked: {
                gotoopenscreen(givenid,givenvalueupdater)
            }
        }
    }
}
