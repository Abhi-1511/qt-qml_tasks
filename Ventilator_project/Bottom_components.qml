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
     property bool lockconfirm:false
    signal openmodepcv()
    signal gotopopuplock()
    signal gotopopupunlock()
    signal gotovaluepage()
    Open_screen{
        visible :false
    }
    property alias lockfactor:itemid.lockconfirm
    property alias lockrectid:lockrect.enabled
    function unlockscreen(){
        lockconfirm=true
        openscreenid.visible=true
        openscreenid.enabled=true
        popuplockid.visible=false
        popuplockid.enabled=false
    }
    function unlockscreenoncancel(){
        lockconfirm=true
        openscreenid.visible=true
        openscreenid.enabled=true
        popupunlockid.visible=false
        popupunlockid.enabled=false

    }
    Rectangle{
                id:bottomrect
                anchors.bottom: parent.bottom
                width:parent.width
                height:parent.height/4
                color: "green"
                Rectangle{
                    id:modeRect
                    width:parent.width/6.666
                    height:parent.height
                    color:"#D1CD08"
                    anchors.left:parent.left
                    border.width:2
                    border.color:"black"
                    enabled: lockconfirm===true?false:true
                    Text {
                        anchors.top: parent.top;anchors.topMargin: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: modetext
                        text: qsTr("Mode")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.12
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: modetypetext
                        text: qsTr("PCV")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.10
                    }
                    MouseArea{
                        anchors.fill:parent
                        onClicked:{
                            openmodepcv()

                        }
                    }
                }
                Rectangle{
                    id:insprect
                    width:parent.width/7.2727
                    height:parent.height
                    color:"#89AAD3"
                    anchors.left:modeRect.right
                    border.width:2
                    border.color:"black"
                    enabled: lockconfirm===true?false:true
                    Text {
                        anchors.top: parent.top;anchors.topMargin: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: inspsstext
                        text: qsTr("Insp ss")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.12
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: inspvaluetext
                        text: "15"
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.2
                    }
                    Text {
                        anchors.bottom: parent.bottom;anchors.bottomMargin: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: insptypetext
                        text: qsTr("cmH2O")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.10
                    }
                    MouseArea{
                        anchors.fill:parent
                        onClicked: {
                            gotovaluepage()
                        }
                    }
                }
                Rectangle{
                    id:peeprect
                    width:parent.width/7.2727
                    height:parent.height
                    color:"#89AAD3"
                    anchors.left:insprect.right
                    border.width:2
                    border.color:"black"
                    enabled: lockconfirm===true?false:true
                    Text {
                        anchors.top: parent.top;anchors.topMargin: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: peeptext
                        text: qsTr("PEEP")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.12
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: peepvaluetext
                        text: qsTr("2")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.2
                    }
                    Text {
                        anchors.bottom: parent.bottom;anchors.bottomMargin: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: peeptypetext
                        text: qsTr("cmH2O")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.10
                    }
                }
                Rectangle{
                    id:bRaterect
                    width:parent.width/7.2727
                    height:parent.height
                    color:"#89AAD3"
                    anchors.left:peeprect.right
                    border.width:2
                    border.color:"black"
                    enabled: lockconfirm===true?false:true
                    Text {
                        anchors.top: parent.top;anchors.topMargin: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: bratetext
                        text: qsTr("B. Rate")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.12
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: bratevaluetext
                        text: qsTr("12")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.2
                    }
                    Text {
                        anchors.bottom: parent.bottom;anchors.bottomMargin: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: bratetypetext
                        text: qsTr("BPM")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.10
                    }
                }
                Rectangle{
                    id:inspTimeRect
                    width:parent.width/7.2727
                    height:parent.height
                    color:"#89AAD3"
                    anchors.right:lockrect.left
                    border.width:2
                    border.color:"black"
                    enabled: lockconfirm===true?false:true
                    Text {
                        anchors.top: parent.top;anchors.topMargin: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: inspss2text
                        text: qsTr("Insp. Time")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.12
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: inspvalue2text
                        text: qsTr("1.5")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.2
                    }
                    Text {
                        anchors.bottom: parent.bottom;anchors.bottomMargin: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: insptype2text
                        text: qsTr("sec")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.10
                    }
                }
                Rectangle {
                    id: lockrect
                    width: parent.width / 7.2727
                    height: parent.height
                    color: "white"
                    anchors.right: playrect.left
                    border.width: 2
                    border.color: "black"
                    enabled: true
                    Image {
                        id: lockImage
                        width: parent.width * 0.8
                        height: parent.height * 0.8
                        anchors.centerIn: parent
                        fillMode: Image.PreserveAspectFit
                        source: lockconfirm===false ? "file:///C:/Users/Abhi/Desktop/lock.png" : "file:///C:/Users/Abhi/Desktop/locked.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            // if (toprectids===true) {
                            //     gotopopuplock()
                            //     console.log(midrect.height)

                            // } else {
                            //     gotopopupunlock()
                            //     lockconfirm = false

                            // }
                        }
                    }
                }
                Rectangle{
                    id:playrect
                    width:parent.width/6.1538
                    height:parent.height
                    color:"white"
                    anchors.right:parent.right
                    border.width:2
                    border.color:"black"
                    enabled: lockconfirm===true?false:true
                    Image {
                        width:parent.width*0.8
                        height:parent.height*0.8
                        source: "file:///C:/Users/Abhi/Desktop/play.png"
                        anchors.centerIn: parent
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }
}
