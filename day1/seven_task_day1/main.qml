import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: abc
    width: 800
    height: 600
    visible: true
    title: qsTr("Hello World")

    property bool isBlack: true
    color: abc.isBlack ? "black" : "white"
    Row {
        anchors.centerIn: parent

        Rectangle {
            id: r1
            width:abc.width*0.5
            height: abc.height*0.5
            color: abc.isBlack ? "black" : "white"

            Rectangle {
                id: r2
                width: r1.width*0.5
                height: r1.height*0.5
                color: abc.isBlack ? "white" : "black"
                anchors.centerIn: r1

                Rectangle {
                    id: r3
                    width: r2.width*0.5
                    height: r2.height*0.5
                    color: abc.isBlack ? "black" : "white"
                    anchors.centerIn: r2

                    Rectangle {
                        id: r4
                        width: r3.width*0.5
                        height: r3.height*0.5
                        color: abc.isBlack ? "white" : "black"
                        anchors.centerIn: r3

                        Rectangle {
                            id: r5
                            width: r4.width*0.5
                            height: r4.height*0.5
                            color: abc.isBlack ? "black" : "white"
                            anchors.centerIn: r4
                        }
                    }
                }
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            abc.isBlack = !abc.isBlack;
        }
    }
}
