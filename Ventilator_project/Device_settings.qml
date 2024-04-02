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
    Header{}
    Rectangle{
        id:mainrect
        width:parent.width
        height:parent.height*0.889
        anchors.bottom: parent.bottom
        color:"black"
        Rectangle {  //back arrow
            width:parent.width/6
            height:parent.height/8
            anchors.left: parent.left
            color:"black"

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
                }
            }

        }

        Rectangle{ //device info
            id:toptextid
            width:parent.width/3
            height:parent.height/15
            anchors.left: parent.left;anchors.leftMargin: 180
            anchors.top: parent.top;anchors.topMargin: 10
            color:"black"
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
                }
            }

        }

        Rectangle{//administration
            width:parent.width/3
            height:parent.height/15
            anchors.right: parent.right;anchors.rightMargin: 150
            anchors.top: parent.top;anchors.topMargin: 10
            color:"black"
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
                color:"black"

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
                color:"black"
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
                color:"black"
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
                color:"black"
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
                color:"black"
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
                color:"black"
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
                color:"black"
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
                color:"black"
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
                color:"black"
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
                color:"black"
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

                TextField{
                    id:passwordtext
                    width:parent.width*0.6
                    height:parent.height*0.2
                    anchors.centerIn: parent
                    placeholderText:"Enter the password"
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
                            }else{
                                gotosuccesspage()
                            }

                        }
                    }
                }

            }
        }
    }
}

