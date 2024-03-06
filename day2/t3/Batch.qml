import QtQuick 2.15
Item {
    id: rootid
    property alias buttonText:displayid.text
    property alias buttoncol:abc.color
    signal buttonClicked()
    width:abc.width
    height:abc.height
    Rectangle {

        id:abc
        color:"red"
        width:abcd.width/8
        height:abcd.width/10
        x:10;y:10
        border.color: "black"


        Text{
            id:displayid
            anchors.centerIn: parent
            anchors.rightMargin: 10
            text:"button"
            font.pointSize: 5
        }
        MouseArea{
            anchors.fill:parent
            onClicked: {
                rootid.buttonClicked()

            }
        }
    }

}
