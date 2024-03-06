import QtQuick 2.15
Item {
    id: rootid
    property alias  buttonText: displayid.text
     property alias buttonvisi:abc.enabled
    property alias rectcol: abc.color
    property alias bordere:abc.border.color
    signal buttonClicked()
    width:abc.width
    height:abc.height
    property bool  isvisible: true
    Rectangle {

        id:abc
        color:"blue"
        anchors.leftMargin: 10
        width:abcd.width/9+displayid.width
        height:abcd.width/10+displayid.height
        x:10;y:10
        enabled: isvisible
       border{
           color:"black"
           width:10
       }
        // border.color: "transparent"
        // border.width:10
        Text{
            id:displayid
            anchors.centerIn: parent
            anchors.rightMargin: 10
            text:"button"
            font.pointSize: 20
        }
        MouseArea{
            anchors.fill:parent
            onClicked: {
                rootid.buttonClicked()

            }
        }
    }

}
//window color change agbeku enable adaga border
