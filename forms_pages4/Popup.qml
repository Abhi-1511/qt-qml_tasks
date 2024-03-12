import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    //id:popup
    width: parent.width / 2
    height: parent.height / 3
    anchors.centerIn: parent
    signal saveClicked()
    signal deleteClicked()
    visible: true
    Rectangle {
        anchors.fill: parent
        color: "white"
        border.color: "black"
        border.width: 2
        //border.width: 5
        radius: 50
        gradient: Gradient {
            GradientStop { position: 0.0; color: "white" }
            GradientStop { position: 1.0; color: "#ccbff5" }
        }

        Text {
            text: "Do you want to save or delete?"
            anchors.centerIn: parent
        }

        Row {
            spacing: 20
            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
                margins: 10
            }

            Button {
                text: "Delete"
                onClicked: {
                    // Emit a signal to notify the parent that Save button is clicked
                    saveClicked()
                }
            }

            Button {
                text: "Save"
                onClicked: {
                    // Emit a signal to notify the parent that Delete button is clicked
                    deleteClicked()
                }
            }
        }
    }
}
