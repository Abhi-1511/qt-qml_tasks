import QtQuick 2.15
Item {
    id: rootid
    property alias buttonText:displayid.text
    property alias buttoncol:abc.color
    property alias buttonop:abc.opacity
    property alias buttonhig:abc.height
    property alias buttonvisi:abc.visible
    property alias rectABC: abc
    signal buttonClicked()
    width:abc.width
    height:abc.height
    property bool  isvisible: true



    Rectangle {

        id:abc
        color:"red"
        width:displayid.implicitWidth + abcd.width/15
        height:displayid.implicitHeight + abcd.width/18

        x:10;y:10
        visible:true
        opacity:0.8
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
