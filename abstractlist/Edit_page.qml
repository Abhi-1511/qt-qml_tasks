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
            }
        }
    }



    TableView {
        id: tableView
        height: parent.height * 0.7
        width: parent.width
        anchors.top: parent.top
        model: detailsModel

        TableViewColumn {
            role: "name"
            title: "Name"
            delegate: Text {
                text: model.name // Access role directly
            }
        }

        TableViewColumn {
            role: "password"
            title: "Password"
            delegate: TextField {
                text: model.password // Access role directly
                onTextChanged: {
                    // Update the corresponding value in the model
                    detailsModel.setProperty(styleData.row, "password", text);
                }
            }
        }

        TableViewColumn {
            role: "passwordc"
            title: "Password Confirmation"
            delegate: TextField {
                text: model.passwordc // Access role directly
                onTextChanged: {
                    // Update the corresponding value in the model
                    if (text !== model.passwordc) {
                        detailsModel.setProperty(styleData.row, "passwordc", text);
                    }                }
            }
        }

        TableViewColumn {
            role: "agess"
            title: "Age"
            delegate: TextField {
                text: model.agess // Access role directly
                onTextChanged: {
                    // Update the corresponding value in the model
                    detailsModel.setProperty(styleData.row, "agess", text);
                }
            }
        }

        TableViewColumn {
            role: "gender"
            title: "Gender"
            delegate: TextField {
                id:t1g
                text: model.gender // Access role directly
                onTextChanged: {
                    // Update the corresponding value in the model
                    detailsModel.setProperty(styleData.row, "gender", t1g.text);
                }
            }
        }
    }

    ListModel {
        id: detailsModel
    }
    Rectangle {
        width: parent.width / 4
        height: parent.height / 10
        color: "green"
        anchors.bottom: parent.bottom;anchors.bottomMargin: parent.height * 0.05
        anchors.horizontalCenter: parent.horizontalCenter
        border.width: 2
        border.color: "black"
        radius: 5

        Text {
            id: oktext2
            text: qsTr("OK")
            anchors.centerIn: parent
            font.pointSize: parent.width * 0.1
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                var data = []
                for (var i = 0; i < detailsModel.count; ++i) {
                    var row = {}
                    row.name = detailsModel.get(i).name
                    row.password = detailsModel.get(i).password
                    row.passwordc = detailsModel.get(i).passwordc
                    row.agess = detailsModel.get(i).agess
                    row.gender = detailsModel.get(i).gender
                    data.push(row)
                }
                backend.updateDataFromModel(data)
                console.log("onclicked o in edit_page ")
                crudscreenid.visible = true
                crudscreenid.enabled = true
                editpageid.visible = false
                editpageid.enabled = false
            }
        }
    }
}
