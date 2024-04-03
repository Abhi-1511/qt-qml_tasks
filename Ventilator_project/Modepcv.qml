import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.12
import QtQuick.Controls 1.4
import QtQuick 2.2

Item {
    width:mainwindowid.width
    height:mainwindowid.height
    signal gotoopenscreen()
    property string currentText:"PVC"
    Header{}
    function updatePvcText() {
        switch (breathcombo.currentText) {
        case "Assist/Control                        ":
            if(ventmodecombo.currentText==="Volume")
            pcvtext.text = "VCV";
            if(ventmodecombo.currentText==="Pressure                              ")
            pcvtext.text = "PCV";
            break;
        case "Support":
            pcvtext.text = "CPAP";
            break;
        case "Intermittent":
            if(ventmodecombo.currentText==="Volume")
           pcvtext.text = "VC-SIMV (PS)";
            if(ventmodecombo.currentText==="Pressure                              ")
            pcvtext.text = "PC-SIMV(PS)";
            break;
        case "PRVC":
            pcvtext.text = "PRVC";
            break;
        default:
            pcvtext.text = "PCV";
            break;
        }

    }
    Rectangle{
        width:parent.width
        height :parent.height-parent.height/10-5
        y:parent.height/10+5
        color:"black"
        Text {
            id: pcvtext
            text: PCV
            color:"#A2B54A"
            font.pointSize: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top;anchors.topMargin: 20
        }
        //////////topleft
        Text {
            id: patientcombotext
            text: qsTr("Patient Type")
            color:"#04F8FF"
            font.pointSize: 15
            anchors.left: parent.left;anchors.leftMargin: 150
            anchors.top: parent.top;anchors.topMargin: 70
        }
        ComboBox{
            id: patientcombo
            width: parent.width*0.25
            height: parent.height*0.1
            anchors.left: parent.left;anchors.leftMargin: 100
            anchors.top: parent.top;anchors.topMargin: 100
            model: ListModel {
                ListElement { text: "Adult" }
                ListElement { text: "Pediatric                              " }
            }


            currentIndex: 0

            style: ComboBoxStyle {

                textColor: "black"
                background: Rectangle {
                    color: "#5779CC"

                }
            }


            Rectangle {
                width: 20
                height: patientcombo.height
                color: "#5779CC"

                anchors.right: parent.right;anchors.rightMargin: 10
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    text: "\u25BD" // Hexadecimal Unicode escape sequence
                    font.pixelSize: 16 // Adjust the font size as needed
                    color: "white" // Set the color of the down arrow symbol
                }

            }
        }

        ////////////////////top right
        Text {
            id: circuitcombotext
            text: qsTr("Circuit Type")
            color:"#04F8FF"
            font.pointSize: 15
            anchors.right: parent.right;anchors.rightMargin: 150
            anchors.top: parent.top;anchors.topMargin: 70
        }
        ComboBox{
            id: circuitcombo
            width: parent.width*0.25
            height: parent.height*0.1
            anchors.right: parent.right;anchors.rightMargin: 100
            anchors.top: parent.top;anchors.topMargin: 100
            model: ListModel {
                ListElement { text: "Dual Limb" }
                ListElement { text: "Single Limb with Leak            " }

            }
            currentIndex: 0

            style: ComboBoxStyle {
                textColor: "black" // Set the text color to white directly on ComboBoxStyle
                background: Rectangle {
                    color: "#5779CC"

                }
            }


            Rectangle {
                width: 20
                height: patientcombo.height
                color: "#5779CC"

                anchors.right: parent.right;anchors.rightMargin: 10
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    text: "\u25BD" // Hexadecimal Unicode escape sequence
                    font.pixelSize: 16 // Adjust the font size as needed
                    color: "white" // Set the color of the down arrow symbol
                }

            }
        }
        ///////////////////bottomleft
        Text {
            id: ventmodecombotext
            text: qsTr("Ventilator Mode")
            color:"#04F8FF"
            font.pointSize: 15
            anchors.left: parent.left;anchors.leftMargin: 150
            anchors.bottom: parent.bottom;anchors.bottomMargin: 200
        }
        ComboBox{
            id: ventmodecombo
            width: parent.width*0.25
            height: parent.height*0.1
            anchors.left: parent.left;anchors.leftMargin: 100
            anchors.bottom: parent.bottom;anchors.bottomMargin: 150
            model: ListModel {
                ListElement { text: "Pressure                              " }
                ListElement { text: "Volume" }

            }
            currentIndex: 0

            onCurrentIndexChanged: {
                if (ventmodecombo) {
                    updatePvcText();
                }

                if (currentIndex === 0) {
                    breathcombo.model = ["Assist/Control                        " ,
                                          "Support" ,
                                        "Intermittent"];
                } else if (currentIndex === 1) {
                    breathcombo.model = ["Assist/Control                        " ,
                                         "PRVC" ,
                                       "Intermittent"];
                }

            }
            style: ComboBoxStyle {
                textColor: "black" // Set the text color to white directly on ComboBoxStyle
                background: Rectangle {
                    color: "#5779CC"

                }
            }


            Rectangle {
                width: 20
                height: patientcombo.height
                color: "#5779CC"

                anchors.right: parent.right;anchors.rightMargin: 10
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    text: "\u25BD" // Hexadecimal Unicode escape sequence
                    font.pixelSize: 16 // Adjust the font size as needed
                    color: "white" // Set the color of the down arrow symbol
                }

            }
        }
        ////////bottoright
        Text {
            id: breathcombotext
            text: qsTr("Breath Options")
            color:"#04F8FF"
            font.pointSize: 15
            anchors.right: parent.right;anchors.rightMargin: 150
            anchors.bottom: parent.bottom;anchors.bottomMargin: 200
        }
        ComboBox{
            id: breathcombo
            width: parent.width*0.25
            height: parent.height*0.1
            anchors.right: parent.right;anchors.rightMargin: 100
            anchors.bottom: parent.bottom;anchors.bottomMargin: 150
            model: ListModel {
                ListElement { text: "Assist/Control                        " }
                ListElement { text: "Support" }
                ListElement { text: "Intermittent" }
            }
            currentIndex: 0
            onCurrentIndexChanged: {
                updatePvcText();
            }
            style: ComboBoxStyle {
                textColor: "black" // Set the text color to white directly on ComboBoxStyle
                background: Rectangle {
                    color: "#5779CC"

                }
            }

            Rectangle {
                width: 20
                height: patientcombo.height
                color: "#5779CC"
                anchors.right: parent.right;anchors.rightMargin: 10
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    text: "\u25BD" // Hexadecimal Unicode escape sequence
                    font.pixelSize: 16 // Adjust the font size as needed
                    color: "white" // Set the color of the down arrow symbol
                }

            }
        }

        Rectangle{
            id:okrectid
            width:parent.width*0.2
            height:parent.height*0.1
            anchors.left:parent.left;anchors.leftMargin:80
            anchors.bottom: parent.bottom;anchors.bottomMargin: 50
            border.width:2
            border.color:"black"
            color:"green"
            radius:10
            Text{
                text:"Confirm"
                anchors.centerIn: parent
                font.pointSize: parent.width*0.1
                color:"white"
            }
            MouseArea{
                anchors.fill:parent
                onClicked:{
                    gotoopenscreen()

                }
            }
        }
        Rectangle{
            id:canclerectid
            width:parent.width*0.2
            height:parent.height*0.1
            anchors.right:parent.right;anchors.rightMargin:80
            anchors.bottom: parent.bottom;anchors.bottomMargin: 50
            color:"#5779CC"
            radius:10
            border.width:2
            border.color:"black"
            Text{
                text:"Cancel"
                anchors.centerIn: parent
                font.pointSize: parent.width*0.1
                color:"white"
            }
            MouseArea{
                anchors.fill:parent
                onClicked:{
                    gotoopenscreen()

                }
            }
        }
    }

}
