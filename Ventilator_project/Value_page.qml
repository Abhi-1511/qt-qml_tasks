import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.12
import QtQuick.Controls 1.4
import QtQuick 2.4

Rectangle {
    id: itemid
    width: mainwindowid.width
    height: mainwindowid.height
    Open_screen{
        enabled:false
        Rectangle{
            width:parent.width
            height:parent.height
            color:"white"
            opacity:0.1
        }
    }

    signal gotoopenscreen()
    Drawer {
        id: drawer
        width:parent.width*0.8
        height:parent.height/1.55
        y:parent.height*0.11
        onClosed: gotoopenscreen()
        Rectangle{
            id:midrect
            width:parent.width
            height:parent.height
            color: "black"
        }


        Label {
            id:label1
            visible:true
            enabled:true
            width:parent.width
            height:parent.height*0.8
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
                anchors.left:spo2rect.right
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
            Rectangle {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 10
                id: rightbutton
                color: "black"
                width: 40
                height: 100

                Text {
                    anchors.centerIn: parent
                    text: "►"
                    font.pixelSize: 50
                    color: "white"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        drawer2.open()

                    }
                }
            }
        }
    Rectangle{
        color:"green"
        id:rectidc
        width:parent.width/4
        height:parent.height*0.08
        border.width:2
        border.color: "gray"
        radius:10
        anchors.bottom: parent.bottom;anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            anchors.centerIn: parent
            id: cancleid
            text: qsTr("Cancel")
            font.pointSize: parent.height*0.4
            color:"white"
            font.bold: true
        }
        MouseArea{
            anchors.fill:parent
            onClicked: {
                drawer.close()
            }
        }
    }
    Drawer{
        id: drawer2
        width:parent.width*0.8
        height:parent.height/1.55
        y:parent.height*0.11
        onClosed: gotoopenscreen()

        edge:Qt.RightEdge

        Rectangle{
            id:midrect2
            width:parent.width
            height:parent.height
            color: "black"
        }


        Label {
            id:label2
            visible:true
            enabled:true
            width:parent.width
            height:parent.height*0.8
            Rectangle{
                id:peakRect2
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
                    id: peekpmtext2
                    text: qsTr("Peek P.")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.1
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: peekpmvalue2
                    text: qsTr("0")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.2
                }
                Text {
                    anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: peekpmtype2
                    text: qsTr("cmH2O")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.08
                }
            }
            Rectangle{
                id:breathrect2
                width:parent.width/5
                height:parent.height/2.4
                anchors.top:parent.top;anchors.topMargin: 10
                anchors.left:peakRect2.right
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
                    id: breathratemtext2
                    text: qsTr("Breath Rate")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.1
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: breathratemvalue2
                    text: qsTr("0")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.2
                }
                Text {
                    anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: breathratemtype2
                    text: qsTr("BPM")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.08
                }
            }


            Rectangle{
                id:fioRect2
                width:parent.width/5
                height:parent.height/2.4
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
                    id: fio2mtext2
                    text: qsTr("FiO2")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.1
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: fio2mvalue2
                    text: qsTr("0")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.2
                }
                Text {
                    anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: fio2mtype2
                    text: qsTr("%")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.08
                }

            }
            Rectangle{
                id:ieratiorect2
                width:parent.width/5
                height:parent.height/2.4
                anchors.left:fioRect2.right
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
                    id: ieratiomtext2
                    text: qsTr("I:E Ratio")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.1
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: ieratiomvalue2
                    text: qsTr("0:0")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.2
                }

            }


            Rectangle {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
                id: lefttbutton
                color: "black"
                width: 40
                height: 100

                Text {
                    anchors.centerIn: parent
                    text: "►"
                    font.pixelSize: 50
                    color: "white"
                }
            }
        }
    Rectangle{
        color:"green"
        id:rectidc2
        width:parent.width/4
        height:parent.height*0.08
        border.width:2
        border.color: "gray"
        radius:10
        anchors.bottom: parent.bottom;anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            anchors.centerIn: parent
            id: cancleid2
            text: qsTr("Cancel")
            font.pointSize: parent.height*0.4
            color:"white"
            font.bold: true
        }
        MouseArea{
            anchors.fill:parent
            onClicked: {
                drawer2.close()
            }
        }
    }
}
}

    function openvaluedrawer() {
        drawer.open()
    }
}
