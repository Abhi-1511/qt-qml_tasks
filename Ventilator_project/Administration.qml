import QtQuick 2.15

Item {
    Rectangle {
            id: redRect
            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
            }
            width: parent.width * 0.3
            height: parent.height / 7
            color: "red"
            border.width: 2
            border.color: "black"
            property string imageUrl: "image://icon/check"
            Image {
                source: redRect.imageUrl
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
            }
            MouseArea {
                anchors.fill: parent
                onClicked: console.log("Clicked Red Rectangle")
            }
        }

        Rectangle {
            id: orangeRect
            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
                topMargin: parent.height / 7
            }
            width: parent.width * 0.3
            height: parent.height / 7
            color: "orange"
            border.width: 2
            border.color: "black"
            property string imageUrl: "image://icon/home"
            Image {
                source: orangeRect.imageUrl
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
            }
            MouseArea {
                anchors.fill: parent
                onClicked: console.log("Clicked Orange Rectangle")
            }
        }

        // Repeat the above pattern for other colors

        Rectangle {
            id: yellowRect
            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
                topMargin: parent.height * 2 / 7
            }
            width: parent.width * 0.3
            height: parent.height / 7
            color: "yellow"
            border.width: 2
            border.color: "black"
            property string imageUrl: "image://icon/star"
            Image {
                source: yellowRect.imageUrl
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
            }
            MouseArea {
                anchors.fill: parent
                onClicked: console.log("Clicked Yellow Rectangle")
            }
        }
}
