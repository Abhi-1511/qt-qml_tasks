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
    property bool inpause:false
    property bool changeimage:false
    property bool startconfirm:false
    property real fillPercentage: 0
    property int waittime:3
    property int buffertime:0
    property int clickedonce:0
    signal gotoholdpage()
    signal openmodepcv()
    signal gotopopuplock()
    signal gotopopupunlock()
    signal gotovaluepage(int flag1)
    signal gotosaveprofile()
    signal gotodevicesettings()
    signal gotoremoveprofile()
    signal gotodevicelogpage()
    signal gotocalibrationpopup()
    signal openvaluechangepopup(int ids,int val1)
    function unlockscreen(){
        lockconfirm=true
        foropacity.opacity=0
        openscreenid.visible=true
        openscreenid.enabled=true
        popuplockid.visible=false
        popuplockid.enabled=false
    }
    function unlockscreenoncancel(){
        lockconfirm=false
        foropacity.opacity=0
        openscreenid.visible=true
        openscreenid.enabled=true
        popupunlockid.visible=false
        popupunlockid.enabled=false

    }
    function alotedvalue(textfieldid,alotval){
        foropacity.opacity=0
        switch(textfieldid) {
        case 1:
            peekpmvalue.text = alotval;
            break;
        case 2:
            breathratemvalue.text = alotval;
            break;
        case 3:
            spontbrmvalue.text = alotval;
            break;
        case 4:
            tviemvalue.text = alotval;
            break;
        case 5:
            fio2mvalue.text = alotval;
            break;
        case 6:
            ieratiomvalue.text = alotval;
            break;
        case 7:
            spo2hrmvalue.text = alotval;
            break;
        case 8:
            minutevolmvalue.text = alotval;
            break;
        default:
            console.error("Invalid text field ID:", textfieldid);
        }

    }

    Rectangle{
        id:openScreenMainRect
        width:parent.width
        height:parent.height
        color:"black"
        Header{
            id:headersubid
            enabled:lockconfirm?false:true

        }
        Rectangle{
            id:linerect
            color:"gray"
            width:parent.width
            height:parent.height/80
            y:parent.height/10
        }
        Rectangle{
            id:midrect
            anchors.top:linerect.bottom;anchors.topMargin: 5
            width:parent.width
            height:parent.height/1.6
            color: "transparent"
            enabled: lockconfirm?false:true
            Rectangle {
                id: drawRect
                width: parent.width / 10
                height: parent.height / 5
                radius: 50
                color: "yellow"
                anchors.left: parent.left
                anchors.leftMargin: -50
                anchors.verticalCenter: parent.verticalCenter

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        drawer.open()
                    }
                }
            }
            Drawer {
                id: drawer
                width: 0.6* mainwindowid.width
                height: midrect.height
                y:parent.height/10+10
                Label {
                    width:parent.width
                    height: parent.height
                    anchors.centerIn: parent
                    Rectangle{
                        id:mainrectinsidedrawer
                        width:parent.width
                        height:parent.height
                        color:"#2893BF"
                        anchors.centerIn: parent
                        border.width:1
                        border.color:"black"
                        visible:true
                        enabled:true
                        Rectangle{
                            id:locid
                            width:parent.width*0.4
                            height:parent.height*0.12
                            color:"gray"
                            anchors.left: parent.left;anchors.leftMargin: 10
                            anchors.top:parent.top;anchors.topMargin: 30
                            Text{
                                text:"Location Id"
                                anchors.left: parent.left;anchors.leftMargin: 5
                                anchors.verticalCenter: parent.verticalCenter
                                color:"white"
                                font.pointSize: 12
                            }
                            MouseArea{
                                anchors.fill:parent
                                onClicked: {
                                    mainrectinsidedrawer.visible=false
                                    mainrectinsidedrawer.enabled=false
                                    mainrectinsidelocationid.visible=true
                                    mainrectinsidelocationid.enabled=true
                                }
                            }
                        }
                        Rectangle{
                            id:fio2calibrationrect
                            width:parent.width*0.4
                            height:parent.height*0.12
                            color:"gray"
                            anchors.left: locid.left;anchors.leftMargin: 300
                            anchors.top:parent.top;anchors.topMargin: 30
                            Text{
                                text:"FiO2 calibration"
                                anchors.left: parent.left;anchors.leftMargin: 5
                                anchors.verticalCenter: parent.verticalCenter
                                color:"white"
                                font.pointSize: 12
                            }
                            MouseArea{
                                anchors.fill:parent
                                onClicked: {
                                    gotocalibrationpopup()
                                    drawer.close()
                                }
                            }
                        }
                        Rectangle{
                            id:devicelogrect
                            width:parent.width*0.4
                            height:parent.height*0.12
                            color:"gray"
                            anchors.left: parent.left;anchors.leftMargin: 10
                            anchors.top:parent.top;anchors.topMargin: 90
                            Text{
                                text:"Device Logs"
                                anchors.left: parent.left;anchors.leftMargin: 5
                                anchors.verticalCenter: parent.verticalCenter
                                color:"white"
                                font.pointSize: 12
                            }
                            MouseArea{
                                anchors.fill:parent
                                onClicked: {
                                    gotodevicelogpage()
                                    drawer.close()
                                }
                            }
                        }
                        Rectangle{
                            id:devicesettingsrect
                            width:parent.width*0.4
                            height:parent.height*0.12
                            color:"gray"
                            anchors.left: parent.left;anchors.leftMargin: 10
                            anchors.top:parent.top;anchors.topMargin: 150
                            Text{
                                text:"Device Setting"
                                anchors.left: parent.left;anchors.leftMargin: 5
                                anchors.verticalCenter: parent.verticalCenter
                                color:"white"
                                font.pointSize: 12
                            }
                            MouseArea{
                                anchors.fill:parent
                                onClicked: {
                                    gotodevicesettings()
                                    drawer.close()
                                }
                            }
                        }
                        Rectangle{
                            id:saveprofilerect
                            width:parent.width*0.4
                            height:parent.height*0.12
                            color:"gray"
                            anchors.left: parent.left;anchors.leftMargin: 10
                            anchors.top:parent.top;anchors.topMargin: 250
                            Text{
                                text:"Save as Profile"
                                anchors.left: parent.left;anchors.leftMargin: 5
                                anchors.verticalCenter: parent.verticalCenter
                                color:"white"
                                font.pointSize: 12
                            }
                            MouseArea{
                                anchors.fill:parent
                                onClicked: {
                                    gotosaveprofile()
                                    drawer.close()
                                }
                            }
                        }
                        Rectangle{
                            id:removeprofilerect
                            width:parent.width*0.4
                            height:parent.height*0.12
                            color:"gray"
                            anchors.left: saveprofilerect.left;anchors.leftMargin: 300
                            anchors.top:parent.top;anchors.topMargin: 250
                            Text{
                                text:"Remove Profile"
                                anchors.left: parent.left;anchors.leftMargin: 5
                                anchors.verticalCenter: parent.verticalCenter
                                color:"white"
                                font.pointSize: 12
                            }
                            MouseArea{
                                anchors.fill:parent
                                onClicked: {
                                    gotoremoveprofile()
                                    drawer.close()
                                }
                            }
                        }
                    }
                    /////////////////////////////////
                    Rectangle{
                        id:mainrectinsidelocationid
                        width:parent.width
                        height:parent.height
                        color:"#2893BF"
                        anchors.centerIn: parent
                        border.width:1
                        border.color:"black"
                        visible:false
                        enabled:false
                        Text {
                            anchors.right: parent.right;anchors.rightMargin: 320
                            anchors.top:parent.top;anchors.topMargin: 40
                            id: bedidtext
                            text: qsTr("Bed Id")
                            font.pointSize: 20
                            font.bold:true
                            color:"white"
                        }
                        TextField {
                            id: bedinputid
                            anchors.right: parent.right;anchors.rightMargin: 150
                            anchors.top:parent.top;anchors.topMargin: 40
                            width: 150
                            height: 30
                            placeholderText: "Enter Bed Id"
                        }
                        Text {
                            anchors.right: parent.right;anchors.rightMargin: 320
                            anchors.top:parent.top;anchors.topMargin: 80
                            id: roomidtext
                            text: qsTr("Room Id")
                            font.pointSize: 20
                            font.bold:true
                            color:"white"
                        }
                        TextField {
                            id: roominputid
                            anchors.right: parent.right;anchors.rightMargin: 150
                            anchors.top:parent.top;anchors.topMargin: 80
                            width: 150
                            height: 30
                            placeholderText: "Enter Room Id"
                        }
                        Text {
                            anchors.right: parent.right;anchors.rightMargin: 320
                            anchors.top:parent.top;anchors.topMargin: 120
                            id: facilityidtext
                            text: qsTr("facility Id")
                            font.pointSize: 20
                            font.bold:true
                            color:"white"
                        }
                        TextField {
                            id: facilityid
                            anchors.right: parent.right;anchors.rightMargin: 150
                            anchors.top:parent.top;anchors.topMargin: 120
                            width: 150
                            height: 30
                            placeholderText: "Enter Facility Id"
                        }
                        Rectangle{
                            id:okrectid
                            width:parent.width*0.2
                            height:parent.height*0.1
                            anchors.left:parent.left;anchors.leftMargin:80
                            anchors.bottom: parent.bottom;anchors.bottomMargin: 50
                            border.width:2
                            border.color:"black"
                            color:"gray"
                            radius:5
                            Text{
                                text:"ok"
                                anchors.centerIn: parent
                                font.pointSize: parent.width*0.12
                                color:"white"
                            }
                            MouseArea{
                                anchors.fill:parent
                                onClicked:{
                                    mainrectinsidedrawer.visible=true
                                    mainrectinsidedrawer.enabled=true
                                    mainrectinsidelocationid.visible=false
                                    mainrectinsidelocationid.enabled=false
                                    bedinputid.text=""
                                    roominputid.text=""
                                    facilityid.text=""

                                }
                            }
                        }
                        Rectangle{
                            id:canclerectid
                            width:parent.width*0.2
                            height:parent.height*0.1
                            anchors.right:parent.right;anchors.rightMargin:80
                            anchors.bottom: parent.bottom;anchors.bottomMargin: 50
                            color:"gray"
                            border.width:2
                            border.color:"black"
                            radius:5
                            Text{
                                text:"cancel"
                                anchors.centerIn: parent
                                font.pointSize: parent.width*0.12
                                color:"white"
                            }
                            MouseArea{
                                anchors.fill:parent
                                onClicked:{
                                    mainrectinsidedrawer.visible=true
                                    mainrectinsidedrawer.enabled=true
                                    mainrectinsidelocationid.visible=false
                                    mainrectinsidelocationid.enabled=false
                                    bedinputid.text=""
                                    roominputid.text=""
                                    facilityid.text=""
                                }
                            }
                        }
                    }

                }
            }

            Rectangle{
                id:peakRect
                width:parent.width/5.7142
                height:parent.height/2.2
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
                    text: "5"
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
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        foropacity.opacity=0.2
                        openvaluechangepopup(1,peekpmvalue.text)
                    }
                }
            }
            Rectangle{
                id:breathrect
                width:parent.width/5.7142
                height:parent.height/2.2
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
                    text: "8"
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
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        foropacity.opacity=0.2
                        openvaluechangepopup(2,breathratemvalue.text)
                    }
                }
            }
            Rectangle{
                id:spontrect
                width:parent.width/5.7142
                height:parent.height/2.2
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
                    text: qsTr("12")
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
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        foropacity.opacity=0.2
                        openvaluechangepopup(3,spontbrmvalue.text)
                    }
                }
            }
            Rectangle{
                id:tvrect
                width:parent.width/5.7142
                height:parent.height/2.2
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
                    text: qsTr("6")
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
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        foropacity.opacity=0.2
                        openvaluechangepopup(4,tviemvalue.text)
                    }
                }
            }
            Rectangle{
                id:fioRect
                width:parent.width/5.7142
                height:parent.height/2.2
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
                    text: qsTr("15")
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
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        foropacity.opacity=0.2
                        openvaluechangepopup(5,fio2mvalue.text)
                    }
                }

            }
            Rectangle{
                id:ieratiorect
                width:parent.width/5.7142
                height:parent.height/2.2
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
                    text: qsTr("23")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.2
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        foropacity.opacity=0.2
                        openvaluechangepopup(6,ieratiomvalue.text)
                    }
                }

            }
            Rectangle{
                id:spo2rect
                width:parent.width/5.7142
                height:parent.height/2.2
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
                    text: qsTr("11")
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
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        foropacity.opacity=0.2
                        openvaluechangepopup(7,spo2hrmvalue.text)
                    }
                }
            }
            Rectangle{
                id:minuteVolrect
                width:parent.width/5.7142
                height:parent.height/2.2
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
                    text: qsTr("26")
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
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        foropacity.opacity=0.2
                        openvaluechangepopup(8,minutevolmvalue.text)
                    }
                }
            }
            Rectangle {
                anchors.right: parent.right
                anchors.rightMargin: 40
                width: itemid.width / 6
                height: parent.height
                color: "transparent"
                focus:true


                Canvas {
                    id: gaugeCanvas
                    anchors.left:parent.left;anchors.leftMargin: 40
                    anchors.bottom: parent.bottom
                    width:parent.width-40
                    height:parent.height
                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.clearRect(0, 0, width, height);
                        ctx.fillStyle = "transparent";
                        ctx.fillRect(0, 0, width, height);
                        ctx.fillStyle = "#FF0000";
                        ctx.fillRect(0, height * (1 - fillPercentage), width, height * fillPercentage);
                    }
                }

                Gauge {
                    id: gauge
                    minimumValue: 0
                    maximumValue: 60
                    tickmarkStepSize: 15
                    minorTickmarkCount: 1
                    font.pixelSize: 20
                    anchors.centerIn: parent
                    anchors.horizontalCenterOffset: -4
                    height: itemid.height / 1.6
                    style: GaugeStyle {
                        valueBar: Rectangle {
                            color: "green"
                            implicitWidth: 28
                        }
                        foreground: null
                        tickmark: Item {
                            implicitWidth: 8
                            implicitHeight: 4

                            Rectangle {
                                x: control.tickmarkAlignment === Qt.AlignLeft || control.tickmarkAlignment === Qt.AlignTop ? parent.implicitWidth : -28
                                width: 50
                                height: parent.height
                                color: "#ffffff" // White color for tickmarks
                            }
                        }
                        minorTickmark: Item {
                            implicitWidth: 8
                            implicitHeight: 2

                            Rectangle {
                                x: control.tickmarkAlignment === Qt.AlignLeft || control.tickmarkAlignment === Qt.AlignTop ? parent.implicitWidth : -28
                                width: 28
                                height: parent.height
                                color: "#ffffff" // White color for minor tickmarks
                            }
                        }
                    }
                }

                // Handle key press event
                Timer {
                    id: timerforgauge
                    interval:100
                    running: false
                    repeat: true
                    onTriggered: {
                        if (fillPercentage < 1) {
                            fillPercentage += 0.01;
                            gaugeCanvas.requestPaint();
                        }
                        else fillPercentage=0
                    }
                }
            }

        }
        /////////////////////////
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
                        gotovaluepage(2)
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
                MouseArea{
                    anchors.fill:parent
                    onClicked: {
                        gotovaluepage(2)
                    }
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
                MouseArea{
                    anchors.fill:parent
                    onClicked: {
                        gotovaluepage(2)
                    }
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
                MouseArea{
                    anchors.fill:parent
                    onClicked: {
                        gotovaluepage(2)
                    }
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
                    source: lockconfirm===false?"file:///C:/Users/Abhi/Desktop/lock.png" : "file:///C:/Users/Abhi/Desktop/locked.png"
                    onSourceChanged: {
                        console.log("lockImage"+lockImage.source)
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (lockconfirm===false) {
                            foropacity.opacity=0.2
                            gotopopuplock()

                        } else if(lockconfirm===true) {
                            foropacity.opacity=0.2
                            gotopopupunlock()

                        }
                    }
                }
            }
            Rectangle {
                id: playrect
                width: parent.width / 6.1538
                height: parent.height
                color: "white"
                anchors.right: parent.right
                border.width: 2
                border.color: "black"
                enabled: lockconfirm === true ? false : true

                Image {
                    width: parent.width * 0.8
                    height: parent.height * 0.8
                    source: changeimage===false?"file:///C:/Users/Abhi/Desktop/play.png":"file:///C:/Users/Abhi/Desktop/pause.png"
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                }

                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        if(startconfirm===false&&changeimage===false){
                            popupforstart.visible = true
                            changingtext2.visible=false
                            foropacity.opacity = 0.2
                            timer.start()
                            buffertime=0
                            waittime=3
                              timerwaittime.start()
                             timerwaittime.running=true

                        }


                        else if(startconfirm===true&&changeimage===false&&buffertime<3) {
                            console.log("g")
                            timerstartflag.stop()
                            changeimage=true
                            waittime=3
                            console.log("machine started")
                            console.log(buffertime+" else buffertime")

                            startconfirm=false
                            inpause=true
                            buffertime=0
                            clickedonce+=1
                            timerforgauge.start()
                        }
                        // else if(startconfirm===true&&changeimage===false&&buffertime===3) {
                        //     console.log("press agian")
                        // }

                        else if(changeimage===true&&inpause===true){
                            console.log("do you want to pause")
                            timerforgauge.stop()
                            pausenotificationrect.visible=true
                            midrect.enabled=false
                            foropacity.opacity=0.2
                            inpause=false
                        }
                    }

                    onReleased: {
                        if(startconfirm===true&&changeimage===false){
                            timerstartflag.start()
                            timerstartflag.running=true
                        }

                        if(clickedonce!=3){
                            timer.stop()
                            console.log("released")

                            buffertime=0

                            if (popupforstart.visible) {
                                popupforstart.visible = false
                                foropacity.opacity = 0
                            }
                        }
                    }
                    onClicked: {
                        if(changeimage===true&&inpause===true&&clickedonce===3){
                            console.log("do you want to pause")
                            timerforgauge.stop()
                            pausenotificationrect.visible=true
                            midrect.enabled=false
                            foropacity.opacity=0.2
                            inpause=false
                            clickedonce=1
                        }
                    }
                }
            }
        }
    }

    Rectangle {
        id: popupforstart
        width: parent.width / 2
        height: parent.height / 4
        color: "black"
        anchors.centerIn: parent
        border.width: 3
        border.color: "white"
        visible: false

        BusyIndicator {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            running: timer.running
        }

        Text {
            id:changingtext
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Hold for "+waittime+" sec"
            font.pointSize: parent.width * 0.02
            font.bold: true
            color: "white"
        }
        Text {
            id:changingtext2
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Now release the button and press to start"
            font.pointSize: parent.width * 0.02
            font.bold: true
            color: "white"
            visible:false
        }
    }
    Timer {
        id: timerwaittime
        interval:1000
        running: false
        repeat: true
        onTriggered: {
            if(waittime>0){
                waittime-=1
            }else if(waittime===0){
                timerwaittime.running=false
                timerwaittime.stop()
            }
        }
    }
    Timer {
        id: timerstartflag
        interval:1000
        running: false
        repeat: true
        onTriggered: {
            buffertime+=1
            console.log("timer flag buffer "+buffertime)
            if(buffertime>=3){
                //timerstartflag.repeat=false
                timerstartflag.running=false
                startconfirm=false
            }
        }
    }
    Timer {
        id: timer
        interval:3000
        running: popupforstart.visible === true ? true : false
        repeat: true
        onTriggered: {
            timer.running = false;
            changingtext2.visible=true
            startconfirm=true
        }
    }
    Rectangle {
        id:pausenotificationrect
        width: parent.width/1.5
        height: parent.height/3
        color: "black"
        anchors.centerIn: parent
        border.width: 3
        border.color: "white"
        visible:false

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
                    startconfirm=false
                    changeimage=false
                    pausenotificationrect.visible=false
                    foropacity.opacity=0
                    timerforgauge.stop()
                    midrect.enabled=true
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
                    pausenotificationrect.visible=false
                    timerforgauge.start()
                    foropacity.opacity=0
                    midrect.enabled=true
                    clickedonce=3
                    changeimage=true
                    inpause=true
                }
            }
        }
    }
    Rectangle{
        id:foropacity
        width:parent.width
        height:parent.height
        color:"lightblue"
        opacity:openscreenid.enabled?0:0.02
    }
}




