import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick 2.0

Window {
    id:mainid
    width: 840
    height: 420
    visible: true
    title: qsTr("Hello World")

    property bool flag1:true
    property bool flag2:true
    property bool flag3:true
    property bool flag4:true
    property bool flag5:true
    property bool flag6:true

    Display{
        id:dispid
    }


    signal gotodetailspage()
    onGotodetailspage: {
        rectcomponent.visible=false;
        dispid.visible=true;
    }

   signal info(string l1,string l2,string r1,string r2 )
    onInfo: {
        dispid.g(l1,l2,r1,r2)

    }


    /////////////////left-top////////////////////////
    Rectangle{
        id:rectcomponent
        visible:true
        width:parent.width
        height:parent.height
        color:"#2f3275"
        Custom{

            id:topleft
            gaugeWidth:320
            x:60
            y:30
            maximumvalue:10
            minimumvalue:0
            value: topleft.minimumvalue
            end:4.014257279586958

            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: {
                    if (topleft.value < topleft.maximumvalue&&flag1) {
                        topleft.value += 2.5;
                        if(topleft.value === topleft.maximumvalue){
                            flag1=false

                        }
                    }else{
                        topleft.value -= 2.5;
                        if(topleft.value === 0){
                            flag1=true
                        }
                    }
                    topleft.maincanvasid.requestPaint()
                }
            }

            strokecolor: "lightblue"
            startangledim:130*(Math.PI/180)
            endangledim:130*(Math.PI/180)+(topleft.value) * (Math.PI /18)
            maximumvalueangle:-40
            minimumvalueangle: -140
            labelstepsize : 1
            tickmarkstepsize:5
            minortickmarkcount:1
        }
        Custom{

            id:innerleft
            gaugeWidth:200
            x:100
            y:90
            maximumvalue:10
            minimumvalue:0
            value: innerleft.minimumvalue
            end: 4.014257279586958

            Timer {
                interval: 500
                running: true
                repeat: true
                onTriggered: {
                    if (innerleft.value < innerleft.maximumvalue&&flag2) {
                        innerleft.value += 2.5;
                        if(innerleft.value === innerleft.maximumvalue){
                            flag2=false

                        }
                    }else{
                        innerleft.value -= 2.5;
                        if(innerleft.value === 0){
                            flag2=true
                        }
                    }
                    innerleft.maincanvasid.requestPaint()
                }
            }

            strokecolor: "red"
            startangledim:130*(Math.PI/180)
            endangledim:130*(Math.PI/180)+(innerleft.value) * (Math.PI /18)
            maximumvalueangle:-40
            minimumvalueangle: -140
            labelstepsize : 1
            tickmarkstepsize:5
            minortickmarkcount:1
        }
        Custom{

            id:topright
            gaugeWidth:320
            x:450
            y:30
            maximumvalue:10
            minimumvalue:0
            value: topright.minimumvalue
            end: -0.8726646259971648

            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: {
                    if (topright.value < topright.maximumvalue&&flag3) {
                        topright.value += 2.5;
                        if(topright.value === topright.maximumvalue){
                            flag3=false

                        }
                    }else{
                        topright.value -= 2.5;
                        if(topright.value === 0){
                            flag3=true
                        }
                    }
                    topright.maincanvasid.requestPaint()
                }
            }

            strokecolor: "lightblue"
            startangledim :50*(Math.PI/180);
            endangledim :50*(Math.PI/180)-(topright.value) * (Math.PI /18);
            maximumvalueangle:40
            minimumvalueangle: 140
            labelstepsize : 1
            tickmarkstepsize:5
            minortickmarkcount:1
            flagdirection:true
        }
        Custom{

            id:innerright
            gaugeWidth:200
            x:530
            y:90
            maximumvalue:10
            minimumvalue:0
            value: innerright.minimumvalue
            end: -0.8726646259971648

            Timer {
                interval: 2000
                running: true
                repeat: true
                onTriggered: {
                    if (innerright.value < innerright.maximumvalue&&flag4) {
                        innerright.value += 2.5;
                        if(innerright.value === innerright.maximumvalue){
                            flag4=false

                        }
                    }else{
                        innerright.value -= 2.5;
                        if(innerright.value === 0){
                            flag4=true
                        }
                    }
                    innerright.maincanvasid.requestPaint()
                }
            }

            strokecolor: "red"
            startangledim :50*(Math.PI/180);
            endangledim :50*(Math.PI/180)-(innerright.value) * (Math.PI /18);
            maximumvalueangle:40
            minimumvalueangle: 140
            labelstepsize : 1
            tickmarkstepsize:5
            minortickmarkcount:1
            flagdirection:true

        }

        Custom{
            id: middle
            gaugeWidth: 350
            x: 240
            y: 50
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
                    ctx.fillStyle = "transparent";
                    var startAnglea = 0
                    var radiusa = Math.min(width, height) / 2 -10;
                    var centerXa = width / 2;
                    var centerYa = height / 2;
                    ctx.beginPath();
                    ctx.moveTo(centerXa, centerYa); // Move to center
                    ctx.arc(centerXa, centerYa, radiusa+5, startAnglea, 360); // Draw arc
                    ctx.closePath();
                    ctx.fill();
                    //white baseline
                    var gradient = ctx.createLinearGradient(0, 0, width, 0);
                    gradient.addColorStop(0, "black");
                    gradient.addColorStop(0.5, "white");
                    gradient.addColorStop(1, "black");
                    ctx.strokeStyle = gradient;
                    ctx.lineWidth = 5;
                    ctx.beginPath();
                    ctx.moveTo(50, height / 2);
                    ctx.lineTo(width-50, height / 2);
                    ctx.stroke();
                    //innergrayline
                    ctx.strokeStyle = "gray";
                    ctx.lineWidth = 10;
                    ctx.beginPath();
                    var startAngle = 140 * (Math.PI / 180);
                    ctx.lineCap="round"
                    ctx.arc(width / 2, height / 2, Math.min(width, height) / 2 - 25, startAngle, 6.977718390962897);
                    ctx.stroke();

                    // Draw red arc
                    ctx.strokeStyle = "lightblue";
                    ctx.lineWidth = 10;
                    ctx.beginPath();
                    ctx.lineCap="round"
                    var endAngle = 140 * (Math.PI / 180) + (middle.value) * (Math.PI / 97);
                    ctx.arc(width / 2, height / 2, Math.min(width, height) / 2 - 25, startAngle, endAngle);
                    ctx.stroke();
                    //gray line
                    ctx.strokeStyle = "white";
                    ctx.lineWidth = 5;
                    ctx.beginPath();
                    ctx.arc(width / 2, height / 2, Math.min(width, height) / 2-5 ,2.3, 7.1);
                    ctx.stroke();

                    //red line
                    ctx.strokeStyle = "red";
                    ctx.lineWidth = 4;
                    ctx.beginPath();
                    ctx.arc(width / 2, height / 2, Math.min(width, height) / 2-12 ,2.3, 7.1);
                    ctx.stroke();
                }
            }
            Rectangle {
                width: parent.width / 8
                height: parent.height / 8
                anchors.centerIn: parent
                color:"#2f3275"
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
                    implicitWidth: outerRadius * 0.01
                    implicitHeight: outerRadius * 0.05
                    color: "white"
                    antialiasing: true
                }
                minorTickmark: Rectangle {
                    implicitWidth: outerRadius * 0.01
                    implicitHeight: outerRadius * 0.02
                    color: "white"
                    antialiasing: true
                }
                tickmarkLabel: Text {
                    text: styleData.value
                    color: "red"
                }
                needle: Rectangle {
                    visible: false
                }
                // background: Rectangle {
                //     width: parent.width+2
                //     height: parent.height+2
                //     radius: parent.height+2 / 2
                //     anchors.fill: parent
                //     color: "transparent"
                //     border.color: "black"
                //     border.width: 3
                // }
            }
        }
        Image {
            source: "file:///C:/Users/Abhi/Desktop/fuel.jpg"
            width: 20
            height: 20
            x:640
            y:300
        }
        Image {
            source: "file:///C:/Users/Abhi/Desktop/fuel.jpg"
            width: 20
            height: 20
            x:640
            y:50
        }
        Text {
            id: bottomleftvalueid3
            text:"F"
            x:680
            y:50
            color:"white"
        }
        Image {
            source: "file:///C:/Users/Abhi/Desktop/temp.jpg"
            width: 20
            height: 20
            x:150
            y:300
        }
        Text {
            id: bottomleftvalueid4
            text:"E"
            x:680
            y:300
            color:"white"
        }
        Text {
            id: topleftvalueid
            text: innerleft.value
            x:150
            y:100
            color:"white"
        }
        Text {
            id: bottomleftvalueid
            text:"C"
            x:135
            y:300
            color:"white"
        }
        Text {
            id: innermostvalueid
            text:topleft.value
            x:150
            y:280
            color:"white"
        }
        Text {
            id: bottomleftvalueid2
            text:"H"
            x:135
            y:50
            color:"white"
        }
        Text {
            id: toprightvalueid
            text:topright.value
            x:650
            y:100
            color:"white"
        }
        Text {
            id: toprightvalueid2
            text:innerright.value
            x:650
            y:280
            color:"white"
        }
        Text {
            id: middlevalueid
            text:"KMPH \n"+"  "+middle.value
            x:370
            y:140
            font.pointSize: 25
        }
        Text {
            id: middlevalueid2
            text:"RPM \n"+middle.value*15
            x:375
            y:230
            font.pointSize: 25
        }
        Rectangle{
            width:parent.width/8
            height:parent.height/10
            color:"green"
            anchors.right:parent.right;anchors.rightMargin: 20
            anchors.bottom: parent.bottom;anchors.bottomMargin: 20
            Text {
                anchors.centerIn: parent
                id: submittext
                text: qsTr("Next")
                color:"white"
                font.pointSize: 20
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    gotodetailspage()
                    info(topleft.value,innerleft.value,topright.value,innerright.value)
                }
            }
        }

    }

}
