import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.12
import QtQuick.Controls 1.4
import QtQuick 2.2

Item {
    width: mainwindowid.width
    height: mainwindowid.height
    property int firstvalue:25
    property int secondvalue:75
    signal gotosliderpopup(int lval,int hval,int fvalue1,int tovalue1,string units,int ids)
    function getingvalues(a,b,c,e){

        switch(c) {
        case 1:
            firstrsc.firstvalue=a
            firstrsc.secondvalue=b
            if(e){firstrsc.opacity=0.2}else firstrsc.opacity=1
            break;
        case 2:
           secondrsc.firstvalue=a
           secondrsc.secondvalue=b
            if(e){secondrsc.opacity=0.2}else secondrsc.opacity=0
            break;
        case 3:
            thirdrsc.firstvalue=a
            thirdrsc.secondvalue=b
             if(e){thirdrsc.opacity=0.2}else thirdrsc.opacity=0
            break;
        case 4:
            forthrsc.firstvalue=a
            forthrsc.secondvalue=b
             if(e){forthrsc.opacity=0.2}else forthrsc.opacity=0
            break;
        case 5:
            firstrsc2.firstvalue=a
            firstrsc2.secondvalue=b
             if(e){firstrsc2.opacity=0.2}else firstrsc2.opacity=0
            break;
        case 6:
            secondrsc2.firstvalue=a
            secondrsc2.secondvalue=b
             if(e){secondrsc2.opacity=0.2}else secondrsc2.opacity=0
            break;
        case 7:
            thirdrsc2.firstvalue=a
            thirdrsc2.secondvalue=b
             if(e){secondrsc2.opacity=0.2}else thirdrsc2.opacity=0
            break;
        case 8:
            forthrsc2.firstvalue=a
            forthrsc2.secondvalue=b
             if(e){forthrsc2.opacity=0.2}else forthrsc2.opacity=0
            break;
        case 9:
            firstrsc3.firstvalue=a
            firstrsc3.secondvalue=b
             if(e){firstrsc3.opacity=0.2}else firstrsc3.opacity=0
            break;
        default:
            console.error("Invalid text field ID:", textfieldid);
        }


    }

    Header{
        id:headerids
        enabled:false
    }
    Rectangle{
        id:firstrect
        width: mainwindowid.width
        height: mainwindowid.height*0.89
        anchors.bottom: parent.bottom
        color:"black"
        RangeSliderCustom{
            id:firstrsc
            xval:10
            yval:30
            textheading: "Peak P."
            firstvalue:5
            secondvalue:25
            fromvalue:0
            tovalue:100
            MouseArea{
                anchors.fill:parent
                onClicked:{
                    gotosliderpopup(firstrsc.firstvalue,firstrsc.secondvalue,firstrsc.fromvalue,firstrsc.tovalue,"Units : cmH2O\t\t\t\tPeak P.",1)
                }
            }
        }
        RangeSliderCustom{
            id:secondrsc
            xval:mainwindowid.width/4.2
            yval:30
            textheading: "Minute V"
            firstvalue:2
            secondvalue:10
            fromvalue:0
            tovalue:50
            MouseArea{
                anchors.fill:parent
                onClicked:{
                    gotosliderpopup(secondrsc.firstvalue,secondrsc.secondvalue,secondrsc.fromvalue,secondrsc.tovalue,"Units : L\t\t\t\t\tMinute V",2)
                }
            }
        }
        RangeSliderCustom{
            id:thirdrsc
            xval:(2*mainwindowid.width)/4.2
            yval:30
            textheading: "Breath R"
            firstvalue:7
            secondvalue:30
            fromvalue:0
            tovalue:100
            MouseArea{
                anchors.fill:parent
                onClicked:{
                    gotosliderpopup(thirdrsc.firstvalue,thirdrsc.secondvalue,thirdrsc.fromvalue,thirdrsc.tovalue,"Units : BPM\t\t\t\tBreath R",3)
                }
            }
        }
        RangeSliderCustom{
            id:forthrsc
            xval:(3*mainwindowid.width)/4.2
            yval:30
            textheading: "Tidal(e) Vol"
            firstvalue:200
            secondvalue:700
            fromvalue:0
            tovalue:1000
            MouseArea{
                anchors.fill:parent
                onClicked:{
                    gotosliderpopup(forthrsc.firstvalue,forthrsc.secondvalue,forthrsc.fromvalue,forthrsc.tovalue,"Units : mL\t\t\t  Tidal(e) Vol",4)
                }
            }
        }
        Rectangle{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom;anchors.bottomMargin: 20
            width:parent.width/4
            height:parent.height*0.1
            color:"lightblue"
            radius:10
            Text{
                id:closeid
                text:"Close"
                anchors.centerIn: parent
                font.pointSize: 15
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
        Rectangle {
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 20
            id: lefttbutton
            color: "black"
            width: 40
            height: width*2

            Text {
                anchors.centerIn: parent
                text: "►"
                font.pixelSize: parent.width
                color: "blue"
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    firstrect.visible=false
                    firstrect.enabled=false
                    secondrect.visible=true
                    secondrect.enabled=true

                }
            }
        }
    }
    Rectangle{
        id:secondrect
        width: mainwindowid.width
        height: mainwindowid.height*0.89
        anchors.bottom: parent.bottom
        color:"black"
        visible:false
        enabled: false
        RangeSliderCustom{
            id:firstrsc2
            xval:10
            yval:30
            textheading: "PEEP"
            firstvalue:5
            secondvalue:25
            fromvalue:0
            tovalue:100
            MouseArea{
                anchors.fill:parent
                onClicked:{
                    gotosliderpopup(firstrsc2.firstvalue,firstrsc2.secondvalue,firstrsc2.fromvalue,firstrsc2.tovalue,"Units : cmH2O\t\t\t\t  PEEP",5)
                }
            }
        }
        RangeSliderCustom{
            id:secondrsc2
            xval:mainwindowid.width/4.2
            yval:30
            textheading: "Apnea"
            firstvalue:2
            secondvalue:10
            fromvalue:0
            tovalue:50
            MouseArea{
                anchors.fill:parent
                onClicked:{
                    gotosliderpopup(secondrsc2.firstvalue,secondrsc2.secondvalue,secondrsc2.fromvalue,secondrsc2.tovalue,"Units : sec\t        Apnea          \tUnits : BPM",6)
                }
            }
        }
        RangeSliderCustom{
            id:thirdrsc2
            xval:(2*mainwindowid.width)/4.2
            yval:30
            textheading: "SPO2"
            firstvalue:7
            secondvalue:30
            fromvalue:0
            tovalue:100
            MouseArea{
                anchors.fill:parent
                onClicked:{
                    gotosliderpopup(thirdrsc2.firstvalue,thirdrsc2.secondvalue,thirdrsc2.fromvalue,thirdrsc2.tovalue,"Units : %\t\t\t\t   SPO2",7)
                }
            }
        }
        RangeSliderCustom{
            id:forthrsc2
            xval:(3*mainwindowid.width)/4.2
            yval:30
            textheading: "FIO2"
            firstvalue:200
            secondvalue:700
            fromvalue:0
            tovalue:1000
            MouseArea{
                anchors.fill:parent
                onClicked:{
                    gotosliderpopup(forthrsc2.firstvalue,forthrsc2.secondvalue,forthrsc2.fromvalue,forthrsc2.tovalue,"Units : %\t\t\t\t   FIO2",8)
                }
            }
        }
        Rectangle{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom;anchors.bottomMargin: 20
            width:parent.width/4
            height:parent.height*0.1
            color:"lightblue"
            radius:10
            Text{
                id:closeid2
                text:"Close"
                anchors.centerIn: parent
                font.pointSize: 15
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
        Rectangle {
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 20
            id: lefttbutton2
            color: "black"
            width: 40
            height: width*2

            Text {
                anchors.centerIn: parent
                text: "►"
                      font.pixelSize: parent.width
                color: "blue"
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    secondrect.visible=false
                    secondrect.enabled=false
                    thirdrect.visible=true
                    thirdrect.enabled=true
                }
            }
        }
        Rectangle{
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 20
            id: rightbutton2
            color: "black"
            width: 40
            height: width*2

            Text {
                anchors.centerIn: parent
                text: "◄"
                font.pixelSize: parent.width
                color: "blue"
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    firstrect.visible=true
                    firstrect.enabled=true
                    secondrect.visible=false
                    secondrect.enabled=false
                }
            }
        }
    }
    Rectangle{
        id:thirdrect
        width: mainwindowid.width
        height: mainwindowid.height*0.89
        anchors.bottom: parent.bottom
        color:"black"
        visible:false
        enabled: false
        RangeSliderCustom{
            id:firstrsc3
            xval:10
            yval:30
            textheading: "Circuit Disc."
            firstvalue:5
            secondvalue:60
            fromvalue:0
            tovalue:60
            MouseArea{
                anchors.fill:parent
                onClicked:{
                    gotosliderpopup(firstrsc3.firstvalue,firstrsc3.secondvalue,firstrsc3.fromvalue,firstrsc3.tovalue,"Units : sec\t\t\t\tCircuit Disc",9)
                }
            }
        }



        Rectangle{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom;anchors.bottomMargin: 20
            width:parent.width/4
            height:parent.height*0.1
            color:"lightblue"
            radius:10
            Text{
                id:closeid3
                text:"Close"
                anchors.centerIn: parent
                font.pointSize: 15
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

        Rectangle{
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 20
            id: rightbutton3
            color: "black"
            width: 40
            height: width*2

            Text {
                anchors.centerIn: parent
                text: "◄"
                font.pixelSize: parent.width
                color: "blue"
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    secondrect.visible=true
                    secondrect.enabled=true
                    thirdrect.visible=false
                    thirdrect.enabled=false
                }
            }
        }
    }
}
