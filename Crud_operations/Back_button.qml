import QtQuick 2.15

Item {
    width:windowid.width/8
    height:windowid.height/12
    Rectangle{
        width:parent.width
        height:parent.height
        color:"green"
        anchors.centerIn: parent
        border.width:2
        border.color:"black"
        radius:5

        Text {
            id: oktext4
            text: qsTr("HOME")
            anchors.centerIn: parent
            font.pointSize: parent.width * 0.1
            color:"white"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                crudscreenid.visible=true
                crudscreenid.enabled=true
                functionpageid.enabled=false
                functionpageid.visible=false
                crudscreenid.opacity=1
            }
        }
    }
}
