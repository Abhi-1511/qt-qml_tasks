import QtQuick.Window 2.15
import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id
    visible: true
    width: 400
    height: 300
    title: "Page Navigation Example"

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: MainPage {
            onNextPageClicked: {
                stackView.push(page2)
            }
        }

        Component.onCompleted: {
            stackView.push(page1)
        }

        Page1 {
            id: page1
            onNextPageClicked: {
                stackView.push(page2)
            }
        }

        Page2 {
            id: page2
            onPreviousPageClicked: {
                stackView.pop()
            }
        }
    }
}
