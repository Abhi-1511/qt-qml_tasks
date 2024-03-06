import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id:abc
    width: 800
    height: 600
    visible: true
    title: qsTr("task4")

    property var fonts: Qt.fontFamilies()
    property int i:0
    Text {
        id: displayText
        anchors.centerIn: parent
        text: fonts[i]
        font.pointSize: abc.width/25
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {

                if(i<fonts.length){   
                displayText.font.family = fonts[i];
                console.log(fonts[i]);
                    i++;
                }
                else{
                    i=0
                }

        }
    }
}
//font name print agbeku abcd badlu

