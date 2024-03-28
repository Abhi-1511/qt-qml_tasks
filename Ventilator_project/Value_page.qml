import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.12
import QtQuick.Controls 1.4
import QtQuick 2.4

Item {
    id: itemid
    width: mainwindowid.width
    height: mainwindowid.height
    signal gotoopenscreen()
Header{}

    Drawer {
        id: drawer
        width:parent.width*0.8
        height:parent.height/1.55
        y:parent.height*0.11
        onClosed: gotoopenscreen()
        Label {

            width:parent.width
            height:parent.height

            Rectangle{
                id:midrect
                width:parent.width
                height:parent.height
                color: "black"
                Rectangle{
                    id:peakRect
                    width:parent.width/5
                    height:parent.height/2.4
                    color:"black"
                    anchors.top:parent.top;anchors.topMargin: 10
                    anchors.left:parent.left;anchors.leftMargin: parent.width/10
                    RadialGradient {
                        anchors.fill: parent
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "#89AAD3" }
                            GradientStop { position: 0.4; color: "black" }
                        }
                    }
                    Text {
                        anchors.top: parent.top;anchors.topMargin: -6
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: peekpmtext
                        text: qsTr("Peek P.")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.1
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: peekpmvalue
                        text: qsTr("0")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.2
                    }
                    Text {
                        anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: peekpmtype
                        text: qsTr("cmH2O")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.08
                    }
                }
                Rectangle{
                    id:breathrect
                    width:parent.width/5
                    height:parent.height/2.4
                    anchors.top:parent.top;anchors.topMargin: 10
                    anchors.left:peakRect.right
                    RadialGradient {
                        anchors.fill: parent
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "#89AAD3" }
                            GradientStop { position: 0.4; color: "black" }
                        }
                    }
                    Text {
                        anchors.top: parent.top;anchors.topMargin: -6
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: breathratemtext
                        text: qsTr("Breath Rate")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.1
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: breathratemvalue
                        text: qsTr("0")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.2
                    }
                    Text {
                        anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: breathratemtype
                        text: qsTr("BPM")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.08
                    }
                }
                Rectangle{
                    id:spontrect
                    width:parent.width/5
                    height:parent.height/2.4
                    anchors.top:parent.top;anchors.topMargin: 10
                    anchors.left:breathrect.right
                    RadialGradient {
                        anchors.fill: parent
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "#89AAD3" }
                            GradientStop { position: 0.4; color: "black" }
                        }
                    }
                    Text {
                        anchors.top: parent.top;anchors.topMargin: -6
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: spontbrmtext
                        text: qsTr("Spont BR")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.1
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: spontbrmvalue
                        text: qsTr("0")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.2
                    }
                    Text {
                        anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: spontbrmtype
                        text: qsTr("%")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.08
                    }
                }
                Rectangle{
                    id:tvrect
                    width:parent.width/5
                    height:parent.height/2.4
                    anchors.top:parent.top;anchors.topMargin: 10
                    anchors.left:spontrect.right
                    RadialGradient {
                        anchors.fill: parent
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "#89AAD3" }
                            GradientStop { position: 0.4; color: "black" }
                        }
                    }
                    Text {
                        anchors.top: parent.top;anchors.topMargin: -6
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: tviemtext
                        text: qsTr("TV(i/e)")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.1
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: tviemvalue
                        text: qsTr("0")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.2
                    }
                    Text {
                        anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: tviemtype
                        text: qsTr("mL")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.08
                    }
                }
                Rectangle{
                    id:fioRect
                    width:parent.width/5
                    height:parent.height/2.4
                    //color:"black"
                    anchors.left:parent.left;anchors.leftMargin: parent.width/10
                    anchors.top:parent.top;anchors.topMargin: itemid.height/2.8
                    RadialGradient {
                        anchors.fill: parent
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "#89AAD3" }
                            GradientStop { position: 0.4; color: "black" }
                        }
                    }
                    Text {
                        anchors.top: parent.top;anchors.topMargin: -6
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: fio2mtext
                        text: qsTr("FiO2")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.1
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: fio2mvalue
                        text: qsTr("0")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.2
                    }
                    Text {
                        anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: fio2mtype
                        text: qsTr("%")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.08
                    }

                }
                Rectangle{
                    id:ieratiorect
                    width:parent.width/5
                    height:parent.height/2.4
                    //color:"yellow"
                    anchors.left:fioRect.right
                    anchors.top:parent.top;anchors.topMargin: itemid.height/2.8
                    RadialGradient {
                        anchors.fill: parent
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "#89AAD3" }
                            GradientStop { position: 0.4; color: "black" }
                        }
                    }
                    Text {
                        anchors.top: parent.top;anchors.topMargin: -6
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: ieratiomtext
                        text: qsTr("I:E Ratio")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.1
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: ieratiomvalue
                        text: qsTr("0:0")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.2
                    }

                }
                Rectangle{
                    id:spo2rect
                    width:parent.width/5
                    height:parent.height/2.4
                    // color:"black"
                    anchors.left:ieratiorect.right
                    anchors.top:parent.top;anchors.topMargin: itemid.height/2.8
                    RadialGradient {
                        anchors.fill: parent
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "#89AAD3" }
                            GradientStop { position: 0.4; color: "black" }
                        }
                    }
                    Text {
                        anchors.top: parent.top;anchors.topMargin: -6
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: spo2hrmtext
                        text: qsTr("SpO2/HR")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.1
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: spo2hrmvalue
                        text: qsTr("__/__")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.1
                    }
                    Text {
                        anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: spo2hrmtype
                        text: qsTr("%")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.08
                    }
                }
                Rectangle{
                    id:minuteVolrect
                    width:parent.width/5
                    height:parent.height/2.4
                    //color:"green"
                    anchors.left:spo2rect.right
                    //anchors.bottom: parent.bottom
                    anchors.top:parent.top;anchors.topMargin: itemid.height/2.8
                    RadialGradient {
                        anchors.fill: parent
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "#89AAD3" }
                            GradientStop { position: 0.4; color: "black" }
                        }
                    }
                    Text {
                        anchors.top: parent.top;anchors.topMargin: -6
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: minutevolmtext
                        text: qsTr("Minute Vol")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.1
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: minutevolmvalue
                        text: qsTr("0")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.2
                    }
                    Text {
                        anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: minutevolmtype
                        text: qsTr("L")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.08
                    }
                }

            }
        }
    }

    // Function to open the drawer
    function openvaluedrawer() {
        drawer.open()
    }
    Bottom_components{}
}
