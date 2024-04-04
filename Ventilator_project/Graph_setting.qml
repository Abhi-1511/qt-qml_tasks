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


    Header{}
    Rectangle{
        width: parent.width
        height: parent.height*0.89
        anchors.bottom: parent.bottom
        color:"gray"

        ComboBox{
            id: mannualComboBox
            width: parent.width/3
            height: parent.height/10
            anchors.top:parent.top;anchors.topMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
            model: ListModel {
                ListElement { text: "16 sec                     " }
                ListElement { text: "32 sec" }
            }
            currentIndex: 0
            style: ComboBoxStyle {

                textColor: "white"
                background: Rectangle {
                    color: "black"
                }

            }
            Rectangle {
                width: 40
                height: mannualComboBox.height
                color: "black"
                anchors.right: parent.right;anchors.rightMargin: 10
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    text: "\u25BD" // Hexadecimal Unicode escape sequence
                    font.pixelSize: 16 // Adjust the font size as needed
                    color: "white" // Set the color of the down arrow symbol
                }

            }
        }
        Rectangle {
            id: confirmRect
            width: parent.width * 0.3
            height: parent.height * 0.1
            color: "green"
            anchors.bottom: parent.bottom;anchors.bottomMargin: 50
            anchors.left: parent.left;anchors.leftMargin: 100
            border.width: 2
            border.color:"black"
            radius:5
            Text {
                anchors.centerIn: parent
                text: "Confirm"
                color: "white"
                font.pointSize: 15
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    graphsettingspage.visible=false
                    graphsettingspage.enabled=false
                    graphid.visible=true
                    graphid.enabled=true
                }
            }
        }
        Rectangle {
            id: cancleRect
            width: parent.width * 0.3
            height: parent.height * 0.1
            color: "lightgray"
            anchors.bottom: parent.bottom;anchors.bottomMargin: 50
            anchors.right: parent.right;anchors.rightMargin: 100
            border.width: 2
            border.color:"black"
            radius:5

            Text {
                anchors.centerIn: parent
                text: "Cancel"
                color: "white"
                font.pointSize: 15
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Cancle clicked")
                    mannualComboBox.currentIndex=0
                }
            }
        }

    }
}
