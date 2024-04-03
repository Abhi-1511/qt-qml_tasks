import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.12
import QtQuick.Controls 1.4
import QtQuick 2.2
 import QtQuick 2.0

Item {
    width: mainwindowid.width / 2
    height: mainwindowid.height / 5
    anchors.centerIn: parent
    property int waittime: 3
    signal gotoreleasepage()



    property real xOffset: 0 // Property to control horizontal offset of the wave

        Canvas {
            id: canvas
            anchors.fill: parent

            onPaint: {
                var ctx = getContext("2d");
                ctx.clearRect(0, 0, canvas.width, canvas.height); // Clear canvas

                ctx.strokeStyle = "blue"; // Set line color to blue
                ctx.lineWidth = 2;

                ctx.beginPath();
                var xStart = 0;
                var yStart = canvas.height / 2; // Start drawing from the middle of the canvas
                ctx.moveTo(xStart, yStart);

                // Plot points along the sine function curve with horizontal offset
                for (var x = 0; x < canvas.width; x += 5) {
                    var y = Math.sin((x + xOffset) * Math.PI / 180) * 50 + yStart; // Adjust amplitude and frequency as needed
                    ctx.lineTo(x, y);
                }

                ctx.stroke();
            }
        }

        // Timer to update horizontal offset and trigger repaint
        Timer {
            interval: 20 // Update interval in milliseconds (adjust for desired speed)
            running: true
            repeat: true

            onTriggered: {
                // Update horizontal offset
                xOffset += 2; // Adjust speed as needed

                // Wrap the wave back to the beginning when it reaches the end
                if (xOffset >= 360) {
                    xOffset = 0;
                }

                // Trigger canvas repaint
                canvas.requestPaint();
            }
        }
}
