import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("task1")
    color: "black"
    minimumWidth: 200
    maximumHeight: 800


    Text{
        text:"Hello World"
        color: "red"
        font.weight: Font.ExtraBold
        font.pointSize: 8
        anchors.centerIn: parent
    }


        Text {
        text: "Hello World"
        color: "red"
        font.pointSize: 20
    }

}

//row beda anchors use madbeku
