import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import com.ventilatorproject.tablemodel 1.0

Item {
    width: mainwindowid.width
    height: mainwindowid.height

    function fetchingdata(){
        // tableModel.fetchData();
    }

    TableModel {
        id: tableModel
    }

    TableView {
        id: tableView
        width: parent.width- 100
        height: parent.height/ 1.4
        clip: true // Clip content to ensure black background is visible
        x: 50
        y: 78
        // Set the model roles
        model: tableModel
        backgroundVisible: false
        style: TableViewStyle {
            backgroundColor: "black";
            rowDelegate: Row {
                id: rowDelegate2
                height: 65 // Set the desired row height
            }
        }

        TableViewColumn {
            role: "UserRole"
            title: "       Time Stamp"
            width: tableView.width * 0.4 // Set width as a percentage of TableView width
            delegate: Text {
                text: model ? model.timestamp : ""
                color: "white"
                font.pointSize: 12
            }
        }

        TableViewColumn {
            role: "parameterid"
            title: "Parameter ID"
            width: tableView.width * 0.3 // Set width as a percentage of TableView width
            delegate: Text {
                text: model ? model.parameterid : ""
                color: "white"
                font.pointSize: 12
            }
        }

        TableViewColumn {
            role: "parametervalue"
            title: "Parameter Value"
            width: tableView.width * 0.3 // Set width as a percentage of TableView width
            delegate: Text {
                text: model ? model.parametervalue : ""
                color: "white"
                font.pointSize: 12
            }
        }

        headerDelegate: Rectangle {
            y: 10
            width: tableView.width * 0.8
            height: tableView.height / 8
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
        //tableModel.fetchData();
    }
    onVisibleChanged: {
        // tableModel.fetchData();
    }
    Connections {
        target: tableModel

        function onDataChanged() {
            tableView.model = null;
            tableView.model = tableModel;
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
                tableModel.previousPage();
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
                tableModel.nextPage();
            }
        }
    }
}
