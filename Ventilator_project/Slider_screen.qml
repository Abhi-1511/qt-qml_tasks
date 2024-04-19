import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.12
import QtQuick.Controls 1.4
import QtQuick 2.2
import com.ventilatorproject.database 1.0
Item {
    width: mainwindowid.width
    height: mainwindowid.height
    property int firstvalue:0
    property int secondvalue:0


    signal gotosliderpopup(int lval,int hval,int fvalue1,int tovalue1,string units,int ids)
    signal gotosaveprofiledbsettings(int peekH, int peekL, int minuteVolH, int minuteVolL, int breathRH, int breathRL, int tidalH, int tidalL, int peepH, int peepL, int apneaH, int apneaL, int spo2H, int spo2L, int fio2H, int fio2L, int circuitDiscH, int circuitDiscL)
    Database {
        id: db
    }
    function getcurrentindexval(val){
        var settingsDetails = db.fetchSettings(val)
        if (settingsDetails["pname"] !== undefined) {
            firstrsc.firstvalue = settingsDetails["peekH"]
            firstrsc.secondvalue=settingsDetails["peekL"]
            secondrsc.firstvalue=settingsDetails["minuteVolH"]
            secondrsc.secondvalue=settingsDetails["minuteVolL"]
            thirdrsc.firstvalue=settingsDetails["breathRH"]
            thirdrsc.secondvalue=settingsDetails["breathRL"]
            forthrsc.firstvalue=settingsDetails["tidalH"]
            forthrsc.secondvalue=settingsDetails["tidalL"]
            firstrsc2.firstvalue=settingsDetails["peepH"]
            firstrsc2.secondvalue=settingsDetails["peepL"]
            secondrsc2.firstvalue=settingsDetails["apneaH"]
            secondrsc2.secondvalue=settingsDetails["apneaL"]
            thirdrsc2.firstvalue=settingsDetails["spo2H"]
            thirdrsc2.secondvalue=settingsDetails["spo2L"]
            forthrsc2.firstvalue=settingsDetails["fio2H"]
            forthrsc2.secondvalue=settingsDetails["fio2L"]
            firstrsc3.firstvalue=settingsDetails["circuitDiscH"]
            firstrsc3.secondvalue=settingsDetails["circuitDiscL"]


            // Update other UI elements as needed
        } else {

        }

    }

    function getingvalues(firstvaluefrom,secondvaluefrom,idfrom,e){
        switch(idfrom) {
        case 1:
            firstrsc.firstvalue=firstvaluefrom
            firstrsc.secondvalue=secondvaluefrom
            gotosaveprofiledbsettings(firstrsc.firstvalue,firstrsc.secondvalue,secondrsc.firstvalue,secondrsc.secondvalue,thirdrsc.firstvalue,thirdrsc.secondvalue,forthrsc.firstvalue,forthrsc.secondvalue,firstrsc2.firstvalue,firstrsc2.secondvalue,secondrsc2.firstvalue,secondrsc2.secondvalue,thirdrsc2.firstvalue,thirdrsc2.secondvalue,forthrsc2.firstvalue,forthrsc2.secondvalue,firstrsc3.firstvalue,firstrsc3.secondvalue)
            if(e){firstrscopacity.opacity=0.2
                firstrscopacity.visible=true
            }else {firstrscopacity.opacity=1
                firstrscopacity.visible=false}
            break;
        case 2:
            secondrsc.firstvalue=firstvaluefrom
            secondrsc.secondvalue=secondvaluefrom
            gotosaveprofiledbsettings(firstrsc.firstvalue,firstrsc.secondvalue,secondrsc.firstvalue,secondrsc.secondvalue,thirdrsc.firstvalue,thirdrsc.secondvalue,forthrsc.firstvalue,forthrsc.secondvalue,firstrsc2.firstvalue,firstrsc2.secondvalue,secondrsc2.firstvalue,secondrsc2.secondvalue,thirdrsc2.firstvalue,thirdrsc2.secondvalue,forthrsc2.firstvalue,forthrsc2.secondvalue,firstrsc3.firstvalue,firstrsc3.secondvalue)
            if(e){secondrscopacity.opacity=0.2
                secondrscopacity.visible=true
            }else {secondrscopacity.opacity=1
                secondrscopacity.visible=false}
            break;
        case 3:
            thirdrsc.firstvalue=firstvaluefrom
            thirdrsc.secondvalue=secondvaluefrom
            gotosaveprofiledbsettings(firstrsc.firstvalue,firstrsc.secondvalue,secondrsc.firstvalue,secondrsc.secondvalue,thirdrsc.firstvalue,thirdrsc.secondvalue,forthrsc.firstvalue,forthrsc.secondvalue,firstrsc2.firstvalue,firstrsc2.secondvalue,secondrsc2.firstvalue,secondrsc2.secondvalue,thirdrsc2.firstvalue,thirdrsc2.secondvalue,forthrsc2.firstvalue,forthrsc2.secondvalue,firstrsc3.firstvalue,firstrsc3.secondvalue)
            if(e){thirdrscopacity.opacity=0.2
                thirdrscopacity.visible=true
            }else {thirdrscopacity.opacity=1
                thirdrscopacity.visible=false}
            break;
        case 4:
            forthrsc.firstvalue=firstvaluefrom
            forthrsc.secondvalue=secondvaluefrom
            gotosaveprofiledbsettings(firstrsc.firstvalue,firstrsc.secondvalue,secondrsc.firstvalue,secondrsc.secondvalue,thirdrsc.firstvalue,thirdrsc.secondvalue,forthrsc.firstvalue,forthrsc.secondvalue,firstrsc2.firstvalue,firstrsc2.secondvalue,secondrsc2.firstvalue,secondrsc2.secondvalue,thirdrsc2.firstvalue,thirdrsc2.secondvalue,forthrsc2.firstvalue,forthrsc2.secondvalue,firstrsc3.firstvalue,firstrsc3.secondvalue)
            if(e){forthrscopacity.opacity=0.2
                forthrscopacity.visible=true
            }else {forthrscopacity.opacity=1
                forthrscopacity.visible=false}
            break;
        case 5:
            firstrsc2.firstvalue=firstvaluefrom
            firstrsc2.secondvalue=secondvaluefrom
            gotosaveprofiledbsettings(firstrsc.firstvalue,firstrsc.secondvalue,secondrsc.firstvalue,secondrsc.secondvalue,thirdrsc.firstvalue,thirdrsc.secondvalue,forthrsc.firstvalue,forthrsc.secondvalue,firstrsc2.firstvalue,firstrsc2.secondvalue,secondrsc2.firstvalue,secondrsc2.secondvalue,thirdrsc2.firstvalue,thirdrsc2.secondvalue,forthrsc2.firstvalue,forthrsc2.secondvalue,firstrsc3.firstvalue,firstrsc3.secondvalue)
            if(e){fifthrscopacity.opacity=0.2
                fifthrscopacity.visible=true
            }else {fifthrscopacity.opacity=1
                fifthrscopacity.visible=false}
            break;
        case 6:
            secondrsc2.firstvalue=firstvaluefrom
            secondrsc2.secondvalue=secondvaluefrom
            gotosaveprofiledbsettings(firstrsc.firstvalue,firstrsc.secondvalue,secondrsc.firstvalue,secondrsc.secondvalue,thirdrsc.firstvalue,thirdrsc.secondvalue,forthrsc.firstvalue,forthrsc.secondvalue,firstrsc2.firstvalue,firstrsc2.secondvalue,secondrsc2.firstvalue,secondrsc2.secondvalue,thirdrsc2.firstvalue,thirdrsc2.secondvalue,forthrsc2.firstvalue,forthrsc2.secondvalue,firstrsc3.firstvalue,firstrsc3.secondvalue)
            if(e){sixthrscopacity.opacity=0.2
                sixthrscopacity.visible=true
            }else {sixthrscopacity.opacity=1
                sixthrscopacity.visible=false}
            break;
        case 7:
            thirdrsc2.firstvalue=firstvaluefrom
            thirdrsc2.secondvalue=secondvaluefrom
            gotosaveprofiledbsettings(firstrsc.firstvalue,firstrsc.secondvalue,secondrsc.firstvalue,secondrsc.secondvalue,thirdrsc.firstvalue,thirdrsc.secondvalue,forthrsc.firstvalue,forthrsc.secondvalue,firstrsc2.firstvalue,firstrsc2.secondvalue,secondrsc2.firstvalue,secondrsc2.secondvalue,thirdrsc2.firstvalue,thirdrsc2.secondvalue,forthrsc2.firstvalue,forthrsc2.secondvalue,firstrsc3.firstvalue,firstrsc3.secondvalue)
            if(e){seventhrscopacity.opacity=0.2
                seventhrscopacity.visible=true
            }else {seventhrscopacity.opacity=1
                seventhrscopacity.visible=false}
            break;
        case 8:
            forthrsc2.firstvalue=firstvaluefrom
            forthrsc2.secondvalue=secondvaluefrom
            gotosaveprofiledbsettings(firstrsc.firstvalue,firstrsc.secondvalue,secondrsc.firstvalue,secondrsc.secondvalue,thirdrsc.firstvalue,thirdrsc.secondvalue,forthrsc.firstvalue,forthrsc.secondvalue,firstrsc2.firstvalue,firstrsc2.secondvalue,secondrsc2.firstvalue,secondrsc2.secondvalue,thirdrsc2.firstvalue,thirdrsc2.secondvalue,forthrsc2.firstvalue,forthrsc2.secondvalue,firstrsc3.firstvalue,firstrsc3.secondvalue)
            if(e){eightrscopacity.opacity=0.2
                eightrscopacity.visible=true
            }else {eightrscopacity.opacity=1
                eightrscopacity.visible=false}
            break;
        case 9:
            firstrsc3.firstvalue=firstvaluefrom
            firstrsc3.secondvalue=secondvaluefrom
            gotosaveprofiledbsettings(firstrsc.firstvalue,firstrsc.secondvalue,secondrsc.firstvalue,secondrsc.secondvalue,thirdrsc.firstvalue,thirdrsc.secondvalue,forthrsc.firstvalue,forthrsc.secondvalue,firstrsc2.firstvalue,firstrsc2.secondvalue,secondrsc2.firstvalue,secondrsc2.secondvalue,thirdrsc2.firstvalue,thirdrsc2.secondvalue,forthrsc2.firstvalue,forthrsc2.secondvalue,firstrsc3.firstvalue,firstrsc3.secondvalue)
            if(e){ninthrscopacity.opacity=0.2
                ninthrscopacity.visible=true
            }else {ninthrscopacity.opacity=1
                ninthrscopacity.visible=false}
            break;
        default:
            console.error("Invalid text field ID:", textfieldid);
        }


    }

    // Header{
    //     id:headerids
    //     enabled:false
    // }
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
            firstvalue:0
            secondvalue:0
            fromvalue:0
            tovalue:100
            MouseArea{
                anchors.fill:parent
                onClicked:{
                    gotosliderpopup(firstrsc.firstvalue,firstrsc.secondvalue,firstrsc.fromvalue,firstrsc.tovalue,"Units : cmH2O\t\t\t\tPeak P.",1)
                }
            }
            Rectangle{
                id:firstrscopacity
                width:parent.width*0.6
                height:parent.height
                anchors.centerIn: parent
                color:"gray"
                visible:false
            }
        }
        RangeSliderCustom{
            id:secondrsc
            xval:mainwindowid.width/4.2
            yval:30
            textheading: "Minute V"
            firstvalue:0
            secondvalue:0
            fromvalue:0
            tovalue:50
            MouseArea{
                anchors.fill:parent
                onClicked:{
                    gotosliderpopup(secondrsc.firstvalue,secondrsc.secondvalue,secondrsc.fromvalue,secondrsc.tovalue,"Units : L\t\t\t\t\tMinute V",2)
                }
            }
            Rectangle{
                id:secondrscopacity
                width:parent.width*0.6
                height:parent.height
                anchors.centerIn: parent
                color:"gray"
                visible:false
            }
        }
        RangeSliderCustom{
            id:thirdrsc
            xval:(2*mainwindowid.width)/4.2
            yval:30
            textheading: "Breath R"
            firstvalue:0
            secondvalue:0
            fromvalue:0
            tovalue:100
            MouseArea{
                anchors.fill:parent
                onClicked:{
                    gotosliderpopup(thirdrsc.firstvalue,thirdrsc.secondvalue,thirdrsc.fromvalue,thirdrsc.tovalue,"Units : BPM\t\t\t\tBreath R",3)
                }
            }
            Rectangle{
                id:thirdrscopacity
                width:parent.width*0.6
                height:parent.height
                anchors.centerIn: parent
                color:"gray"
                visible:false
            }
        }
        RangeSliderCustom{
            id:forthrsc
            xval:(3*mainwindowid.width)/4.2
            yval:30
            textheading: "Tidal(e) Vol"
            firstvalue:0
            secondvalue:0
            fromvalue:0
            tovalue:1000
            MouseArea{
                anchors.fill:parent
                onClicked:{
                    gotosliderpopup(forthrsc.firstvalue,forthrsc.secondvalue,forthrsc.fromvalue,forthrsc.tovalue,"Units : mL\t\t\t  Tidal(e) Vol",4)
                }
            }
            Rectangle{
                id:forthrscopacity
                width:parent.width*0.6
                height:parent.height
                anchors.centerIn: parent
                color:"gray"
                visible:false
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
            Rectangle{
                id:fifthrscopacity
                width:parent.width*0.6
                height:parent.height
                anchors.centerIn: parent
                color:"gray"
                visible:false
            }
        }
        Rectangle {
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 20
            id: lefttbutton
            color: "transparent"
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
            Rectangle{
                id:sixthrscopacity
                width:parent.width*0.6
                height:parent.height
                anchors.centerIn: parent
                color:"gray"
                visible:false
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
            firstvalue:0
            secondvalue:0
            fromvalue:0
            tovalue:100
            MouseArea{
                anchors.fill:parent
                onClicked:{
                    gotosliderpopup(firstrsc2.firstvalue,firstrsc2.secondvalue,firstrsc2.fromvalue,firstrsc2.tovalue,"Units : cmH2O\t\t\t\t  PEEP",5)
                }
            }
            Rectangle{
                id:seventhrscopacity
                width:parent.width*0.6
                height:parent.height
                anchors.centerIn: parent
                color:"gray"
                visible:false
            }
        }
        RangeSliderCustom{
            id:secondrsc2
            xval:mainwindowid.width/4.2
            yval:30
            textheading: "Apnea"
            firstvalue:0
            secondvalue:0
            fromvalue:0
            tovalue:50
            MouseArea{
                anchors.fill:parent
                onClicked:{
                    gotosliderpopup(secondrsc2.firstvalue,secondrsc2.secondvalue,secondrsc2.fromvalue,secondrsc2.tovalue,"Units : sec\t        Apnea          \tUnits : BPM",6)
                }
            }
            Rectangle{
                id:eightrscopacity
                width:parent.width*0.6
                height:parent.height
                anchors.centerIn: parent
                color:"gray"
                visible:false
            }
        }
        RangeSliderCustom{
            id:thirdrsc2
            xval:(2*mainwindowid.width)/4.2
            yval:30
            textheading: "SPO2"
            firstvalue:0
            secondvalue:0
            fromvalue:0
            tovalue:100
            MouseArea{
                anchors.fill:parent
                onClicked:{
                    gotosliderpopup(thirdrsc2.firstvalue,thirdrsc2.secondvalue,thirdrsc2.fromvalue,thirdrsc2.tovalue,"Units : %\t\t\t\t   SPO2",7)
                }
            }
            Rectangle{
                id:ninthrscopacity
                width:parent.width*0.6
                height:parent.height
                anchors.centerIn: parent
                color:"gray"
                visible:false
            }
        }
        RangeSliderCustom{
            id:forthrsc2
            xval:(3*mainwindowid.width)/4.2
            yval:30
            textheading: "FIO2"
            firstvalue:0
            secondvalue:0
            fromvalue:0
            tovalue:1000
            MouseArea{
                anchors.fill:parent
                onClicked:{
                    gotosliderpopup(forthrsc2.firstvalue,forthrsc2.secondvalue,forthrsc2.fromvalue,forthrsc2.tovalue,"Units : %\t\t\t\t   FIO2",8)
                }
            }
            Rectangle{
                id:tenthrscopacity
                width:parent.width*0.6
                height:parent.height
                anchors.centerIn: parent
                color:"gray"
                visible:false
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
            color: "transparent"
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
            color: "transparent"
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
            firstvalue:0
            secondvalue:0
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
