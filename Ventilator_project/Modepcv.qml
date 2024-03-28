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
    Header{}
    Rectangle{
        width:parent.width
        height :parent.height-parent.height/10-5
        y:parent.height/10+5
        color:"black"
        Text {
            id: pcvtext
            text: qsTr("PCV")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top;anchors.topMargin: 20
        }

        ComboBox{
            id: patientcombo
            width: parent.width*0.3
            height: parent.height*0.1
            anchors.left: parent.left;anchors.leftMargin: 50
            anchors.top: parent.top;anchors.topMargin: 80
            model: ListModel {
                ListElement { text: "Default" }
                ListElement { text: "Option 1" }
                ListElement { text: "Option 2" }
                ListElement { text: "Option 3" }
            }
            currentIndex: 0

            style: ComboBoxStyle {

                textColor: "white" // Set the text color to white directly on ComboBoxStyle
                background: Rectangle {
                    color: "gray"
                }

            }


            Rectangle {
                width: 20
                height: patientcombo.height
                color: "gray"
                anchors.right: parent.right;anchors.rightMargin: 10
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    text: "\u25BD" // Hexadecimal Unicode escape sequence
                    font.pixelSize: 16 // Adjust the font size as needed
                    color: "white" // Set the color of the down arrow symbol
                }

            }
        }
        ComboBox{
            id: circutecombo
            width: parent.width*0.3
            height: parent.height*0.1
            anchors.right: parent.right;anchors.rightMargin: 50
            anchors.top: parent.top;anchors.topMargin: 80
            model: ListModel {
                ListElement { text: "Default" }
                ListElement { text: "Option 1" }
                ListElement { text: "Option 2" }
                ListElement { text: "Option 3" }
            }
            currentIndex: 0

            style: ComboBoxStyle {

                textColor: "white" // Set the text color to white directly on ComboBoxStyle
                background: Rectangle {
                    color: "gray"
                }

            }


            Rectangle {
                width: 20
                height: circutecombo.height
                color: "gray"
                anchors.right: parent.right;anchors.rightMargin: 10
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    text: "\u25BD" // Hexadecimal Unicode escape sequence
                    font.pixelSize: 16 // Adjust the font size as needed
                    color: "white" // Set the color of the down arrow symbol
                }

            }
        }

        ComboBox{
            id: ventilatorcombo
            width: parent.width*0.3
            height: parent.height*0.1
            anchors.left: parent.left;anchors.leftMargin: 50
            anchors.top: parent.top;anchors.topMargin: 200
            model: ListModel {
                ListElement { text: "Default" }
                ListElement { text: "Option 1" }
                ListElement { text: "Option 2" }
                ListElement { text: "Option 3" }
            }
            currentIndex: 0

            style: ComboBoxStyle {

                textColor: "white" // Set the text color to white directly on ComboBoxStyle
                background: Rectangle {
                    color: "gray"
                }

            }


            Rectangle {
                width: 40
                height: ventilatorcombo.height
                color: "gray"
                anchors.right: parent.right;anchors.rightMargin: 10
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    text: "\u25BD" // Hexadecimal Unicode escape sequence
                    font.pixelSize: 16 // Adjust the font size as needed
                    color: "white" // Set the color of the down arrow symbol
                }

            }
        }

        ComboBox{
            id: breathcombo
            width: parent.width*0.3
            height: parent.height*0.1
            anchors.right: parent.right;anchors.rightMargin: 50
            anchors.top: parent.top;anchors.topMargin: 200
            model: ListModel {
                ListElement { text: "Default" }
                ListElement { text: "Option 1" }
                ListElement { text: "Option 2" }
                ListElement { text: "Option 3" }
            }
            currentIndex: 0

            style: ComboBoxStyle {

                textColor: "white" // Set the text color to white directly on ComboBoxStyle
                background: Rectangle {
                    color: "gray"
                }

            }


            Rectangle {
                width: 20
                height: breathcombo.height
                color: "gray"
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
            color:"gray"
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
