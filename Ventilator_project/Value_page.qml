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
    width:mainwindowid.width*0.8
    height:mainwindowid.height/1.55
    y:parent.height*0.11
    property int differntnavigation:0
    signal openvaluechangepopup(int ids,int val1)
    function signalfromopenscreen(openscreennav){
        differntnavigation=openscreennav
    }
    function signalfromgraph(graphnav){
        graphid.visible=true
        graphid.enabled=false
        valuepageid.visible=true
        valuepageid.enabled=true

        differntnavigation=graphnav
    }

    function alotedvalue(textfieldid,alotval){
        foropacity.opacity=0
        switch(textfieldid) {
        case 11:
            insppressmvalue.text = alotval;
            break;
        case 12:
            insptimemvalue.text = alotval;
            break;
        case 13:
            braethratemvalue.text = alotval;
            break;
        case 14:
            iemvalue.text = alotval;
            break;
        case 15:
            risetimemvalue.text = alotval;
            break;
        case 16:
            insptrigmvalue.text = alotval;
            break;
        case 17:
            tidalvolmvalue.text = alotval;
            break;
        case 18:
            minutevolmvalue.text = alotval;
            break;
        case 19:
            peepvalue.text = alotval;
            break;
        case 20:
            exptrigvalue.text = alotval;
            break;
        case 21:
            presssup.text = alotval;
            break;
        default:
            console.error("Invalid text field ID:", textfieldid);
        }

    }

    signal gotoopenscreen()

    Rectangle{
        id:midrect
        width:parent.width
        height:parent.height
        color: "black"
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
                    id: insppressmtext
                    text: qsTr("Insp. Press")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.1
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: insppressmvalue
                    text: "15"
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.2
                }
                Text {
                    anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: insppressmtype
                    text: qsTr("cmH2O")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.08
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        foropacity.opacity=0.2
                        openvaluechangepopup(11,insppressmvalue.text)
                    }
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
                    id: insptimemtext
                    text: qsTr("Insp. Time")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.1
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: insptimemvalue
                    text: "2"
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.2
                }
                Text {
                    anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: insptimemtype
                    text: qsTr("sec")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.08
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        foropacity.opacity=0.2
                        openvaluechangepopup(12,insptimemvalue.text)
                    }
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
                    id: braethratemtext
                    text: qsTr("Breath Rate")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.1
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: braethratemvalue
                    text: qsTr("12")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.2
                }
                Text {
                    anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: braethratemtype
                    text: qsTr("BPM")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.08
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        foropacity.opacity=0.2
                        openvaluechangepopup(13,braethratemvalue.text)
                    }
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
                    id: iemtext
                    text: qsTr("I:E")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.1
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: iemvalue
                    text: qsTr("3")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.2
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        foropacity.opacity=0.2
                        openvaluechangepopup(14,iemvalue.text)
                    }
                }
            }
            Rectangle{
                id:fioRect
                width:parent.width/5
                height:parent.height/2.4
                anchors.left:parent.left;anchors.leftMargin: parent.width/10
                anchors.top:parent.top;anchors.topMargin: itemid.height/2
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
                    id: risetimemtext
                    text: qsTr("Rise. Time")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.1
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: risetimemvalue
                    text: qsTr("1")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.2
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        foropacity.opacity=0.2
                        openvaluechangepopup(15,risetimemvalue.text)
                    }
                }

            }
            Rectangle{
                id:insptrigrect
                width:parent.width/5
                height:parent.height/2.4
                //color:"yellow"
                anchors.left:fioRect.right
                anchors.top:parent.top;anchors.topMargin: itemid.height/2
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
                    id: insptrigmtext
                    text: qsTr("Insp. Trig.")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.1
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: insptrigmvalue
                    text: qsTr("0")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.2
                }
                Text {
                    anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: braethratemtype2
                    text: qsTr("Trigger Sensitiveity Level")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.05
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        foropacity.opacity=0.2
                        openvaluechangepopup(16,insptrigmtext.text)
                    }
                }

            }
            Rectangle{
                id:spo2rect
                width:parent.width/5
                height:parent.height/2.4
                anchors.left:insptrigrect.right
                anchors.top:parent.top;anchors.topMargin: itemid.height/2
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
                    id: tidalvolmtext
                    text: qsTr("Tidal Vol.")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.1
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: tidalvolmvalue
                    text: qsTr("300")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.1
                }
                Text {
                    anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: tidalvolmtype
                    text: qsTr("mL")
                    color:"white"
                    font.bold: true
                    font.pointSize: parent.width*0.08
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        foropacity.opacity=0.2
                        openvaluechangepopup(17,tidalvolmvalue.text)
                    }
                }
            }
            Rectangle{
                id:minuteVolrect
                width:parent.width/5
                height:parent.height/2.4
                anchors.left:spo2rect.right
                anchors.top:parent.top;anchors.topMargin: itemid.height/2
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
                    text: qsTr("4")
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
                        openvaluechangepopup(18,minutevolmvalue.text)
                    }
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
                        midrect2.visible=true
                        midrect2.enabled=true
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
                    if(differntnavigation===2)
                        gotoopenscreen()
                    else if(differntnavigation===1){
                        graphid.enabled=true
                        graphid.visible=true
                        valuepageid.visible=false
                        valuepageid.enabled=false
                        graphid.opacity=1
                    }
                }
            }
        }
    }
    Rectangle{
        id:midrect2
        width:parent.width
        height:parent.height
        color: "black"
        visible:false
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
                id: insppressmtext2
                text: qsTr("PEEP")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.1
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                id: peepvalue
                text: qsTr("2")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.2
            }
            Text {
                anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                id: insppressmtype2
                text: qsTr("cmH2O")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.08
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    foropacity.opacity=0.2
                    openvaluechangepopup(19,peepvalue.text)
                }
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
                id: insptimemtext2
                text: qsTr("Breath Rate")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.1
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                id: exptrigvalue
                text: qsTr("5")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.2
            }
            Text {
                anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                id: insptimemtype2
                text: qsTr("%")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.08
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    foropacity.opacity=0.2
                    openvaluechangepopup(20,exptrigvalue.text)
                }
            }
        }


        Rectangle{
            id:fioRect2
            width:parent.width/5
            height:parent.height/2.4
            anchors.left:parent.left;anchors.leftMargin: parent.width/10
            anchors.top:parent.top;anchors.topMargin: itemid.height/2
            enabled: false

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
                id: risetimemtext2
                text: qsTr("Press. Sup.")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.1

            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                id: presssup
                text: qsTr("0")
                color:"white"
                font.bold: true

                font.pointSize: parent.width*0.2
            }
            Text {
                anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                id: risetimemtype2
                text: qsTr("cmH2O")
                color:"white"
                font.bold: true

                font.pointSize: parent.width*0.08
            }
            MouseArea{
                anchors.fill: parent

                onClicked: {

                    foropacity.opacity=0.2
                    openvaluechangepopup(21,presssup.text)
                }
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
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    midrect2.visible=false
                    midrect2.enabled=false
                    midrect.visible=true
                    midrect.enabled=true
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
                    if(differntnavigation===2){
                        gotoopenscreen()
                        midrect2.visible=false
                        midrect2.enabled=false
                    }
                    else if (differntnavigation===1){
                        graphid.enabled=true
                        graphid.visible=true
                        valuepageid.visible=false
                        valuepageid.enabled=false
                        graphid.opacity=1

                    }
                }
            }
        }
    }

    function openvaluedrawer() {
        midrect.visible=true
        midrect.enabled=true
    }
    Rectangle{
        id:foropacity
        width:parent.width
        height:parent.height
        color:"#adc4de"
        opacity:0
    }
}
