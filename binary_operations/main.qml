import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: windowid
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    color: "gray"

    property var output: null
    property var prevRadioButton: null
    Rectangle {
        id: binarynamerect
        width: bid.implicitWidth + 20
        height: bid.implicitHeight + 20
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        color: "gray"

        Text {
            anchors.centerIn: parent
            id: bid
            text: "Binary Operations"
            font.pointSize: windowid.width * 0.03
        }
    }

    Rectangle {
        id: iorect
        width: parent.width / 2
        height: parent.height / 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: binarynamerect.bottom
        anchors.topMargin: 10
        color: "lightblue"
        radius:15
        border.width:2
        border.color:"blue"

        Rectangle {
            id: textid2
            width: iorect.width / 3
            height: iorect.height * 0.1
            color: "#978cbd"
            border.width: 2
            border.color: "black"
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 40
            Text {
                id: textname
                text: "Input 1 :"
                anchors.centerIn: parent
                font.family: "Comic Sans MS"
                font.pointSize: iorect.width / 42
            }
        }
        TextField {
            id: firstinput
            anchors.left: parent.left
            anchors.leftMargin: 150
            anchors.top: parent.top
            anchors.topMargin: 40

            width: iorect.width / 2.5
            height: iorect.height * 0.1
            maximumLength: 15
            placeholderText: "Enter first binary"
            font.pointSize: iorect.width / 42
            validator: RegExpValidator { regExp: /^[01]*$/ }
        }

        Rectangle {
            id: textid22
            width: iorect.width / 3
            height: iorect.height * 0.1
            color: "#978cbd"
            border.width: 2
            border.color: "black"
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 100
            Text {
                id: textname2
                text: "Input 2 :"
                anchors.centerIn: parent
                font.family: "Comic Sans MS"
                font.pointSize: iorect.width / 42
            }
        }
        TextField {
            id: second
            anchors.left: parent.left
            anchors.leftMargin: 150
            anchors.top: parent.top
            anchors.topMargin: 100
            width: iorect.width / 2.5
            height: iorect.height * 0.1
            maximumLength: 15
            placeholderText: "Enter second binary"
            font.pointSize: iorect.width / 42
            validator: RegExpValidator { regExp: /^[01]*$/ }
        }

        Rectangle {
            id: textid24
            width: iorect.width / 3
            height: iorect.height * 0.1
            color: "#978cbd"
            border.width: 2
            border.color: "black"
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 180
            Text {
                id: textipname
                text: "Output :"
                anchors.centerIn: parent
                font.family: "Comic Sans MS"
                font.pointSize: iorect.width / 42
            }
        }
        Rectangle {
            width: iorect.width / 2.5
            height: iorect.height * 0.1

            border.width: 2
            border.color: "black"
            anchors.left: parent.left
            anchors.leftMargin: 150
            anchors.top: parent.top
            anchors.topMargin: 180
            Text {
                id: outputtf
                anchors.centerIn: parent
                text: windowid.output
                font.pointSize: iorect.width / 42
            }
        }
    }

    Rectangle {
        id: radiobuttonrect1
        width: parent.width / 2
        height: parent.height / 10
        anchors.left: parent.left
        anchors.leftMargin: parent.width / 3.8
        anchors.top: iorect.bottom
        anchors.topMargin: 5
        color: "transparent"
        Row {
            spacing: 10

            RadioButton {
                id:andid
                text: "AND"
                onClicked: {
                    uncheckPreviousRadioButton()
                    windowid.prevRadioButton = this
                }
            }
            RadioButton {
                id:orid
                text: "OR"
                onClicked: {
                    uncheckPreviousRadioButton()
                    windowid.prevRadioButton = this
                }
            }
            RadioButton {
                id:notid
                text: "NOT"
                onClicked: {
                    uncheckPreviousRadioButton()
                    windowid.prevRadioButton = this
                }
            }
            RadioButton {
                id:xorid
                text: "XOR"
                onClicked: {
                    uncheckPreviousRadioButton()
                    windowid.prevRadioButton = this
                }
            }
        }
    }

    Rectangle {
        id: radiobuttonrect2
        width: parent.width / 2
        height: parent.height / 10
        anchors.left: parent.left
        anchors.leftMargin: parent.width / 3.5
        anchors.top: radiobuttonrect1.bottom

        color: "transparent"
        Row {
            spacing: 10

            RadioButton {
                id:xnorid
                text: "XNOR"
                onClicked: {
                    uncheckPreviousRadioButton()
                    windowid.prevRadioButton = this
                }
            }
            RadioButton {
                id:leftshiftid
                text: "LeftShift"
                onClicked: {
                    uncheckPreviousRadioButton()
                    windowid.prevRadioButton = this
                }
            }
            RadioButton {
                id:rightshiftid
                text: "RightShift"
                onClicked: {
                    uncheckPreviousRadioButton()
                    windowid.prevRadioButton = this
                }
            }
        }
    }

    Rectangle {
        id: clearrect
        width: parent.width / 8
        height: parent.height / 10
        anchors.left: parent.left
        anchors.leftMargin: parent.width / 4
        anchors.top: radiobuttonrect2.bottom
        anchors.topMargin: 10
        color: "#978cbd"
        radius: 10
        border.width: 2
        border.color: "black"
        Text {
            id: cleartextid
            anchors.centerIn: parent
            text: "Clear"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                firstinput.text = ""
                second.text = ""
                windowid.output = null
                uncheckAllRadioButtons()
                uncheckPreviousRadioButton()
            }
        }
    }

    Rectangle {
        id: okrect
        width: parent.width / 8
        height: parent.height / 10
        anchors.right: parent.right
        anchors.rightMargin: parent.width / 4
        anchors.top: radiobuttonrect2.bottom
        anchors.topMargin: 10
        color: "green"
        radius: 10
        border.width: 2
        border.color: "black"
        Text {
            id: oktextid
            anchors.centerIn: parent
            text: "OK"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {

                windowid.output = performOperation(firstinput.text, second.text, getSelectedOperation())
                uncheckAllRadioButtons()
            }
        }
    }

    // Function to perform the selected operation
    function performOperation(input1, input2, operation) {
        var result = 0;

        // Convert binary strings to numbers
        var num1 = parseInt(input1, 2);
        var num2 = parseInt(input2, 2);

        // Perform the operation based on the selected radio button
        switch (operation) {
            case "AND":
                result = num1 & num2;
                break;
            case "OR":
                result = num1 | num2;
                break;
            case "NOT":
                 result = (~num1) & ((1 << input1.length) - 1);
                break;
            case "XOR":
                result = num1 ^ num2;
                break;
            case "XNOR":
                result = ~(num1 ^ num2);
                result = result & ((1 << Math.max(input1.length, input2.length)) - 1);
                break;
            case "LeftShift":
                result = num1 << num2;
                break;
            case "RightShift":
                result = num1 >> num2;
                break;
            default:
                console.log("Invalid operation");
        }
        var binaryResult = result.toString(2);
        while (binaryResult.length < Math.max(input1.length, input2.length)) {
            binaryResult = "0" + binaryResult;
        }
        return binaryResult;
    }



    function getSelectedOperation() {

        if(andid.checked===true){
            return "AND"
        }
        else if(orid.checked===true){
            return "OR"
        }
       else if(notid.checked===true){
            return "NOT"
        }
       else if(xorid.checked===true){
            return "XOR"
        }
       else if(xnorid.checked===true){
            return "XNOR"
        }
       else if(leftshiftid.checked===true){
            return "LeftShift"
        }
        else if(rightshiftid.checked===true){
            return "RightShift"
        }
        else return ""


    }



    // Function to uncheck all radio buttons
    function uncheckAllRadioButtons() {
        for (var i = 0; i < radiobuttonrect1.children.length; i++) {
            var item = radiobuttonrect1.children[i];
            if (item.checked)
                item.checked = false;
        }

        for (var j = 0; j < radiobuttonrect2.children.length; j++) {
            var item1 = radiobuttonrect2.children[j];
            if (item1.checked)
                item1.checked = false;
        }
    }
    // Function to uncheck the previously checked radio button
    function uncheckPreviousRadioButton() {
        if (windowid.prevRadioButton)
            windowid.prevRadioButton.checked = false;
    }
}


