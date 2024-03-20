import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick 2.0

Window {
    width: 840
    height: 420
    visible: true
    title: qsTr("Hello World")
    color:"gray"
    property bool flag1:true
    property bool flag2:true
    property bool flag3:true
    property bool flag4:true
    property bool flag5:true
    property bool flag6:true



    /////////////////left-top////////////////////////

    Custom_circulargauge {

        id:topleft
        gaugeWidth:200
        x:170
        y:40
        maximumvalue:10
        minimumvalue:0
        value: topleft.minimumvalue

        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: {
                if (topleft.value < topleft.maximumvalue&&flag1) {
                    topleft.value += 1;
                    if(topleft.value === topleft.maximumvalue){
                        flag1=false

                    }
                }else{
                    topleft.value -= 1;
                    if(topleft.value === 0){
                        flag1=true
                    }
                }
                topleft.maincanvasid.requestPaint()
            }
        }

        strokecolor: "green"
        startangledim:140*(Math.PI/180)
        endangledim:140*(Math.PI/180)+(topleft.value) * (Math.PI /10)
        maximumvalueangle:50
        minimumvalueangle: -130
         labelstepsize : 2
        tickmarkstepsize:2
        minortickmarkcount:1
    }


    /////////left-bottom////////////////////
    Custom_circulargauge{
        id:bottomleft
        gaugeWidth:200
        x:170
        y:200
        maximumvalue:140
        minimumvalue:40
        value: bottomleft.minimumvalue
        Timer {
            interval: 100 // Accelerate every second
            running: true
            repeat: true
            onTriggered: {
                if (bottomleft.value < bottomleft.maximumValue&&flag2) {
                    bottomleft.value += 1;
                    if(bottomleft.value === bottomleft.maximumValue){
                        flag2=false

                    }
                }else{
                    bottomleft.value -= 1;
                    if(bottomleft.value === 40){
                        flag2=true
                    }
                }
                bottomleft.maincanvasid.requestPaint();
            }
        }
        strokecolor: "green"
        startangledim: 80*(Math.PI/180)
        endangledim: 80*(Math.PI/180)+(bottomleft.value-40) * (Math.PI /105)
        maximumvalueangle:-20
        minimumvalueangle: -190
        labelstepsize : 20
        tickmarkstepsize:20
        minortickmarkcount:1
    }





    ////////////top-right
    Custom_circulargauge{
        id:topright
        gaugeWidth:200
        x:470
        y:40
        maximumvalue:32
        minimumvalue:8
        value: topright.minimumvalue
        Timer {
            interval: 100 // Accelerate every second
            running: true
            repeat: true
            onTriggered: {
                if (topright.value < topright.maximumValue&&flag3) {
                    topright.value += 1;
                    if(topright.value === topright.maximumValue){
                        flag3=false

                    }
                }else{
                    topright.value -= 1;
                    if(topright.value === 8){
                        flag3=true
                    }
                }
                topright.maincanvasid.requestPaint();
            }
        }
        strokecolor: "green"
        startangledim: 45*(Math.PI/180)
        endangledim: 45*(Math.PI/180)-(topright.value-8) * (Math.PI /23);
        maximumvalueangle:-50
        minimumvalueangle: 135
        labelstepsize : 4
        tickmarkstepsize:4
        minortickmarkcount:3
        flagdirection: true

    }






    //////////bottom-right
    Custom_circulargauge{
        id:bottomright
        gaugeWidth:200
        x:470
        y:200
        maximumvalue:100
        minimumvalue:0
        value: bottomright.minimumvalue
        Timer {
            interval: 100 // Accelerate every second
            running: true
            repeat: true
            onTriggered: {
                if (bottomright.value < bottomright.maximumValue&&flag4) {
                    bottomright.value += 1;
                    if(bottomright.value === bottomright.maximumValue){
                        flag4=false

                    }
                }else{
                    bottomright.value -= 1;
                    if(bottomright.value === 0){
                        flag4=true
                    }
                }
                bottomright.maincanvasid.requestPaint();
            }
        }
        strokecolor :"green"
        startangledim :110*(Math.PI/180);
        endangledim :110*(Math.PI/180)-(bottomright.value) * (Math.PI /90);
            maximumvalueangle:0
            minimumvalueangle:200
            tickmarkstepsize:25
            minortickmarkcount:1
            labelstepsize : 25
            flagdirection: true
    }






    ////////middle
    Custom_circulargauge{
        id: middle
        gaugeWidth: 280
        x: 420 - 150
        y: 210 - 110
        minimumValue: 0
        maximumValue: 140
        value: middle.minimumValue

        Timer {
            interval: 100 // Accelerate every second
            running: true
            repeat: true
            onTriggered: {
                if (middle.value < middle.maximumValue && flag5) {
                    middle.value += 1;
                    if (middle.value === middle.maximumValue) {
                        flag5 = false
                    }
                } else {
                    middle.value -= 1;
                    if (middle.value === 0) {
                        flag5 = true
                    }
                }
                midcanva.requestPaint();
            }
        }

        Canvas {
            id:midcanva
            anchors.fill: parent
            z:-1
            onPaint: {
                var ctx = getContext("2d");
                ctx.clearRect(0, 0, width, height);
                ctx.reset();
                ctx.fillStyle = "white";
                var startAnglea = 0
                var radiusa = Math.min(width, height) / 2 -10;
                var centerXa = width / 2;
                var centerYa = height / 2;
                ctx.beginPath();
                ctx.moveTo(centerXa, centerYa); // Move to center
                ctx.arc(centerXa, centerYa, radiusa+5, startAnglea, 360); // Draw arc
                ctx.closePath();
                ctx.fill();

                // Draw red arc
                ctx.strokeStyle = "red";
                ctx.lineWidth = 15;
                ctx.beginPath();
                var startAngle = 140 * (Math.PI / 180);
                var endAngle = 140 * (Math.PI / 180) + (middle.value) * (Math.PI / 97);
                ctx.arc(width / 2, height / 2, Math.min(width, height) / 2 - 25, startAngle, endAngle);
                ctx.stroke();
                //gray line
                ctx.strokeStyle = "gray";
                ctx.lineWidth = 15;
                ctx.beginPath();

                ctx.arc(width / 2, height / 2, Math.min(width, height) / 2-10 , 0, 360);
                ctx.stroke();

                // Calculate triangle position
                var centerX = width / 2;
                var centerY = height / 2;
                var radius = Math.min(width, height) / 2 - 20;
                var angle = 140 * (Math.PI / 180) + (middle.value) * (Math.PI / 97);
                var triangleHeight = 50;
                var triangleBase = 60;
                var triangleX = centerX + radius * Math.cos(angle);
                var triangleY = centerY + radius * Math.sin(angle);
                var triangleAngle = Math.atan(triangleHeight / (triangleBase / 2));

                // Draw triangle
                ctx.fillStyle = "red";
                ctx.beginPath();
                ctx.moveTo(triangleX, triangleY);
                ctx.lineTo(triangleX + triangleBase / 2 * Math.cos(angle + triangleAngle), triangleY + triangleBase / 2 * Math.sin(angle + triangleAngle));
                ctx.lineTo(triangleX + triangleBase / 2 * Math.cos(angle - triangleAngle), triangleY + triangleBase / 2 * Math.sin(angle - triangleAngle));
                ctx.closePath();
                ctx.fill();
            }
        }
        Rectangle {
            width: parent.width / 8
            height: parent.height / 8
            anchors.centerIn: parent
        }

        style: CircularGaugeStyle {
            maximumValueAngle: 130
            minimumValueAngle: -130
            labelStepSize: 20
            tickmarkInset: 18
            tickmarkStepSize: 20
            minorTickmarkInset: 18
            minorTickmarkCount: 3
            labelInset: 40

            tickmark: Rectangle {
                implicitWidth: outerRadius * 0.02
                implicitHeight: outerRadius * 0.1
                color: "black"
                antialiasing: true
            }
            minorTickmark: Rectangle {
                implicitWidth: outerRadius * 0.02
                implicitHeight: outerRadius * 0.05
                color: "black"
                antialiasing: true
            }
            tickmarkLabel: Text {
                text: styleData.value
                color: "red"
            }
            needle: Rectangle {
                visible: false
            }
            background: Rectangle {
                width: parent.width+2
                height: parent.height+2
                radius: parent.height+2 / 2
                anchors.fill: parent
                color: "transparent"
                border.color: "black"
                border.width: 3
            }
        }
    }
    //////////innermost
    Custom_circulargauge {
        id: innermost
        gaugeWidth: 150
        x: 340
        y: 170
        minimumvalue: 0
        maximumvalue: 30
        value: innermost.minimumValue
        Timer {
            interval: 100
            running: true
            repeat: true
            onTriggered: {
                if (innermost.value < innermost.maximumValue&&flag6) {
                    innermost.value += 1;
                    if(innermost.value === innermost.maximumValue){
                        flag6=false
                    }
                }else{
                    innermost.value -= 1;
                    if(innermost.value === 0){
                        flag6=true
                    }
                }
                innermost.maincanvasid.requestPaint();
            }
        }
        strokecolor :"green"
        startangledim :140*(Math.PI/180)
        endangledim :140*(Math.PI/180)+(innermost.value) * (Math.PI /21);
        maximumvalueangle:130
        minimumvalueangle:-130
        tickmarkstepsize:5
        minortickmarkcount:4
        labelstepsize : 5
        bordervalue:0
    }
    Text {
        id: topleftvalueid
        text: topleft.value+" BAR"
        x:263
        y:150
    }
    Text {
        id: bottomleftvalueid
        text:bottomleft.value+" C"
        x:270
        y:320
    }
    Text {
        id: toprightvalueid
        text:topright.value+" V"
        x:550
        y:150
    }
    Text {
        id: bottomrightvalueid
        text:bottomright.value+" F"
        x:545
        y:320
    }
    Text {
        id: middlevalueid
        text:middle.value+" KMPH"
        x:355
        y:320
        font.pointSize: 15
    }
    Text {
        id: innermostvalueid
        text:innermost.value
        x:410
        y:250
    }
    Image {
        source: "file:///C:/Users/Abhi/Desktop/fuel.jpg"
        width: 20
        height: 20
        x:540
        y:300
    }
    Image {
        source: "file:///C:/Users/Abhi/Desktop/temp.jpg"
        width: 20
        height: 20
        x:268
        y:340
    }
    Image {
        source: "file:///C:/Users/Abhi/Desktop/volt.png"
        width: 20
        height: 20
        x:548
        y:170
    }
    Image {
        source: "file:///C:/Users/Abhi/Desktop/presure.jpg"
        width: 20
        height: 20
        x:260
        y:170
    }
    Image {
        source: "file:///C:/Users/Abhi/Desktop/speed.png"
        width: 40
        height: 40
        x:390
        y:270
    }

}
