import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls 1.4

Item {
    width: 800
    height: 600

    TableView {
            id: tableView
            width: parent.width
            height: parent.height

            // Set the model roles
            model: customModel

            // Define TableViewColumn for each column
            TableViewColumn {
                role: "userRole" // Assuming "name" is a role provided by your CustomModel
                title: "Name"
            }

            TableViewColumn {
                role: "password" // Assuming "password" is a role provided by your CustomModel
                title: "Password"
            }

            TableViewColumn {
                role: "passwordc" // Assuming "passwordc" is a role provided by your CustomModel
                title: "Password Confirmation"
            }

            TableViewColumn {
                role: "agess" // Assuming "agess" is a role provided by your CustomModel
                title: "Age"
            }

            TableViewColumn {
                role: "gender" // Assuming "gender" is a role provided by your CustomModel
                title: "Gender"
            }
        }
}
