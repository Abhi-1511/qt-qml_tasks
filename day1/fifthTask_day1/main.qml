import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("fifth")
    color: "black"
    property bool isvisible:true
    Rectangle {
        width: 200
        height: 50
        color: "blue"
        anchors.centerIn: parent
        visible: isvisible
        border.color: "white"
        border.width: 2
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            isvisible = !isvisible
    }
}
}
