import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls 1.4

ApplicationWindow {
    width: 800
    height: 600
    visible: true

    TableView {
        id: tableView
        width: parent.width
        height: parent.height

        // Set the model roles
        model: tableModel

        TableViewColumn {
            role: "UserRole"
            title: "Name"
            delegate: TextInput {
                id:nametext
                text: model.name
                onEditingFinished: {
                    tableModel.setData(tableView.model.index(model.row, model.column), text, 0)
                }
            }
        }

        TableViewColumn {
            role: "password"
            title: "Password"
            delegate: TextInput {
                text: model.password
                onEditingFinished: {
                    tableModel.setData(tableView.model.index(model.row, model.column), text, 1)
                }
            }
        }

        TableViewColumn {
            role: "passwordc"
            title: "Password Confirmation"
            delegate: TextInput {
                text: model.passwordc
                onEditingFinished: {
                    tableModel.setData(tableView.model.index(model.row, model.column), text,2)
                }
            }
        }

        TableViewColumn {
            role: "agess"
            title: "Age"
            delegate: TextInput {
                text: model.agess
                onEditingFinished: {
                    tableModel.setData(tableView.model.index(model.row, model.column), text,3)
                }
            }
        }

        TableViewColumn {
            role: "gender"
            title: "Gender"
            delegate: TextInput {
                text: model.gender
                onEditingFinished: {
                    tableModel.setData(tableView.model.index(model.row, model.column), text,4)
                }
            }
        }
    }
}
