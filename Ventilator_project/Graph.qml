import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.12
import QtQuick.Controls 1.4
import QtQuick 2.2


Item {
    id:itemid
    width: mainwindowid.width
    height: mainwindowid.height
    anchors.bottom: parent.bottom
    property real xOffset: 0
    signal gotovaluepagefromgraph(int a)

    function getvaluesfromopenscreen(peekpval,brateval,spontbrval,tvieval,insptval,ieval,xyz,mvval,abc){
       peekpmvalue.text=peekpval;breathmvalue.text=brateval;spontbrvalue.text=spontbrval;tviepmvalue.text=tvieval;insptvalue.text=insptval;ievalue.text=ieval;pmvalue.text=mvval;
    }

    Timer {
        interval: 20
        running: true
        repeat: true

        onTriggered: {
            xOffset += 2;
            if (xOffset >= 360) {
                xOffset = 0;
            }

            // Trigger canvas repaint
            canvas.requestPaint();
        }
    }


    Rectangle{
        width: parent.width
        height: parent.height*0.89
        anchors.bottom: parent.bottom
        color:"black"


        Text {
            anchors.bottom: parent.bottom;anchors.bottomMargin: 100
            anchors.left:parent.left;anchors.leftMargin: 55
            id: label1
            text: qsTr("Volume mL")
            rotation: -90
            color:"white"
        }
        Text {
            anchors.top: parent.top;anchors.topMargin: 200
            anchors.left:parent.left;anchors.leftMargin: 60
            id: label2
            text: qsTr("Flow LPM")
            rotation: -90
            color:"white"
        }
        Text {
            anchors.top: parent.top;anchors.topMargin: 100
            anchors.left:parent.left;anchors.leftMargin: 55
            id: label3
            text: qsTr("Press cmH2O")
            rotation: -90
            color:"white"
        }
    }
    Canvas {
        id: canvas
        anchors.left: parent.left
        anchors.leftMargin: 100 // Adjust as needed
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 70
        width: 600 // Width of the canvas
        height: parent.height * 0.75 // Match the height of the parent

        // Property to control horizontal offset of the wave

        onPaint: {
            var ctx = getContext("2d");
            ctx.clearRect(0, 0, canvas.width, canvas.height); // Clear canvas

            // Draw tick marks and labels
            ctx.strokeStyle = "white"; // Set line color to white
            ctx.lineWidth = 3;
            ctx.font = "12px Arial"; // Set font for labels
            ctx.fillStyle = "white"; // Set label color to white
            for (var i = 0; i <= 1000; i += 100) {
                var y = (1 - i / 1000) * canvas.height - 10;
                ctx.beginPath();
                ctx.moveTo(0, y);
                ctx.lineTo(10, y);
                ctx.stroke();

                // Add labels
                var labelText = (i / 100).toString(); // Calculate label text
                ctx.fillText(labelText, 15, y + 4); // Draw label
            }

            // Draw horizontal lines with gradient colors
            drawGradientLine(ctx, 250, canvas.width, "gray", "green");
            drawGradientLine(ctx, 100, canvas.width, "yellow", "yellowgreen", "orange");
            drawGradientLine(ctx, 370, canvas.width, "purple", "red", "lightblue");

            // Draw sine wave
            ctx.strokeStyle = "blue"; // Set line color to blue
            ctx.lineWidth = 5;
            ctx.beginPath();
            var yStart = canvas.height / 2; // Start drawing from the middle of the canvas
            ctx.moveTo(0, yStart);

            // Plot points along the sine function curve with horizontal offset
            for (var x = 0; x < canvas.width; x += 5) {
                var y1 = Math.sin((-x + xOffset) * Math.PI / 180) * 50 + yStart; // Adjust amplitude and frequency as needed
                ctx.lineTo(x, y1);
            }

            ctx.stroke();

            // Draw a vertical line at the beginning of the canvas
            ctx.beginPath();
            ctx.moveTo(0, 0);
            ctx.lineTo(0, canvas.height);
            ctx.stroke();
        }


        function drawGradientLine(ctx, y, length, ...colors) {
            var gradient = ctx.createLinearGradient(0, y, length, y);
            for (var i = 0; i < colors.length; i++) {
                gradient.addColorStop(i / (colors.length - 1), colors[i]);
            }
            ctx.fillStyle = gradient;
            ctx.fillRect(0, y, length, 1);
        }

    }





    Rectangle{
        width:parent.width/5
        height:parent.height*0.89
        color:"black"
        anchors.right:parent.right
        anchors.bottom: parent.bottom
        Rectangle{
            id:peakRect
            width:parent.width
            height:parent.height/5
            anchors.top:parent.top;anchors.topMargin: 10
            //color:"#89AAD3"
            RadialGradient {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#89AAD3" }
                    GradientStop { position: 0.4; color: "black" }
                }
            }
            Text {
                anchors.top: parent.top;anchors.topMargin: -6
                anchors.horizontalCenter: parent.horizontalCenter
                id: peekpmtext
                text: qsTr("Peek P.")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.05
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                id: peekpmvalue
                text: "0"
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.1
            }
            Text {
                anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                id: peekpmtype
                text: qsTr("cmH2O")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.03
            }
        }
        Rectangle{
            id:breathRect
            width:parent.width
            height:parent.height/5
            anchors.top:peakRect.bottom;anchors.topMargin: 5
            //color:"#89AAD3"
            RadialGradient {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#89AAD3" }
                    GradientStop { position: 0.4; color: "black" }
                }
            }
            Text {
                anchors.top: parent.top;anchors.topMargin: -6
                anchors.horizontalCenter: parent.horizontalCenter
                id: breathmtext
                text: qsTr("Breath Rate")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.05
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                id: breathmvalue
                text: "0"
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.1
            }
            Text {
                anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                id: breathmtype
                text: qsTr("per min")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.03
            }
        }
        Rectangle{
            id:tvieRect
            width:parent.width
            height:parent.height/5
            anchors.top:breathRect.bottom ;anchors.topMargin: 2

            RadialGradient {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#89AAD3" }
                    GradientStop { position: 0.4; color: "black" }
                }
            }
            Text {
                anchors.top: parent.top;anchors.topMargin: -6
                anchors.horizontalCenter: parent.horizontalCenter
                id: tviepmtext
                text: qsTr("TV(i/e)")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.05
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                id: tviepmvalue
                text: "0/0"
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.08
            }
            Text {
                anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                id: tviepmtype
                text: qsTr("mL")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.03
            }
        }
        Rectangle{
            id:pmRect
            width:parent.width/2
            height:parent.height/6
            anchors.top:tvieRect.bottom ;anchors.topMargin: 10

            RadialGradient {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#89AAD3" }
                    GradientStop { position: 0.4; color: "black" }
                }
            }
            Text {
                anchors.top: parent.top;anchors.topMargin: -6
                anchors.horizontalCenter: parent.horizontalCenter
                id: pmtext
                text: qsTr("MV")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.1
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                id: pmvalue
                text: "0"
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.2
            }
            Text {
                anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                id: pmtype
                text: qsTr("L")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.06
            }
        }
        Rectangle{
            id:insptRect
            width:parent.width/2
            height:parent.height/6
            anchors.top:tvieRect.bottom ;anchors.topMargin: 10
            anchors.right: parent.right

            RadialGradient {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#89AAD3" }
                    GradientStop { position: 0.4; color: "black" }
                }
            }
            Text {
                anchors.top: parent.top;anchors.topMargin: -6
                anchors.horizontalCenter: parent.horizontalCenter
                id: inspttext
                text: qsTr("Insp.T")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.1
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                id: insptvalue
                text: "0"
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.2
            }
            Text {
                anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                id: inspttype
                text: qsTr("sec")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.06
            }
        }
        Rectangle{
            id:ieRect
            width:parent.width/2
            height:parent.height/5
            anchors.bottom: parent.bottom

            RadialGradient {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#89AAD3" }
                    GradientStop { position: 0.4; color: "black" }
                }
            }
            Text {
                anchors.top: parent.top;anchors.topMargin: -6
                anchors.horizontalCenter: parent.horizontalCenter
                id: ietext
                text: qsTr("I:E")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.1
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                id: ievalue
                text: "1:1"
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.2
            }

        }
        Rectangle{
            id:spontbrRect
            width:parent.width/2
            height:parent.height/5
            anchors.bottom: parent.bottom
            anchors.right:parent.right
            RadialGradient {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#89AAD3" }
                    GradientStop { position: 0.4; color: "black" }
                }
            }
            Text {
                anchors.top: parent.top;anchors.topMargin: -6
                anchors.horizontalCenter: parent.horizontalCenter
                id: spontbrtext
                text: qsTr("Spont BR")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.1
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                id: spontbrvalue
                text: "0"
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.2
            }
            Text {
                anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                id: spontbrtype
                text: qsTr("%")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.06
            }
        }
    }
    Rectangle{
        anchors.bottom: parent.bottom;anchors.bottomMargin: 10
        anchors.left: parent.left;anchors.leftMargin: 150
        width:parent.width*0.2
        height:parent.height*0.06
        color:"lightblue"
        Text {
            id: graphset
            text: qsTr("Graph Settings")
            anchors.centerIn: parent
            font.pointSize:parent.width*0.05
            color:"black"
            font.bold: true
        }
        MouseArea{
            anchors.fill:parent
            onClicked: {
                graphid.visible=false
                graphid.enabled=false
                graphsettingspage.visible=true
                graphsettingspage.enabled=true
            }
        }
    }
    Text {
        id: pcvtext
        text: qsTr("PCV")
        font.bold:true
        font.pixelSize: 15
        color:"orange"
        anchors.bottom: parent.bottom;anchors.bottomMargin: 50
        anchors.left: parent.left;anchors.leftMargin: 410
    }
    Rectangle{
        anchors.bottom: parent.bottom;anchors.bottomMargin: 10
        anchors.left: parent.left;anchors.leftMargin: 500
        width:parent.width*0.2
        height:parent.height*0.06
        color:"lightblue"
        Text {
            id: ventilatorsettings
            text: qsTr("Ventilator Settings")
            anchors.centerIn: parent
            font.pointSize:parent.width*0.05
            color:"black"
            font.bold: true
        }
        MouseArea{
            anchors.fill:parent
            onClicked: {
                gotovaluepagefromgraph(1)
                graphid.opacity=0.9
            }
        }
    }
    Rectangle{
        anchors.bottom: parent.bottom;anchors.bottomMargin: 10
        anchors.left: parent.left;anchors.leftMargin:10
        width:parent.width*0.1
        height:parent.height*0.06
        color:"lightblue"
        Text {
            id: back
            text: qsTr("Back")
            anchors.centerIn: parent
            font.pointSize:parent.width*0.1
            color:"black"
            font.bold: true
        }
        MouseArea{
            anchors.fill:parent
            onClicked: {
                graphid.visible=false
                graphid.enabled=false
                openscreenid.visible=true
                openscreenid.enabled=true
            }
        }
    }

}
