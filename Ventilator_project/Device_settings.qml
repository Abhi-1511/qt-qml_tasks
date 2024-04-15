import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 1.4

Item {
    id:itemid4
    width:mainwindowid.width
    height:mainwindowid.height
    property bool darkMode: false
    signal gotosuccesspage()
    property int b:0
    Header{}
    Rectangle{
        id:mainrect
        width:parent.width
        height:parent.height*0.889
        anchors.bottom: parent.bottom
        color:"black"
        Rectangle {  //back arrow
            width:parent.width/8
            height:parent.height/8
            anchors.left: parent.left
            color:"transparent"

            Text {
                id: backtextid
                anchors.centerIn: parent
                text: "←"
                color: "white"
                font.pointSize: 50
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    devicesettingsid.visible=false
                    devicesettingsid.enabled=false
                    openscreenid.visible=true
                    openscreenid.enabled=true
                    deviceinfotextid.font.bold=true
                    admintextid.font.bold=false
                    systemline.visible=true
                    deviceline.visible=false
                    midrectvalues.visible=true
                    midrectvalues.enabled=true
                    midrectvalue2.visible=false
                    midrectvalue2.enabled=false
                    midrectvalue3.visible=false
                    midrectvalue3.enabled=false
                    textdisplay.text=""
                    passwordtext.text=""

                }
            }

        }

        Rectangle{ //device info
            id:toptextid
            width:parent.width/3
            height:parent.height/15
            anchors.left: parent.left;anchors.leftMargin: 180
            anchors.top: parent.top;anchors.topMargin: 10
            color:"transparent"
            Text {
                id: deviceinfotextid
                text: qsTr("DEVICE INFO")
                anchors.centerIn: parent
                color: "white"
                font.pointSize: 15
                font.bold: true
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    deviceinfotextid.font.bold=true
                    admintextid.font.bold=false
                    systemline.visible=true
                    deviceline.visible=false
                    midrectvalues.visible=true
                    midrectvalues.enabled=true
                    midrectvalue2.visible=false
                    midrectvalue2.enabled=false
                    midrectvalue3.visible=false
                    midrectvalue3.enabled=false
                }
            }

        }

        Rectangle{//administration
            width:parent.width/3
            height:parent.height/15
            anchors.right: parent.right;anchors.rightMargin: 150
            anchors.top: parent.top;anchors.topMargin: 10
            color:"transparent"
            Text {
                id: admintextid
                text: qsTr("ADMINISTRATION")
                anchors.centerIn: parent
                color: "white"
                font.pointSize: 15
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    deviceinfotextid.font.bold=false
                    admintextid.font.bold=true
                    deviceline.visible=true
                    systemline.visible=false
                    midrectvalues.visible=false
                    midrectvalues.enabled=false
                    midrectvalue2.visible=true
                    midrectvalue2.enabled=true
                    midrectvalue3.visible=false
                    midrectvalue3.enabled=false
                }
            }
        }
        Rectangle { //line
            id:lineid
            width: parent.width-100
            height:parent.height/80
            color:"gray"
            anchors.top:parent.top;anchors.topMargin: 40
            anchors.left: parent.left;anchors.leftMargin: 150
            anchors.right: parent.right;anchors.rightMargin: 150
            Rectangle{
                id:systemline
                width:parent.width/2
                height:parent.height
                anchors.left: parent.left
                anchors.top: parent.top;
                color:"blue"
            }
            Rectangle{
                id:deviceline
                width:parent.width/2
                height:parent.height
                anchors.right: parent.right
                anchors.top: parent.top;
                color:"blue"
                visible: false
            }
        }
        Rectangle { //line
            id:midrectvalues
            width: parent.width-100
            height:parent.height*0.85
            color:"transparent"
            visible:true
            anchors.top:parent.top;anchors.topMargin: 50
            anchors.left: parent.left;anchors.leftMargin: 150
            anchors.right: parent.right;anchors.rightMargin: 150

            Rectangle{
                id:first
                width:parent.width
                height:parent.height*0.1
                color:"transparent"

                Text {
                    anchors.left:parent.left;anchors.leftMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                    text: "Brightness"
                    color:"white"
                    font.pointSize: 15
                }
                ComboBox {
                    id: brightnesscombobox
                    anchors.right:parent.right;anchors.rightMargin: 100
                    anchors.verticalCenter: parent.verticalCenter
                    width: 200
                    height:parent.height*0.8
                    model: ListModel {
                        ListElement { text: "25%" }
                        ListElement { text: "50%" }
                        ListElement { text: "100%" }
                    }
                }
            }
            Rectangle{
                id:second
                width:parent.width
                height:parent.height*0.1
                color:"transparent"
                anchors.top:first.bottom

                Text {
                    anchors.left:parent.left;anchors.leftMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                    text: "Language"
                    color:"white"
                    font.pointSize: 15
                }
                ComboBox {
                    id: languagecombobox
                    anchors.right:parent.right;anchors.rightMargin: 100
                    anchors.verticalCenter: parent.verticalCenter
                    width: 200
                    height:parent.height*0.8
                    model: ListModel {
                        ListElement { text: "English" }
                        ListElement { text: "Kannada" }
                        ListElement { text: "Hindi" }
                    }
                }
            }
            Rectangle{
                id:third
                width:parent.width
                height:parent.height*0.1
                color:"transparent"
                anchors.top:second.bottom

                Text {
                    anchors.left:parent.left;anchors.leftMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                    text: "Presure Units"
                    color:"white"
                    font.pointSize: 15
                }
                ComboBox {
                    id: pressurecombobox
                    anchors.right:parent.right;anchors.rightMargin: 100
                    anchors.verticalCenter: parent.verticalCenter
                    width: 200
                    height:parent.height*0.8
                    model: ListModel {
                        ListElement { text: "cmH2O" }
                        ListElement { text: "H2Omm" }
                        ListElement { text: "BarH2" }
                    }
                }
            }
            Rectangle{
                id:fourth
                width:parent.width
                height:parent.height*0.1
                color:"transparent"
                anchors.top:third.bottom

                Text {
                    anchors.left:parent.left;anchors.leftMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                    text: "Time Zones"
                    color:"white"
                    font.pointSize: 15
                }
                ComboBox {
                    id: timezonescombobox
                    anchors.right:parent.right;anchors.rightMargin: 100
                    anchors.verticalCenter: parent.verticalCenter
                    width: 200
                    height:parent.height*0.8
                    model: ListModel {
                        ListElement { text: "Banglore" }
                        ListElement { text: "Delhi" }
                        ListElement { text: "Mumbai" }
                    }
                }
            }
            Rectangle{
                id:fifth
                width:parent.width
                height:parent.height*0.1
                color:"transparent"
                anchors.top:fourth.bottom

                Text {
                    anchors.left:parent.left;anchors.leftMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                    text: "Serial Number"
                    color:"white"
                    font.pointSize: 15
                }
                Text {
                    width: 200
                    height:parent.height*0.8
                    anchors.right:parent.right;anchors.rightMargin: 100
                    anchors.verticalCenter: parent.verticalCenter
                    text: "AB2619N6280U"
                    color:"white"
                    font.pointSize: 15
                }
            }
            Rectangle{
                id:sixth
                width:parent.width
                height:parent.height*0.1
                color:"transparent"
                anchors.top:fifth.bottom

                Text {
                    anchors.left:parent.left;anchors.leftMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                    text: "FW Ver MCB/Stepper"
                    color:"white"
                    font.pointSize: 15
                }
                Text {
                    width: 200
                    height:parent.height*0.8
                    anchors.right:parent.right;anchors.rightMargin: 100
                    anchors.verticalCenter: parent.verticalCenter
                    text: "1.6.7.80/2911"
                    color:"white"
                    font.pointSize: 15
                }
            }
            Rectangle{
                id:seven
                width:parent.width
                height:parent.height*0.1
                color:"transparent"
                anchors.top:sixth.bottom

                Text {
                    anchors.left:parent.left;anchors.leftMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                    text: "Software Version"
                    color:"white"
                    font.pointSize: 15
                }
                Text {
                    width: 200
                    height:parent.height*0.8
                    anchors.right:parent.right;anchors.rightMargin: 100
                    anchors.verticalCenter: parent.verticalCenter
                    text: "10.6.36 "
                    color:"white"
                    font.pointSize: 15
                }
            }
            Rectangle{
                id:eight
                width:parent.width
                height:parent.height*0.1
                color:"transparent"
                anchors.top:seven.bottom

                Text {
                    anchors.left:parent.left;anchors.leftMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                    text: "Hour meter Reading"
                    color:"white"
                    font.pointSize: 15
                }
                Text {
                    width: 200
                    height:parent.height*0.8
                    anchors.right:parent.right;anchors.rightMargin: 100
                    anchors.verticalCenter: parent.verticalCenter
                    text: "217310.6.36 "
                    color:"white"
                    font.pointSize: 15
                }
            }
            Rectangle{
                id:nine
                width:parent.width
                height:parent.height*0.1
                color:"transparent"
                anchors.top:eight.bottom

                Text {
                    anchors.left:parent.left;anchors.leftMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                    text: "Last Maintenance Date"
                    color:"white"
                    font.pointSize: 15
                }
                Text {
                    width: 200
                    height:parent.height*0.8
                    anchors.right:parent.right;anchors.rightMargin: 100
                    anchors.verticalCenter: parent.verticalCenter
                    text: "10/12/2023 "
                    color:"white"
                    font.pointSize: 15
                }
            }
            Rectangle{
                id:ten
                width:parent.width
                height:parent.height*0.1
                color:"transparent"
                anchors.top:nine.bottom


                Text {
                    anchors.left:parent.left;anchors.leftMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                    text: "TV(i) Display"
                    color:"white"
                    font.pointSize: 15
                }
                Rectangle{
                    anchors.right:parent.right;anchors.rightMargin: 185
                    width:parent.width/6
                    height:parent.height
                    color:"transparent"
                    Rectangle {
                        id: background
                        anchors.top:parent.top;anchors.topMargin: 2
                        anchors.left:parent.left;anchors.leftMargin: 2

                        width: parent.width*0.8
                        height: parent.height*0.8
                        color: darkMode ? "#505050" : "#F0F0F0"
                        border.color: darkMode ? "black" : "gray"
                        radius: height / 2

                        Text {
                            anchors.centerIn: parent
                            text: darkMode ? "Dark" : "Light"
                            color: darkMode ? "white" : "black"
                        }


                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                darkMode = !darkMode

                            }
                        }
                    }

                    Rectangle {
                        id: switchHandle
                        anchors.bottom: background.bottom
                        anchors.bottomMargin: 1.5
                        width: height
                        height: parent.height * 0.7
                        color: "white"
                        border.color: darkMode ? "black" : "gray"
                        radius: height / 2
                        x: darkMode ? 0 : background.width - width


                        Behavior on x {
                            PropertyAnimation {
                                duration: 200
                            }
                        }

                        MouseArea {
                            id: switchHandleArea
                            anchors.fill: parent
                            onClicked: {
                                darkMode = !darkMode;

                            }
                        }
                    }
                }
            }
        }
        Rectangle{
            id:midrectvalue2
            width: parent.width-100
            height:parent.height*0.85
            color:"transparent"
            visible:false
            anchors.top:parent.top;anchors.topMargin: 50
            anchors.left: parent.left;anchors.leftMargin: 150
            anchors.right: parent.right;anchors.rightMargin: 150
            Rectangle{
                width:parent.width/1.5
                height:parent.height/2
                color:"lightblue"
                anchors.centerIn: parent
                border.width:2
                border.color:"black"
                radius:5
                Text{
                    text:"Enter The Password"
                    font.pointSize: 15
                    font.bold: true
                    anchors.top: parent.top;anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                }


                TextField {
                    id: passwordtext
                    width: parent.width * 0.6
                    height: parent.height * 0.2
                    anchors.centerIn: parent
                    placeholderText: "Enter the password"
                    echoMode: TextInput.Password
                }
                Text{
                    id:textdisplay
                    text:""
                    color:"red"
                    anchors.top:passwordtext.bottom;anchors.bottomMargin: 8
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 10
                }
                Rectangle{
                    width:parent.width/3
                    height:parent.height/4
                    color:"green"
                    border.width:2
                    border.color:"black"
                    radius:2
                    anchors.bottom: parent.bottom;anchors.bottomMargin: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text{
                        text:"Save"
                        anchors.centerIn: parent
                        font.pointSize: 15
                    }
                    MouseArea{
                        anchors.fill:parent
                        onClicked: {
                            if(passwordtext.text===""){
                                textdisplay.text="password cannot be empty"
                            }else if(passwordtext.text!=="admin"){
                                textdisplay.text="password is not correct"
                            }else{
                                midrectvalue3.visible=true
                                midrectvalue2.visible=false
                                midrectvalues.visible=false
                                midrectvalue3.enabled=true
                                midrectvalue2.enabled=false
                                midrectvalues.enabled=false
                                gotosuccesspage()

                            }
                        }
                    }
                }
            }
        }
        Rectangle{
            id:midrectvalue3
            width: parent.width-100
            height:parent.height*0.85
            color:"black"
            visible:false
            anchors.top:parent.top;anchors.topMargin: 50
            anchors.left: parent.left;anchors.leftMargin: 20
            anchors.right: parent.right;anchors.rightMargin: 20
            Rectangle{
                id:rightrect
                width:parent.width-parent.width*0.15-10
                height:parent.height-50
                anchors.right: parent.right;anchors.rightMargin: 20
               anchors.left: parent.left;anchors.leftMargin: 170
                anchors.top: parent.top;anchors.topMargin: 45
                color:"transparent"
                border.width:5
                border.color:"white"
                radius:3


            }
            Text {
                id: setnameid
                text: qsTr("")
                color:"white"
                font.bold: true
                font.pointSize: 15
                 anchors.left: parent.left;anchors.leftMargin: 170
                   anchors.top: parent.top;anchors.topMargin: 10
            }
            Rectangle{
                id: toggleid
                visible: false
                 anchors.top: parent.top;anchors.topMargin: 10
                anchors.right:parent.right;anchors.rightMargin: 185
                width:parent.width/10
                height:parent.height/15
                color:"transparent"
                Rectangle {

                    anchors.top:parent.top;anchors.topMargin: 2
                    anchors.left:parent.left;anchors.leftMargin: 2

                    width: parent.width
                    height: parent.height
                    color: darkMode ? "#505050" : "#F0F0F0"
                    border.color: darkMode ? "black" : "gray"
                    radius: height / 2

                    Text {
                        anchors.centerIn: parent
                        text: darkMode ? "Dark" : "Light"
                        color: darkMode ? "white" : "black"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            darkMode = !darkMode

                        }
                    }
                }
                Rectangle {
                    id: switchHandle2
                    anchors.bottom: toggleid.bottom
                    anchors.bottomMargin: 1.5
                    width: height
                    height: parent.height*0.8
                    color: "white"
                    border.color: darkMode ? "black" : "gray"
                    radius: height / 2
                    x: darkMode ? 0 : toggleid.width - width


                    Behavior on x {
                        PropertyAnimation {
                            duration: 200
                        }
                    }

                    MouseArea {
                        id: switchHandleArea2
                        anchors.fill: parent
                        onClicked: {
                            darkMode = !darkMode;

                        }
                    }
                }
            }

            Rectangle{
                id:violetrect
                width:parent.width*0.15
                height:parent.height/7
                color:"#9400D3"
                Rectangle{
                    id:violetenabled
                    width:parent.width*0.08
                    height:parent.height
                    color:"lightblue"
                    anchors.right:parent.right
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        getborder(1)
                    }
                }
            }

            Rectangle{
                id:indigorect
                width:parent.width*0.15
                height:parent.height/7
                color:"#4B0082"
                anchors.top:violetrect.bottom

                Rectangle{
                    id:indigoenabled
                    width:parent.width*0.08
                    height:parent.height
                    color:"lightblue"
                    anchors.right:parent.right
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        getborder(2)
                    }
                }
            }
            Rectangle{
                id:bluerect
                width:parent.width*0.15
                height:parent.height/7
                color:"#0000FF"
                anchors.top:indigorect.bottom
                Rectangle{
                    id:blueenabled
                    width:parent.width*0.08
                    height:parent.height
                    color:"lightblue"
                    anchors.right:parent.right
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        getborder(3)
                    }
                }
            }
            Rectangle{
                id:greenrect
                width:parent.width*0.15
                height:parent.height/7
                color:"green"
                anchors.top:bluerect.bottom
                Rectangle{
                    id:greenenabled
                    width:parent.width*0.08
                    height:parent.height
                    color:"lightblue"
                    anchors.right:parent.right
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                       getborder(4)
                    }
                }
            }
            Rectangle{
                id:yellowrect
                width:parent.width*0.15
                height:parent.height/7
                color:"yellow"
                anchors.top:greenrect.bottom
                Rectangle{
                    id:yellowenabled
                    width:parent.width*0.08
                    height:parent.height
                    color:"lightblue"
                    anchors.right:parent.right
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        getborder(5)
                    }
                }
            }
            Rectangle{
                id:orangerect
                width:parent.width*0.15
                height:parent.height/7
                color:"orange"
                anchors.top:yellowrect.bottom
                Rectangle{
                    id:orangeenabled
                    width:parent.width*0.08
                    height:parent.height
                    color:"lightblue"
                    anchors.right:parent.right
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        getborder(6)
                    }
                }
            }
            Rectangle{
                id:redrect
                width:parent.width*0.15
                height:parent.height/7
                color:"red"
                anchors.top:orangerect.bottom

                Rectangle{
                    id:redenabled
                    width:parent.width*0.08
                    height:parent.height
                    color:"lightblue"
                    anchors.right:parent.right
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        getborder(7)
                    }
                }
            }
        }
    }
   function getborder(b){
       switch(b) {
       case 1:
           violetrect.border.width=4;violetrect.border.color="black"
           indigorect.border.width=0;bluerect.border.width=0;greenrect.border.width=0
           orangerect.border.width=0;yellowrect.border.width=0;redrect.border.width=0
           violetenabled.color="blue";
           indigoenabled.color="lightblue"
           blueenabled.color="lightblue"
           greenenabled.color="lightblue"
           yellowenabled.color="lightblue"
           orangeenabled.color="lightblue"
           redenabled.color="lightblue"
           setnameid.text="MQTT Server Settings"
           toggleid.visible=true
           break;
       case 2:
           indigorect.border.width=4;indigorect.border.color="black"
           violetrect.border.width=0;bluerect.border.width=0;greenrect.border.width=0
           orangerect.border.width=0;yellowrect.border.width=0;redrect.border.width=0
           violetenabled.color="lightblue"
           indigoenabled.color="blue"
           blueenabled.color="lightblue"
           greenenabled.color="lightblue"
           yellowenabled.color="lightblue"
           orangeenabled.color="lightblue"
           redenabled.color="lightblue"
           setnameid.text="Remote Server Settings"
           toggleid.visible=false
           break;
       case 3:
           bluerect.border.width=4;bluerect.border.color="black"
           indigorect.border.width=0;violetrect.border.width=0;greenrect.border.width=0
           orangerect.border.width=0;yellowrect.border.width=0;redrect.border.width=0
           violetenabled.color="lightblue"
           indigoenabled.color="lightblue"
           blueenabled.color="blue"
           greenenabled.color="lightblue"
           yellowenabled.color="lightblue"
           orangeenabled.color="lightblue"
           redenabled.color="lightblue"
           break;
       case 4:
           greenrect.border.width=4;greenrect.border.color="black"
           indigorect.border.width=0;bluerect.border.width=0;violetrect.border.width=0
           orangerect.border.width=0;yellowrect.border.width=0;redrect.border.width=0
           violetenabled.color="lightblue"
           indigoenabled.color="lightblue"
           blueenabled.color="lightblue"
           greenenabled.color="blue"
           yellowenabled.color="lightblue"
           orangeenabled.color="lightblue"
           redenabled.color="lightblue"
           break;
       case 5:
           yellowrect.border.width=4;yellowrect.border.color="black"
           indigorect.border.width=0;bluerect.border.width=0;greenrect.border.width=0
           orangerect.border.width=0;violetrect.border.width=0;redrect.border.width=0
           violetenabled.color="lightblue"
           indigoenabled.color="lightblue"
           blueenabled.color="lightblue"
           greenenabled.color="lightblue"
           yellowenabled.color="blue"
           orangeenabled.color="lightblue"
           redenabled.color="lightblue"
           break;
       case 6:
           orangerect.border.width=4;orangerect.border.color="black"
           indigorect.border.width=0;bluerect.border.width=0;greenrect.border.width=0
           violetrect.border.width=0;yellowrect.border.width=0;redrect.border.width=0
           violetenabled.color="lightblue"
           indigoenabled.color="lightblue"
           blueenabled.color="lightblue"
           greenenabled.color="lightblue"
           yellowenabled.color="lightblue"
           orangeenabled.color="blue"
           redenabled.color="lightblue"
           break;
       case 7:
           redrect.border.width=4;redrect.border.color="black"
           indigorect.border.width=0;bluerect.border.width=0;greenrect.border.width=0
           orangerect.border.width=0;yellowrect.border.width=0;violetrect.border.width=0
           violetenabled.color="lightblue"
           indigoenabled.color="lightblue"
           blueenabled.color="lightblue"
           greenenabled.color="lightblue"
           yellowenabled.color="lightblue"
           orangeenabled.color="lightblue"
           redenabled.color="blue"
           break;
       default:
           console.error("Invalid text field ID:", textfieldid);
       }

   }
}

