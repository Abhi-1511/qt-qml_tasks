import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

import com.ventilatorproject.tablemodel2 1.0

Item {
    width: mainwindowid.width
    height: mainwindowid.height


    TableModel2 {
        id: tableModel2
    }

    TableView {
        id: stableView
        width: parent.width- 100
        height: parent.height/ 1.4
        clip: true // Clip content to ensure black background is visible
        x: 50
        y: 78
        model: tableModel2
        backgroundVisible: false
        style: TableViewStyle {
            backgroundColor: "black";
            rowDelegate: Row {
                id: rowDelegate
                height: 65 // Set the desired row height
            }
        }

        TableViewColumn {
            role: "timestamp"
            title: "       Time Stamp"
            width: stableView.width * 0.3 // Set width as a percentage of TableView width
            delegate: Text {
                text: model ? model.timestamp : ""
                color: "white"
                font.pointSize: 12
                verticalAlignment: Text.AlignVCenter
                padding: 10
            }
        }

        TableViewColumn {
            role: "category"
            title: "Category"
            width: stableView.width * 0.2 // Set width as a percentage of TableView width
            delegate: Text {
                text: model ? model.category : ""
                color: "white"
                font.pointSize: 12
                verticalAlignment: Text.AlignVCenter
                padding: 10
            }
        }

        TableViewColumn {
            role: "eventname"
            title: "Event Name"
            width: stableView.width * 0.2 // Set width as a percentage of TableView width
            delegate: Text {
                text: model ? model.eventname : ""
                color: "white"
                font.pointSize: 12
                verticalAlignment: Text.AlignVCenter
                padding: 10
            }
        }

        TableViewColumn {
            role: "eventvalue"
            title: "Event Value"
            width: stableView.width * 0.2 // Set width as a percentage of TableView width
            delegate: Text {
                text: model ? model.eventvalue : ""
                color: "white"
                font.pointSize: 12
                verticalAlignment: Text.AlignVCenter
                padding: 10
            }
        }

        TableViewColumn {
            role: "source"
            title: "Source"
            width: stableView.width * 0.1 // Set width as a percentage of TableView width
            delegate: Text {
                text: model ? model.source : ""
                color: "white"
                font.pointSize: 12
                verticalAlignment: Text.AlignVCenter
                padding: 10
            }
        }

        headerDelegate: Rectangle {
            y: 10
            width: stableView.width * 0.8
            height: stableView.height / 8
            color: "black"
            anchors.centerIn: parent
            Text {
                text: styleData.value
                color: "white"
                font.pointSize: 15
            }
        }

        verticalScrollBarPolicy: ScrollBar.AlwaysOff
        horizontalScrollBarPolicy: ScrollBar.AlwaysOff
    }

    Component.onCompleted: {
        //tableModel2.fetchData();
    }

    onVisibleChanged: {
        //tableModel2.fetchData();
    }

    Connections {
        target: tableModel2

        function onDataChanged() {
            stableView.model = null;
            stableView.model = tableModel2;
        }
    }

    Rectangle{
        id:previousid
        width:parent.width/5
        height:parent.height/15
        color:"#0D5376"
        anchors.bottom: parent.bottom;anchors.bottomMargin: 10
        anchors.left:parent.left;anchors.leftMargin: 150
        radius: 10

        Text {
            id: previoustextid
            text: qsTr("Previous")
            anchors.centerIn: parent
            font.bold: true
            font.pointSize: 15
            color:"white"
        }
        MouseArea{
            anchors.fill:parent
            onClicked: {
            tableModel2.previousPage();
                console.log("previous clicked in system page :")
            }
        }
    }
    Rectangle{
        id:closeid
        width:parent.width/5
        height:parent.height/15
        color:"#DD735B"
        radius: 10
        anchors.bottom: parent.bottom;anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            id: prevcloseid
            text: qsTr("Close")
            anchors.centerIn: parent
            font.bold: true
            font.pointSize: 15
            color:"white"
        }
        MouseArea{
            anchors.fill:parent
            onClicked: {
                devicelogid.visible=false
                devicelogid.enabled=false
                openscreenid.visible=true
                openscreenid.enabled=true
                monitorlogid.enabled=false
                monitorlogid.visible=false
                systemlogids.visible=false
                systemlogids.enabled=false
                console.log("close clicked in system page :")
            }
        }
    }
    Rectangle{
        id:nextid
        width:parent.width/5
        height:parent.height/15
        color:"green"
        anchors.bottom: parent.bottom;anchors.bottomMargin: 10
        anchors.right:parent.right;anchors.rightMargin: 150
        radius: 10
        Text {
            id: nexttextid
            text: qsTr("Next")
            anchors.centerIn: parent
            font.bold: true
            font.pointSize: 15
            color:"white"
        }
        MouseArea{
            anchors.fill:parent
            onClicked: {
                tableModel2.nextPage();
                console.log("next clicked in system page :")
            }
        }
    }
}
