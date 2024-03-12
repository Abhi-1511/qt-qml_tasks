import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    width: 400
    height: 300

    Button {
        text: "Next Page"
        anchors.centerIn: parent
        onClicked: onNextPageClicked()
    }

    signal onNextPageClicked()
}
