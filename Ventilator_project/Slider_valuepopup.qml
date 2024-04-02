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
    width: mainwindowid.width
    height: mainwindowid.height
    property int minValue: 0
    property int maxValue: 100
    Header{}
    Rectangle{
        id:fullminusheader
        width:parent.width
        height:parent.height*0.89
        anchors.bottom: parent.bottom
        color:"black"
        Text {
            id: topleft
            text: qsTr("Units : L\t\t\t\t\tMinute V")
            color:"white"
            anchors.bottom:rectid1.top;anchors.bottomMargin: 10
            anchors.left: parent.left;anchors.leftMargin: 100
            font.pointSize: 15
        }
        Rectangle {
            id:rectid1
            anchors.left: parent.left;anchors.leftMargin: 100
            anchors.verticalCenter: parent.verticalCenter
            height: parent.height * 0.7
            width: parent.width * 0.5
            color:"black"
            border.width:2
            border.color:"blue"
            Rectangle {
                id:rectid
                anchors.centerIn: parent
                height: parent.height-15
                width: parent.width -15
                color:"#3e4bb8"
                border.width:4
                border.color:"#2665ad"

            }
        }
        Rectangle {
            anchors.right:  parent.right;anchors.rightMargin: 100
            anchors.verticalCenter: parent.verticalCenter
            height: parent.height
            width: parent.width * 0.1
            color: "black"
            Rectangle {
                anchors.bottom:parent.bottom;anchors.bottomMargin: 300
                anchors.horizontalCenter: parent.horizontalCenter
                height: parent.height * 0.2
                width: parent.width*0.9
                radius:height/1.5
                color: "#576373"
                Text {
                    anchors.centerIn: parent
                    font.pointSize: parent.width*0.4
                    color:"white"
                    font.bold: true
                    text: "▲"
                    MouseArea{
                        anchors.fill:parent
                        onClicked: {

                        }
                    }
                }
            }
            Rectangle {

                anchors.bottom:parent.bottom;anchors.bottomMargin: 200
                anchors.horizontalCenter: parent.horizontalCenter
                height: parent.height * 0.2
                width: parent.width*0.9
                radius:height/1.5
                color: "#576373"
                Text {
                    anchors.centerIn: parent
                    font.pointSize: parent.width*0.4
                    color:"white"
                    font.bold: true
                    text: "▼"
                }
                MouseArea{
                    anchors.fill:parent
                    onClicked: {
                        givenvalue-=1
                    }
                }

            }
            Rectangle {
                anchors.bottom:parent.bottom;anchors.bottomMargin: 100
                anchors.horizontalCenter: parent.horizontalCenter
                height: parent.height * 0.2
                width: parent.width*0.9
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

                    }
                }

            }

            Rectangle {
                id: checkBoxBackground
                height: parent.height * 0.08
                width: parent.width*0.5
                anchors.bottom:parent.bottom;anchors.bottomMargin: 30
                anchors.horizontalCenter: parent.horizontalCenter
                color: checkbox.checked ? "green" : "lightgray"
                border.color: "gray"
                border.width: 2
                radius: 3

                MouseArea {
                    anchors.fill: parent
                    onClicked: checkbox.checked = !checkbox.checked
                }
            }

            Text {
                anchors.bottom:parent.bottom;anchors.bottomMargin: 50

                anchors.left: checkBoxBackground.right
                anchors.leftMargin: 5
                text: "Enable"
                color:"white"
            }

            CheckBox {
                id: checkbox
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 5
                visible: false // Hide the actual checkbox
                checked: false // Initial state of the checkbox
                onCheckedChanged: {
                    rectid1.enabled = !checked
                }
            }



        }
        Rectangle {
            anchors.bottom:parent.bottom;anchors.bottomMargin: 8
            anchors.left: parent.left;anchors.leftMargin: 100
            height: parent.height * 0.1
            width: parent.width *0.5
            color: "#39f505"
            radius:15
            Text {
                anchors.centerIn: parent
                font.pointSize: parent.width*0.05
                color:"white"
                font.bold: true
                text: "✓"
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    slideid.visible=false
                    slideid.enabled=false
                    openscreenid.visible=true
                    openscreenid.enabled=true
                }
            }
        }
    }
}
