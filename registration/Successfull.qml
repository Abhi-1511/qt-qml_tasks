import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4

Item {
    id: successid // Assigning ID to the Item
    width: windowid.width
    height: windowid.height
    signal gotologinpage()
    signal makingfieldsnull1()
    signal makingfieldsnull2()
    signal cleanlogin()

    function welcometosuccesspage() {
        visible = true
        console.log("success page");
    }

    function handleModeChange(checked) {
        if (checked) {
            // Dark Mode
            loginfully.color = "black"
            loginmidi.color = "darkgray"
            succestextid.color = "white"
            succestextidok.color = "white"
            greenok.color="black"
        } else {
            // Light Mode
            loginfully.color = "lightblue"
            loginmidi.color = "gray"
            succestextid.color = "black"
            succestextidok.color = "black"
            greenok.color="green"
        }
    }

    Rectangle {
        id: loginfully
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        color: "lightblue"

        Rectangle {
            id: loginmidi
            width: parent.width * 0.3
            height: parent.height * 0.2
            color: "gray"
            anchors.centerIn: parent
            radius: 15
            border.width: 2
            border.color: "black"

            Text {
                id: succestextid // Assigning ID to the Text
                text: qsTr("Successfully Registered")
                anchors.top:parent.top;anchors.topMargin: parent.height * 0.2
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: parent.width * 0.05
            }

            Rectangle {
                id:greenok
                width: parent.width * 0.4
                height: parent.height * 0.3
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                color: "green"
                radius: 5
                border.color: "black"
                border.width: 2

                Text {
                    id: succestextidok // Assigning ID to the Text
                    text: qsTr("OK")
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        gotologinpage()
                        console.log("successfull signal")
                        successid.visible = false
                        loginpageid.visible = true
                        makingfieldsnull1()
                        makingfieldsnull2()
                        cleanlogin()
                    }
                }
            }
        }
    }
}
