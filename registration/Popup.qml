import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4

Item {
    id: popuppageid // Assigning ID to the Item
    width: windowid.width
    height: windowid.height
    property bool passwordVisible: false
    property real progressBarValue: 0
    property bool wasEmpty: true
    signal gotoloadingpage()
    signal gotologinpageagain2()
    signal cleardata()

    function welcometopopuppage() {
        visible = true
        console.log("popup page");
    }

    function handleModeChange(checked) {
        if (checked) {
            // Dark Mode
            loginfull.color = "black"
            loginmid.color = "darkgray"
            textSave.color = "lightgray"
            textCancel.color = "lightgray"
            textMessage.color="white"
        } else {
            // Light Mode
            loginfull.color = "lightblue"
            loginmid.color = "gray"
            textSave.color = "black"
            textCancel.color = "black"
            textMessage.color="black"
        }
    }

    Rectangle {
        id: loginfull
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        color: "lightblue"

        Rectangle {
            id: loginmid
            width: parent.width * 0.3
            height: parent.height * 0.2
            color: "gray"
            anchors.centerIn: parent
            radius: 15
            border.width: 2
            border.color: "black"

            Text {
                id: textMessage
                anchors.horizontalCenter: parent.horizontalCenter
                text: "\nDo you want to save?"
                font.pointSize: parent.width * 0.05
            }

            Rectangle {
                width: parent.width * 0.4
                height: parent.height * 0.3
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                border.width: 2
                border.color: "black"
                radius: 5
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "lightgreen" }
                    GradientStop { position: 1.0; color: "green" }
                }

                Text {
                    id: textSave
                    anchors.centerIn: parent
                    text: "Save"
                    font.pointSize: parent.width * 0.1
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        gotoloadingpage()
                        console.log("popup signal")
                        popuppageid.visible = false
                    }
                }
            }

            Rectangle {
                width: parent.width * 0.4
                height: parent.height * 0.3
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                border.width: 2
                border.color: "black"
                radius: 5
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "orangered" }
                    GradientStop { position: 1.0; color: "red" }
                }

                Text {
                    id: textCancel
                    anchors.centerIn: parent
                    text: "cancel"
                    font.pointSize: parent.width * 0.1
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        gotologinpageagain2()
                        popuppageid.visible = false
                        cleardata()
                    }
                }
            }
        }
    }
}
