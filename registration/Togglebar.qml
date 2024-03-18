import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: windowid.width / 10
    height: windowid.height / 20

    property bool darkMode: false

    signal toggled(bool darkMode)
    Rectangle {
        id: background
        anchors.top:parent.top;anchors.topMargin: 2
        anchors.left:parent.left;anchors.leftMargin: 2

        width: parent.width
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
                darkMode = !darkMode;
                toggled(darkMode);
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
                toggled(darkMode);
            }
        }
    }
}
