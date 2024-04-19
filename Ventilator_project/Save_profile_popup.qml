import QtQuick 2.15
import QtQuick.Controls 2.15
import com.ventilatorproject.database 1.0
import com.ventilatorproject.tablemodel 1.0
import com.ventilatorproject.tablemodel2 1.0


Item  {
    id:itemid1
    width:mainwindowid.width
    height:mainwindowid.height
    signal gotoopenscreen()
    signal gotoheader(string str)
    property int peekdb:0
    property int breathratedb:0
    property int spontratedb:0
    property int tvdb:0
    property int fio2db:0
    property int ieratiodb:0
    property int spo2hrdb:0
    property int minutevoldb:0
    property int gaugedb:0
    property string hbedids:""
    property string hroomids:""
    property string hfacilityids:""
    //settings
    property int peekpH:0
    property int peekpL:0
    property int minutevH:0
    property int minutevL:0
    property int breathrH:0
    property int breathrL:0
    property int tidalH:0
    property int tidalL:0
    property int peepH:0
    property int peepL:0
    property int apneaH:0
    property int apneaL:0
    property int spo2H:0
    property int spo2L:0
    property int fio2H:0
    property int fio2L:0
    property int circuitH:0
    property int circuitL:0
    //vent Modepcv
    property int ptype:0
    property int ctype:0
    property int vtype:0
    property int btype:0
    //value
    property int insppressval:0
    property int insptimeval:0
    property int brval:0
    property int ieval:0
    property int risetimeval:0
    property int insptrigval:0
    property int tidalval:0
    property int minutevolval:0
    property int peepval:0
    property int breathrateval:0
    property int presssupval:0
    TableModel {
        id: tableModel
    }
    TableModel2 {
        id: tableModel2
    }
    function getCurrentTime() {
        var now = new Date();
        var hours = now.getHours();
        var minutes = now.getMinutes();
        var seconds = now.getSeconds();
        var meridian = (hours >= 12) ? "PM" : "AM";

        // Convert hours to 12-hour format
        hours = hours % 12;
        hours = hours ? hours : 12; // Set 12 for 0 hours

        // Format the date and time as "YYYY-MM-DD HH:MM:SS AM/PM"
        var formattedTime = now.getFullYear() + '-' +
                            ('0' + (now.getMonth() + 1)).slice(-2) + '-' +
                            ('0' + now.getDate()).slice(-2) + ' ' +
                            ('0' + hours).slice(-2) + ':' +
                            ('0' + minutes).slice(-2) + ':' +
                            ('0' + seconds).slice(-2) + ' ' + meridian;

        return formattedTime;
    }
    function checkPnameExists(pname) {
        var exists = database.isPnameExists(pname);
        console.log("Pname:", pname, "Exists:", exists);
        return exists;
    }
    function gettingdatafromopenscreen(peekpvals,breathratevals,spontbrvals,tvvals,fio2vals,ieratiovals,spo2hrvals,minutevolvals,gaugevals){
        console.log(peekpvals+" "+breathratevals+" "+spontbrvals+" "+tvvals+" "+fio2vals+" "+ieratiovals+" "+spo2hrvals+" "+minutevolvals+" "+gaugevals)
        peekdb=peekpvals
        breathratedb=breathratevals
        spontratedb=spontbrvals
        tvdb=tvvals
        fio2db=fio2vals
        ieratiodb=ieratiovals
        spo2hrdb=spo2hrvals
        minutevoldb=minutevolvals
        gaugedb=gaugevals
    }
    function gettingfromopenscreenhospitaldetails(bed,room,facility){
        hbedids=bed;
        hroomids=room;
        hfacilityids=facility;
    }
    function gettingfromsettingsdb(ph,pl,mh,ml,bh,bl,th,tl,pph,ppl,ah,al,sh,sl,fh,fl,ch,cl){
        peekpH=ph;peekpL=pl;minutevH=mh;minutevL=ml;
        breathrH=bh;breathrL=bl;tidalH=th;tidalL=tl;
        peepH=pph;peepL=ppl;apneaH=ah;apneaL=al;spo2H=sh;
        spo2L=sl;fio2H=fh;fio2L=fl;circuitH=ch;circuitL=cl;
    }
    function gettingfromventmodedb(pval,cval,vval,bval){
        ptype=pval;ctype=cval;vtype=vval;btype=bval;
    }
    function gettingfromvaluepage(insppress,insptime,br,ie,risetime,insptrig,tidalvol,minutevol,peep,breathrate,pressup){
        insppressval=insppress
        insptimeval=insptime
        brval=br
        ieval=ie
        risetimeval=risetime
        insptrigval=insptrig
        tidalval=tidalvol
        minutevolval=minutevol
        peepval=peep
        breathrateval=breathrate
        presssupval=pressup
    }
    // Open_screen{
    //     enabled:false
    //     Rectangle{
    //         width:parent.width
    //         height:parent.height
    //         color:"lightblue"
    //         opacity:0.1
    //     }
    // }
    Database {
        id: database
    }
    Rectangle{
        width:parent.width/2.5
        height:parent.height/2.5
        color:"lightblue"
        border.width:2
        border.color: "red"
        anchors.centerIn: parent
        Text {
            id: headingid
            anchors.top:parent.top;anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Select the profile you want to delete.")
        }
        Text{
            anchors.top:parent.top;anchors.topMargin: 80
            anchors.left: parent.left;anchors.leftMargin: 100
            id:deletetext
            text:"Profile Name : "
        }

        TextField {
            id: textfieldid
            anchors.left:deletetext.right;anchors.leftMargin: 10
            anchors.top:parent.top;anchors.topMargin: 70
            width: 150
            height:30
            placeholderText: ""
        }
        Rectangle {
            id: confirmRect
            width: parent.width * 0.4
            height: parent.height * 0.2
            color: "green"
            anchors.bottom: parent.bottom;anchors.bottomMargin: 20
            anchors.left: parent.left;anchors.leftMargin: 20
            radius:15
            border.width:2
            border.color:"black"
            Text {
                anchors.centerIn: parent
                text: "Confirm"
                color: "white"
                font.pointSize: 15
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    var currentTime = getCurrentTime();
                    tableModel.insertData(currentTime, "Pressure", gaugedb);
                    //tableModel.fetchData();
                    tableModel2.insertData(currentTime, "System", "Pressure",gaugedb,"local");
                    tableModel2.insertData(currentTime, "System", "B R",breathratedb,"local");
                    tableModel2.insertData(currentTime, "System", "Peek P",peekdb,"local");
                    tableModel2.insertData(currentTime, "System", "Fio2",fio2db,"local");
                    //tableModel2.fetchData();
                    console.log(currentTime+" current time ")
                    if(!checkPnameExists(textfieldid.text)) {
                        database.insertPatientDetails(textfieldid.text, peekdb, breathratedb, spontratedb, tvdb, fio2db, ieratiodb, spo2hrdb, minutevoldb, gaugedb);
                        database.insertHospitalDetails(textfieldid.text,hbedids,hroomids,hfacilityids)
                        database.insertSettings(textfieldid.text,peekpH,peekpL,minutevH,minutevL,breathrH,breathrL,tidalH,tidalL,peepH,peepL,apneaH,apneaL,spo2H,spo2L,fio2H,fio2L,circuitH,circuitL)
                        database.insertVentilatorMode(textfieldid.text,ptype,ctype,vtype,btype)
                        database.insertValueDetails(textfieldid.text,insppressval,insptimeval,brval,ieval,risetimeval,insptrigval,tidalval,minutevolval,peepval,breathrateval,presssupval)
                        console.log("inserting in if")
                    } else {
                        database.updatePatientDetails(textfieldid.text, peekdb, breathratedb, spontratedb, tvdb, fio2db, ieratiodb, spo2hrdb, minutevoldb, gaugedb);
                        database.updateHospitalDetails(textfieldid.text,hbedids,hroomids,hfacilityids)
                        database.updateSettings(textfieldid.text,peekpH,peekpL,minutevH,minutevL,breathrH,breathrL,tidalH,tidalL,peepH,peepL,apneaH,apneaL,spo2H,spo2L,fio2H,fio2L,circuitH,circuitL)
                        database.updateVentilatorMode(textfieldid.text,ptype,ctype,vtype,btype)
                        database.updateValueDetails(textfieldid.text,insppressval,insptimeval,brval,ieval,risetimeval,insptrigval,tidalval,minutevolval,peepval,breathrateval,presssupval)
                        console.log("updating in else")
                    }

                    gotoheader(textfieldid.text)
                    textfieldid.text=""
                }
            }
        }
        Rectangle {
            id: cancleRect
            width: parent.width * 0.4
            height: parent.height * 0.2
            color: "gray"
            anchors.bottom: parent.bottom;anchors.bottomMargin: 20
            anchors.right: parent.right;anchors.rightMargin: 20
            radius:15
            border.width:2
            border.color:"black"
            Text {
                anchors.centerIn: parent
                text: "Cancel"
                color: "white"
                font.pointSize: 15
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    gotoopenscreen()
                    textfieldid.text=""
                }
            }
        }
    }

}
