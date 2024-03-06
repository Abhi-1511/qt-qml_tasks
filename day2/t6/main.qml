import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id:abcd
    width: 640
    height: 500
    visible: true
    title: qsTr("Hello World")
    color: "white"
    MouseArea {
        anchors.fill: parent
        onDoubleClicked: {
            abcd.color="white"
        }
    }

    property bool count: false
    Row{
        id:xyz
        spacing: 20
        anchors.centerIn: parent
        Mrectangle{
            id: r1
           // x:50;y:100
            buttonText: "rect.1"
            rectcol:"red"
            onButtonClicked: {
                r4.buttonvisi=!r4.buttonvisi;
                r2.buttonvisi=!r2.buttonvisi;
                r3.buttonvisi=!r3.buttonvisi;
                abcd.color="red";
                r1.bordere.color=(r1.bordere.color==="black") ? "transparent": "black";

                r2.bordere.color="transparent";
                r3.bordere.color="transparent";
                r4.bordere.color="transparent";
            }

        }
        Mrectangle{
            //x:100;y:100
            id:r2
            buttonText: "rect.2"
            rectcol: "yellow"
            onButtonClicked: {
                r1.buttonvisi=!r1.buttonvisi;
                r4.buttonvisi=!r4.buttonvisi;
                r3.buttonvisi=!r3.buttonvisi;
                abcd.color="yellow";
                r2.bordere.color=(r2.bordere.color==="black") ? "transparent": "black";

                r1.bordere.color="transparent";
                r3.bordere.color="transparent";
                r4.bordere.color="transparent";
            }

        }
        Mrectangle{
            //x:150;y:100
            id: r3
            buttonText: "rect.3"
            rectcol: "magenta"
            onButtonClicked: {
                r1.buttonvisi=!r1.buttonvisi;
                r2.buttonvisi=!r2.buttonvisi;
                r4.buttonvisi=!r4.buttonvisi;
                abcd.color="magenta";
                r3.bordere.color=(r3.bordere.color==="black") ? "transparent": "black";
                r1.bordere.color="transparent";
                r2.bordere.color="transparent";
                r4.bordere.color="transparent";
            }
        }

        Mrectangle{
            //x:250;y:100
            id: r4
            buttonText: "rect.4"
            rectcol:"blue"
            bordere: "transparent"
            onButtonClicked: {
                r1.buttonvisi=!r1.buttonvisi
                r2.buttonvisi=!r2.buttonvisi
                r3.buttonvisi=!r3.buttonvisi
                abcd.color="blue";

                console.log("OUTSIDEEE")

                if(r4.bordere==="#000000"){
                    console.log("Hello" + r4.bordere)
                    r4.bordere="transparent"
                }
                else{
                    bordere="transparent"
                    console.log("ELSE" + r4.bordere)
                }


                r1.bordere="transparent"
                r3.bordere="transparent"
                r2.bordere="transparent"
            }
        }

    }
}

