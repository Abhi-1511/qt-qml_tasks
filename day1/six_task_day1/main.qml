import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    color: "black"
    //property bool isvisible:true
    Row {
        anchors.centerIn: parent
        spacing: 10
    Rectangle {
        id:rec1
        width:100
        height:100
        color: "red"
        //visible: isvisible
        opacity: 1
        MouseArea {
            anchors.fill: parent
            onClicked: {
                        rec2.opacity=0.5
                        rec3.opacity=0.5
                        rec1.opacity=1
            }
        }
    }
    Rectangle {
        id:rec2
        width:100
        height:100
        color: "blue"
        anchors.leftMargin: 5
        opacity: 1
        MouseArea {
            anchors.fill: parent
            onClicked: {
                rec1.opacity=0.5
                rec3.opacity=0.5
                rec2.opacity=1
            }
        }
    }
    Rectangle {
        id:rec3
        width:100
        height:100
        color: "green"
        //visible: isvisible
        opacity: 1
        MouseArea {
            anchors.fill: parent
            onClicked: {
                rec2.opacity=0.5
                rec1.opacity=0.5
                rec3.opacity=1
            }
        }

    }
    }
}
