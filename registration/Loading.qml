import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4

Item {
    id: loadingpageid // Assigning ID to the Item
    width: windowid.width
    height: windowid.height
    signal gotosuccesspage()
    property real progress: 0

    function welcometoloadingpage() {
        visible = true
        console.log("popup page");
    }

    function handleModeChange(checked) {
        if (checked) {
            // Dark Mode
            loginfull.color = "black"
            loginmid.color = "darkgray"
            loadid.color = "white"


        } else {
            // Light Mode
            loginfull.color = "lightblue"
            loginmid.color = "gray"
            loadid.color = "black"

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
            width: parent.width * 0.8
            height: parent.height * 0.4
            color: "gray"
            anchors.centerIn: parent
            radius: 15
            border.width: 2
            border.color: "black"

            Text {
                id: loadid
                text: qsTr("You are almost there.....!!")
                anchors.top: parent.top
                anchors.leftMargin: parent.width * 0.1
                anchors.left: parent.left
                anchors.topMargin: parent.width * 0.08
                font.pointSize: parent.width * 0.04
            }

            Rectangle {
                id: progressBackground // Assigning ID to the Rectangle
                anchors.bottom: parent.bottom
                anchors.leftMargin: parent.width * 0.1
                anchors.left: parent.left
                anchors.bottomMargin: parent.width * 0.1
                width: parent.width * 0.8
                height: parent.height * 0.15
                radius: 5
                color: "lightgray"
            }

            Rectangle {
                id: progressBarFill // Assigning ID to the Rectangle
                anchors.leftMargin: parent.width * 0.1
                anchors.left: parent.left
                anchors.bottomMargin: parent.width * 0.1
                anchors.bottom: parent.bottom
                width: progressBackground.width * (progress / 100)
                height: progressBackground.height
                radius: 5
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "black" }
                    GradientStop { position: 1.0; color: "green" }
                }
                clip: true
            }

            Timer {
                id: timer
                interval: 1000
                running: {
                    if (loadingpageid.visible === true) {
                        return true
                    } else {
                        return false
                    }
                }
                repeat: true

                onTriggered: {
                    progress += 10;
                    if (progress === 100) {
                        gotosuccesspage()
                        console.log("loading signal")
                        loadingpageid.visible = false
                        progress = 0
                    }
                }
            }
        }
    }
}
