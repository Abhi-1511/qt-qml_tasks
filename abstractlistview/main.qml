// main.qml
import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    width: 400
    height: 300
    visible: true
    title: "List View Example"

    ListView {
        id:listView
        width: parent.width
        height: parent.height
        model: customModel
        spacing: 20
        delegate: Item {
            width: 300
            height: 30 // Adjust the height according to your data

            // Display all data in the table
            Text {

                text: model.display
                anchors.left: parent.left
                anchors.leftMargin: 30
            }
        }
    }
}
