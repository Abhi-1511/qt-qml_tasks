import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4

Window {
    id: windowid
    width: 800
    height: 600
    visible: true
    title: qsTr("Hello World")
    color: "lightblue"
   // property bool darkModeEnabled: false


//Registration2{}
    Login {
        id: loginpageid
        visible: true
        onGoToRegistation1Page: {
            registrationpageid.visible = true;
        }
    }

    Registration1 {
        id: registrationpageid
        visible: false
    }

    Registration2 {
        id: registration2pageid
        visible: false
    }

    Popup {
        id: popuppageid
        visible: false
    }

    Loading {
        id: loadingpageid
        visible: false
    }

    Successfull {
        id: successid
        visible: false
    }

    Details {
        id: detailsid
        visible: false
    }
    Togglebar{
        id:tog
        visible:true
    }

    Component.onCompleted: {
        loginpageid.goToRegistation1Page.connect(registrationpageid.register)
        registrationpageid.goToRegistation2Page.connect(registration2pageid.register2)
        registration2pageid.gotoPopuppage.connect(popuppageid.welcometopopuppage)
        popuppageid.gotoloadingpage.connect(loadingpageid.welcometoloadingpage)
        loadingpageid.gotosuccesspage.connect(successid.welcometosuccesspage)
        successid.gotologinpage.connect(loginpageid.welcometologinpage)
        loginpageid.gotodetailspage.connect(detailsid.welcometodetailspage)
        detailsid.gotologinpageagain.connect(loginpageid.welcometologinpage)
        popuppageid.gotologinpageagain2.connect(loginpageid.welcometologinpageagain2)
        registrationpageid.sendData.connect(detailsid.readData)
        registration2pageid.sendData2.connect(detailsid.readData2)
        registrationpageid.logindetails.connect(loginpageid.receivelogindetails)
        successid.makingfieldsnull1.connect(registrationpageid.null1)
        successid.makingfieldsnull2.connect(registration2pageid.null2)
        tog.toggled.connect(loginpageid.handleModeChange)
        tog.toggled.connect(popuppageid.handleModeChange)
        tog.toggled.connect(loadingpageid.handleModeChange)
        tog.toggled.connect(detailsid.handleModeChange)
        tog.toggled.connect(registration2pageid.handleModeChange)
        tog.toggled.connect(registrationpageid.handleModeChange)
        tog.toggled.connect(successid.handleModeChange)
        registrationpageid.backbuttonsignal.connect(loginpageid.welcometologinpage)
        registration2pageid.backtoregistration1.connect(registrationpageid.register)
        popuppageid.cleardata.connect(loginpageid.clear)
        popuppageid.cleardata.connect(registrationpageid.null1)
        popuppageid.cleardata.connect(registration2pageid.null2)
        successid.cleanlogin.connect(loginpageid.clear)
    }
}
