import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.12
import QtQuick.Controls 1.4
import QtQuick 2.2
Rectangle {
    id:itemid1
    width:mainwindowid.width
    height:mainwindowid.height
    signal gotoopenscreen()
    signal gotoheader(int removeid)
    Open_screen{
    enabled:false
    Rectangle{
        width:parent.width
        height:parent.height
        color:"white"
        opacity:0.1
    }
    }
    function appendvalue(name){
        mannualComboBox.model.append({text: name});
        openscreenid.visible=true
        openscreenid.enabled=true
        saveprofileid.visible=false
        saveprofileid.enabled=false
    }


    Rectangle{
        width:parent.width/2.5
        height:parent.height/2.5
        color:"lightblue"
        border.width:2
        border.color: "red"
        anchors.centerIn: parent
        Text {
            id: headingid
            anchors.top:parent.top;anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Select the profile you want to delete.")
        }
        Text{
            anchors.top:parent.top;anchors.topMargin: 80
            anchors.left: parent.left;anchors.leftMargin: 100
            id:deletetext
            text:"Profile Name : "
        }

        ComboBox{
            id: mannualComboBox
            width: parent.width/2.5
            height: parent.height/6
            anchors.top:parent.top;anchors.topMargin: 70
            anchors.right: parent.right;anchors.rightMargin: 50
            model: ListModel {
                ListElement { text: "Default" }
                ListElement { text: "Abhishek" }
            }
            currentIndex: 0
            style: ComboBoxStyle {

                textColor: "white"
                background: Rectangle {
                    color: "black"
                }

            }
            Rectangle {
                width: 20
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
        width: parent.width * 0.4
        height: parent.height * 0.2
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
                gotoheader(mannualComboBox.currentIndex)
                 mannualComboBox.model.remove(mannualComboBox.currentIndex);
                mannualComboBox.currentIndex=0
            }
        }
    }
    Rectangle {
        id: cancleRect
        width: parent.width * 0.4
        height: parent.height * 0.2
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
                console.log("Cancle clicked")
                gotoopenscreen()
                 mannualComboBox.currentIndex=0
            }
        }
    }
    }
}
