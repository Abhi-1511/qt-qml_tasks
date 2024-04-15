import QtQuick 2.15

Item {
    width:windowid.width
    height:windowid.height
    anchors.bottom:parent.bottom
    function fromcrudscreencreate(){
        opacityAnimation.from = mainRect.opacity;
        opacityAnimation.to = 1;
        opacityAnimation.running = true;
        crudscreenid.visible=false
        crudscreenid.enabled=false
        createpageid.visible=true
        createpageid.enabled=true
    }

    Rectangle{
        id: mainRect
        width: parent.width * 0.8
        height: parent.height * 0.8
        color: "lightgrey"
        anchors.centerIn: parent
        visible: true
        opacity: 0.2 // Initial opacity set to 1

        Rectangle {
            id: createRect
            width: parent.width / 4
            height: parent.height / 10
           anchors.centerIn: parent
            anchors.topMargin: 20
            color: "red"
            border.width: 2
            border.color: "black"
            radius: 5
            Text {
                id: createtext
                text: qsTr("hi there")
                anchors.centerIn: parent
                font.pointSize: parent.width * 0.1
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {

                }
            }
        }

        // Property animation to decrease opacity gradually
        PropertyAnimation {
            id: opacityAnimation
            target: mainRect
            property: "opacity"
            //to: 0.2
            duration: 1000 // 0.5 seconds
            easing.type: Easing.InOutQuad // Easing function
            onStopped: {
                // Once animation stops, make the rectangle invisible
                mainRect.visible =true;

            }
        }
    }
}
