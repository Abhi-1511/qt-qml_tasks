import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.12
import QtQuick.Controls 1.4
import QtQuick 2.2

Item {
    width: mainwindowid.width/ 4.8484
    height: mainwindowid.height/10
    function appendvalue(name){
        mannualComboBox.model.append({text: name});
        openscreenid.visible=true
        openscreenid.enabled=true
        saveprofileid.visible=false
        saveprofileid.enabled=false
    }
    ComboBox{
        id: mannualComboBox
        width: parent.width
        height: parent.height
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
}
