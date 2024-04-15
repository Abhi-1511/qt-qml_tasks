import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.12
import QtQuick.Controls 1.4
import QtQuick 2.2


Item {
    id: cruditem
    width: windowid.width
    height: windowid.height
    property int activated_button:0
    signal gotofunctionpage(int activitytype)
    signal gotoviewnow()
    property bool flags:false

    property real opacityStep: 0.1
    property real decreaseDuration: 1000

    Rectangle {
        id: mainRect
        width: parent.width * 0.8
        height: parent.height * 0.8
        color: "lightgrey"
        anchors.centerIn: parent
        visible: true
        opacity: 1
        Rectangle{
            id: viewRect
            width: parent.width / 5
            height: parent.height / 10
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left;anchors.leftMargin: parent.width/4
            color: "magenta"
            border.width: 2
            border.color: "black"
            radius: 5
            Text {
                id: viewtext
                text: qsTr("View")
                anchors.centerIn: parent
                font.pointSize: parent.width * 0.1
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    gotoviewnow()
                    backend.fetchRows()
                }
            }
        }
        Rectangle{
            id: editRect
            width: parent.width / 5
            height: parent.height / 10
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right;anchors.rightMargin: parent.width/4
            color: "magenta"
            border.width: 2
            border.color: "black"
            radius: 5
            Text {
                id: edittext
                text: qsTr("Edit")
                anchors.centerIn: parent
                font.pointSize: parent.width * 0.1
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    editpageid.visible=true
                    crudscreenid.visible=false
                    editpageid.enabled=true
                    crudscreenid.enabled=false
                }
            }
        }
        Rectangle {
            id: createRect
            width: parent.width / 4
            height: parent.height / 10
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 20
            color: "green"
            border.width: 2
            border.color: "black"
            radius: 5
            Text {
                id: createtext
                text: qsTr("CREATE")
                anchors.centerIn: parent
                font.pointSize: parent.width * 0.1
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    backend.createDatabase("datadasevalues")
                    popupid.visible=true
                    crudscreenid.opacity=0.8
                }
            }
        }
        Rectangle{//insert ui
            id: insertRect
            width:parent.width/10
            height:parent.height/3
            anchors.verticalCenter: parent.verticalCenter
            anchors.right:parent.right;anchors.rightMargin: 20
            color:"blue"
            border.width:2
            border.color: "black"
            radius:5
            Text {
                id: inserttext
                text: qsTr("I\nN\nS\nE\nR\nT")
                anchors.centerIn: parent
                font.pointSize: parent.width*0.23
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    opacityAnimation.running = true;
                    activated_button=2
                }
            }
        }

        Rectangle{//update ui
            id: updateRect
            width:parent.width/4
            height:parent.height/10
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom:parent.bottom;anchors.bottomMargin: 20
            color:"yellow"
            border.width:2
            border.color: "black"
            radius:5
            Text {
                id: updatetext
                text: qsTr("UPDATE")
                anchors.centerIn: parent
                font.pointSize: parent.width*0.1
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    opacityAnimation.running = true;
                    activated_button=3
                }
            }
        }

        Rectangle{//delete ui
            id: deleteRect
            width:parent.width/10
            height:parent.height/3
            anchors.verticalCenter: parent.verticalCenter
            anchors.left:parent.left;anchors.leftMargin: 20
            color:"red"
            border.width:2
            border.color: "black"
            radius:5
            Text {
                id:deletetext
                text: qsTr("D\nE\nL\nE\nT\nE")
                anchors.centerIn: parent
                font.pointSize: parent.width*0.23
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    opacityAnimation.running = true;
                    activated_button=4
                }
            }
        }
        PropertyAnimation {
            id: opacityAnimation
            target: crudscreenid
            property: "opacity"
            to: 0.2
            duration: 1000
            easing.type: Easing.InOutQuad
            onStopped: {
                crudscreenid.visible = false;
                gotofunctionpage(activated_button)
            }
        }
    }
    Text {
        id: displaytext
        text: ""
        anchors.centerIn: parent
        font.pointSize: parent.width * 0.02
    }
}
