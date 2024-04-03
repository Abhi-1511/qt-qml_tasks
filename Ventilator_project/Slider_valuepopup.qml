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
    property int firstvalue:0
    property int secondvalue:0
    property int fromvalue:0
    property int tovalue:0
    property string textheading:""
    property int ids:0
    signal gobacktoslidescreen(int fvalue,int svalue,int idss,bool dis)
    function getvalues(a,b,c,d,e,f){
        firstvalue=a
        secondvalue=b
        fromvalue=c
        tovalue=d
        textheading=e
        ids=f
        control.first.value=a
        control.second.value=b
        slideid.visible=false
        slideid.enabled=false
        slidepopupid.visible=true
        slidepopupid.enabled=true
    }
    Header{}
    Rectangle{
        id:fullminusheader
        width:parent.width
        height:parent.height*0.89
        anchors.bottom: parent.bottom
        color:"black"
        Text {
            id: topleft
            text: textheading
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

                RangeSlider{
                    id: control
                    first.value: firstvalue
                    second.value: secondvalue
                    from:fromvalue
                    to:tovalue
                    orientation: Qt.Vertical
                    anchors.centerIn: parent

                    Rectangle {
                        x: control.leftPadding + control.availableWidth / 2 - width / 2
                        y: control.topPadding + control.second.visualPosition * (control.availableHeight - height/5)
                        implicitWidth: 40
                        implicitHeight: (control.first.visualPosition - control.second.visualPosition) * control.availableHeight
                        width: implicitWidth
                        height: implicitHeight
                        radius: 5
                        color: "#21be2b"
                    }
                    background: Rectangle {
                        x: control.leftPadding + control.availableWidth / 2 - width / 2
                        y: control.topPadding
                        implicitWidth: 40
                        implicitHeight: 260
                        width: implicitWidth
                        height: control.availableHeight
                        radius: 5
                        color: "#bdbebf"
                        MouseArea{
                            anchors.fill:parent
                            onClicked: {
                                mouse.accepted = true
                            }
                        }

                    }

                    first.handle: Rectangle {
                        x: control.leftPadding + control.availableWidth / 2 - width / 2
                        y: control.topPadding + control.first.visualPosition * (control.availableHeight - height)
                        implicitWidth: 50
                        implicitHeight: 35
                        radius: 13
                        color: control.first.pressed ? "#f0f0f0" : "#f6f6f6"

                        Text {
                            id: ltext
                            anchors.centerIn: parent
                            text: "L"
                            color:"blue"
                            font.bold:true
                        }
                        Rectangle{
                            id:borderidfirst
                            anchors.left:parent.left;anchors.leftMargin: -10
                            anchors.top:parent.top;anchors.topMargin: -5
                            anchors.bottom:parent.bottom;anchors.bottomMargin: -10
                            width:parent.width+110
                            height:parent.height+20
                            color:"transparent"
                            border.width:2
                            border.color:"red"
                            visible: false
                        }
                        MouseArea{
                            anchors.fill:borderidfirst
                            onClicked: {
                                borderidfirst.visible=true
                                borderidsec.visible=false
                            }

                        }



                        Rectangle{
                            width:40
                            height:40
                            anchors.left:parent.left;anchors.leftMargin:100
                            color:"white"
                            border.width:2
                            border.color: "black"
                            Text {
                                id: firstval
                                anchors.centerIn: parent
                                text:control.first.value
                                color:"black"
                            }
                        }
                    }


                    second.handle: Rectangle {
                        x: control.leftPadding + control.availableWidth / 2 - width / 2
                        y: control.topPadding + control.second.visualPosition * (control.availableHeight - height)
                        implicitWidth: 50
                        implicitHeight: 35
                        radius: 13
                        color: control.second.pressed ? "#f0f0f0" : "#f6f6f6"
                        border.color: "#bdbebf"

                        Text {
                            id: htext
                            anchors.centerIn: parent
                            text: "H"
                            color:"red"
                            font.bold:true
                        }
                        Rectangle{
                            id:borderidsec
                            anchors.right:parent.right;anchors.rightMargin: -10
                            anchors.top:parent.top;anchors.topMargin: -5
                            anchors.bottom:parent.bottom;anchors.bottomMargin: -10
                            width:parent.width+110
                            height:parent.height+20
                            color:"transparent"
                            border.width:2
                            border.color:"red"
                            visible:false
                        }
                        MouseArea{
                            anchors.fill:borderidsec
                            onClicked: {
                                borderidsec.visible=true
                                borderidfirst.visible=false
                            }

                        }

                        Rectangle{
                            width:40
                            height:40
                            anchors.right:parent.right;anchors.rightMargin:100
                            color:"white"
                            border.width:2
                            border.color: "black"
                            Text {
                                id: secondval
                                anchors.centerIn: parent
                                text: control.second.value
                                color:"black"
                            }
                        }
                    }
                }
            }
        }
        Rectangle {
            anchors.right:  parent.right;anchors.rightMargin: 100
            anchors.verticalCenter: parent.verticalCenter
            height: parent.height
            width: parent.width * 0.1
            color: "black"
            Rectangle {
                id:upid
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
                            if(borderidfirst.visible===true){
                                control.first.value++
                            }
                            else if(borderidsec.visible===true){
                                control.second.value++
                            }
                        }
                    }
                }
            }
            Rectangle {
                id:downid
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
                        onClicked: {
                            if(borderidfirst.visible===true)
                                control.first.value--
                            else if(borderidsec.visible===true)
                                control.second.value--
                        }
                    }
                }

            }
            Rectangle {
                id:resetid
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
                        control.first.value=firstvalue
                        control.second.value=secondvalue
                    }
                }

            }

            Rectangle {
                id: checkBoxBackground
                height: parent.height * 0.08
                width: parent.width*0.5
                anchors.bottom:parent.bottom;anchors.bottomMargin: 30
                anchors.horizontalCenter: parent.horizontalCenter
                color: checkbox.checked ? "gray" : "lightgray"
                border.color: "gray"
                border.width: 2
                radius: 3

                MouseArea {
                    anchors.fill: parent
                    onClicked: checkbox.checked = !checkbox.checked
                }
            }

            Text {
                id:enableid
                anchors.bottom:parent.bottom;anchors.bottomMargin: 50
                anchors.left: checkBoxBackground.right
                anchors.leftMargin: 5
                text: "Enabled State"
                color:"white"
            }

            CheckBox {
                id: checkbox
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 5
                visible: false
                checked: false
                onCheckedChanged: {
                        if (checked) {
                            control.enabled = false;
                            upid.enabled=false
                            downid.enabled=false
                            resetid.enabled=false
                            borderidfirst.visible=false
                            borderidsec.visible=false
                            enableid.text="Disabled State"
                        } else {
                            control.enabled = true;
                            upid.enabled=true
                            downid.enabled=true
                            resetid.enabled=true
                            enableid.text="Enabled State"
                        }
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
                    slideid.visible=true
                    slideid.enabled=true
                    slidepopupid.visible=false
                    slidepopupid.enabled=false
                    gobacktoslidescreen(control.first.value,control.second.value,ids,checkbox.checked)
                    borderidsec.visible=false
                    borderidfirst.visible=false
                    borderidsec.enabled=false
                    borderidfirst.enabled=false
                }
            }
        }
    }
}
