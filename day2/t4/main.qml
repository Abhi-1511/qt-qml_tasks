import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id:abcd
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Column{
        id:xyz
        spacing: parent.width/32
        anchors.centerIn: parent


        Batch2{
            // x:50;y:100
            id:t1
            buttonText: "opacityr0.1"
            buttoncol: "red"
            onButtonClicked: {

                t1.buttonop=t1.buttonop+0.1;
                t2.buttonop=t2.buttonop+0.1;
                t3.buttonop=t3.buttonop+0.1;
                t4.buttonop=t4.buttonop+0.1;
                t5.buttonop=t5.buttonop+0.1;

            }
        }
        Batch2{
            //x:100;y:100
            id:t2
            buttonText: "opacityi0.1"
            buttoncol:"blue"
            onButtonClicked: {
                if(buttonop>=0.4){
                t1.buttonop=t1.buttonop-0.1;
                t2.buttonop=t2.buttonop-0.1;
                t3.buttonop=t3.buttonop-0.1;
                t4.buttonop=t4.buttonop-0.1;
                t5.buttonop=t5.buttonop-0.1;
                }
            }
        }
        Batch2{
            //x:150;y:100
            id:t3
            buttonText: "incheightby2"
            buttoncol:"green"
            onButtonClicked: {
                if(t1.buttonhig+t2.buttonhig+t3.buttonhig+t4.buttonhig+t5.buttonhig+parent.height/1.8<=abcd.height){
                t1.buttonhig=t1.buttonhig+2;
                t2.buttonhig=t2.buttonhig+2;
                t3.buttonhig=t3.buttonhig+2;
                t4.buttonhig=t4.buttonhig+2;
                t5.buttonhig=t5.buttonhig+2;
                }
            }
        }
        Batch2{
            //x:200;y:100
            id:t4
            buttonText: "decheightby2"
            buttoncol:"yellow"
            onButtonClicked: {
                if(buttonhig>20){
                t1.buttonhig=t1.buttonhig-2;
                t2.buttonhig=t2.buttonhig-2;
                t3.buttonhig=t3.buttonhig-2;
                t4.buttonhig=t4.buttonhig-2;
                t5.buttonhig=t5.buttonhig-2;
                }
            }
        }
        Batch2{
            //x:250;y:100
            id:t5
            buttonText: "visible/invisible"
            buttoncol:"orange"
            onButtonClicked: {
                t1.buttonvisi = !t1.buttonvisi
                t2.buttonvisi = !t2.buttonvisi
                t3.buttonvisi = !t3.buttonvisi
                t4.buttonvisi = !t4.buttonvisi
                //t5.buttonvisi = !t5.buttonvisi
            }
        }

    }
}
//window innda acche ogbardu

