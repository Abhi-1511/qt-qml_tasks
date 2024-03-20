import QtQuick 2.15
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick 2.0

CircularGauge {
    id:mainid1
    visible:true
    property int gaugeWidth: 200
    property int minimumvalue:0
    property int maximumvalue:0
    property var strokecolor:"green"
    property var startangledim:0
    property var endangledim:0
    property alias maincanvasid:mainCanvas
    property var labelcolor:"green"
    property int maximumvalueangle:0
    property int minimumvalueangle:0
    property int labelstepsize:0
    property int tickmarkstepsize:0
    property int minortickmarkcount:0
    property bool flagdirection:false
    property int bordervalue: 5
    property int angleval:0
    property var end:0
    width:  gaugeWidth
    height:  gaugeWidth
    maximumValue: maximumvalue
    minimumValue: minimumvalue

    style: CircularGaugeStyle {
        maximumValueAngle:maximumvalueangle
        minimumValueAngle: minimumvalueangle

        tickmarkInset: 4
        labelStepSize : labelstepsize
        tickmarkStepSize:tickmarkstepsize
        minorTickmarkInset: 4
        minorTickmarkCount:minortickmarkcount
        tickmark: Rectangle {
            implicitWidth : outerRadius*0.01
            implicitHeight: outerRadius*0.05
            color: "white"
            antialiasing:true
        }
        minorTickmark: Rectangle {
            implicitWidth : outerRadius*0.01
            implicitHeight: outerRadius*0.02
            color: "white"
            antialiasing:true
        }
        needle: null

        tickmarkLabel: Text {
            text:""
            color: labelcolor
        }

        foreground: null

    }
    Canvas {
        id: mainCanvas
        anchors.fill: parent
        z: -1
        onPaint: {
            var ctx = getContext("2d");
            ctx.clearRect(0, 0, width, height);
            ctx.reset();
            //background
            ctx.fillStyle = "transparent";
            var startAngle = startangledim;
            var endAngle = endangledim;
            var radius = Math.min(width, height) / 2 -10;
            var centerX = width / 2;
            var centerY = height / 2;
            ctx.beginPath();
            ctx.moveTo(centerX, centerY); // Move to center
            ctx.arc(centerX, centerY, radius+5, startAngle, 360, flagdirection); // Draw arc
            ctx.closePath();
            ctx.fill();
            ctx.strokeStyle = "gray";
            ctx.lineCap = "round";
            ctx.lineWidth = 10;
            ctx.beginPath();
            ctx.arc(centerX, centerY, radius, startAngle, end, flagdirection);

            ctx.stroke();
            // Draw arc
            ctx.strokeStyle = strokecolor;
            ctx.lineWidth = 10;
            ctx.lineCap = "round";
            ctx.beginPath();
            ctx.arc(centerX, centerY, radius, startAngle, endAngle, flagdirection);

            ctx.stroke();
        }
    }

}




