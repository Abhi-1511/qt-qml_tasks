import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls 1.4

Item {
    width: windowid.width * 0.8
    height: windowid.height * 0.8
    anchors.centerIn: parent

    // Import the backend
    Connections {
        target: backend
        function onRowsFetched(rows) {
            detailsModel.clear(); // Clear the model before adding new data
            for (var i = 0; i < rows.length; ++i) {
                detailsModel.append(rows[i]); // Add fetched rows to the model
                console.log(rows[i])
            }
        }
    }
    Rectangle{
        width:parent.width/4
        height:parent.height/10
        color:"green"
        anchors.bottom:parent.bottom;anchors.bottomMargin: parent.height*0.05
        anchors.horizontalCenter: parent.horizontalCenter
        border.width:2
        border.color:"black"
        radius:5
        focus:true

        Text {
            id: oktext2
            text: qsTr("OK")
            anchors.centerIn: parent
            font.pointSize: parent.width * 0.1
            color:"white"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                crudscreenid.visible=true
                crudscreenid.enabled=true
                viewpageid.visible=false
                viewpageid.enabled=false
            }
        }
    }
    TableView {
        id: tableView
        height:parent.height*0.8
        width:parent.width
        anchors.top:parent.top
        model: detailsModel

        TableViewColumn {
            role: "name" // Assuming "name" is a role in your model
            title: "Name"
        }

        TableViewColumn {
            role: "password" // Assuming "password" is a role in your model
            title: "Password"
        }

        TableViewColumn {
            role: "passwordc" // Assuming "passwordc" is a role in your model
            title: "Password Confirmation"
        }

        TableViewColumn {
            role: "agess" // Assuming "agess" is a role in your model
            title: "Age"
        }

        TableViewColumn {
            role: "gender" // Assuming "gender" is a role in your model
            title: "Gender"
        }
    }

    ListModel {
        id: detailsModel
        // This model will be populated dynamically by the backend
    }
}
