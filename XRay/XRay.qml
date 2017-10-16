import QtQuick 2.0
import QtQuick.Controls 2.0
import "qrc:/Control/spinner"
import ControlApp 1.0
Item {
    property XRay objXRay:xrayCpp
    Rectangle{
        x:0
        y:0
        width: 1024
        height: 640
        color: "transparent"

        XRay{
            id:xrayCpp
            x: 0
            y:0
            width: 1024
            height: 640
        }

        Rectangle{
            id:showImageArea
            x:0
            y:0
            width: 750
            height: 450
            color: "transparent"
            border.color: "#7f7f7f"
            border.width: 15
            Image {
                anchors.fill: parent
                id: imageInput
            }
        }

        Rectangle{
            id: btnStart
            property bool pressIsTrue: false
            x: 650
            y: 320
            width: 80
            height: 40
            color: "#008800"
            border.color: "#8B795E"
            border.width: 2
            radius: 5
            Text {
                id: txtStart
                anchors.centerIn: parent
                font.pixelSize: 25
                font.bold: true
                color: "#FAFAD2"
                text: qsTr("Start")
            }
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    imageInput.source =""
                    imageresult.source=""
                    btnStart.pressIsTrue = true
                    objXRay.getIsStart(btnStart.pressIsTrue);
                }
            }
        }

        Rectangle{
            id: btnStop
            x: 650
            y: 380
            width: 80
            height: 40
            color: "#CC3300"
            border.color: "#8B795E"
            border.width: 2
            radius: 5
            Text {
                id: txtStop
                anchors.centerIn: parent
                font.pixelSize: 25
                font.bold: true
                color: "#FAFAD2"
                text: qsTr("Stop")
            }
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    btnStart.pressIsTrue = false
                    objXRay.getIsStart(btnStart.pressIsTrue);
                    console.log("1222")
                }
            }
        }

        Rectangle{
            id:showresult
            x:0
            y:450
            width: 750
            height: 190
            color: "transparent"
            border.color: "#7f7f7f"
            border.width: 2
            radius: 4

            Image {
                anchors.bottom:  parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                id: imageresult
            }
            Canvas{
                id: threshold
                anchors.fill: parent
                onPaint: {
                    var ctx = getContext("2d");
                    ctx.strokeStyle="red";
                    ctx.lineWidth=4;
                    ctx.moveTo(3,100);
                    ctx.lineTo(747, 100);
                    ctx.stroke();
                }
            }

            Rectangle{
                id: btnSelected
                x:5
                y:5
                width: 50
                height: 30
                radius: 5
                border.color: "#7f7f7f"
                color: "red"
                Text {
                    id: txtBtnSelected
                    anchors.centerIn: parent
                    color: "#404040"
                    font.pixelSize: 20
                    text: qsTr("CT1")
                }
                MouseArea{
                    anchors.fill: parent
                    onPressed:{
                        txtBtnSelected.color="#00ad86"
                        btnSelected.border.color = "#00ad86"
                    }
                    onReleased: {
                        txtBtnSelected.color="#404040"
                        btnSelected.border.color = "#404040"
                    }
                }
            }
            Text {
                id: txtMaxValue
                x:680
                y:10
                font.pixelSize: 20
                color: "Green"
                text: qsTr("225")
            }

        }

        Rectangle{
            id:rightPanel
            x:750
            y:0
            width: 274
            height: 640
            color: "transparent"
            //color: "#404040"

            Rectangle {
                id:btnAll
                x:0
                y:0
                width: 136
                height: 37
                radius: 2
                color: "#d0d0d0"
                border.color: "#404040"
                border.width: 1
                Text {
                    id: txtBtnAll
                    anchors.centerIn: parent
                    color: "#404040"
                    font.pixelSize: 20
                    text: qsTr("All Display")
                }
                MouseArea{
                    anchors.fill: parent
                    onPressed:{
                        txtBtnAll.color="#00ad86"
                        btnAll.border.color = "#00ad86"
                    }
                    onReleased: {
                        txtBtnAll.color="#404040"
                        btnAll.border.color = "#404040"
                    }
                }
            }
            Rectangle {
                id: btnImpactMonitor
                x:137
                y:0
                width: 136
                height: 37
                radius: 2
                color: "#d0d0d0"
                border.width: 1
                border.color : "#404040"
                Text {
                    id: txtImpactMonitor
                    anchors.centerIn: parent
                    color: "#404040"
                    font.pixelSize: 20
                    text: qsTr("Impact Monitor")
                }
                MouseArea{
                    anchors.fill: parent
                    onPressed:{
                        txtImpactMonitor.color="#00ad86"
                        btnImpactMonitor.border.color = "#00ad86"
                    }
                    onReleased: {
                        txtImpactMonitor.color="#404040"
                        btnImpactMonitor.border.color = "#404040"
                    }
                }
            }

            Rectangle{
                id: listCT
                x: 0
                y:295
                width: 274
                height: 150
                radius: 5
                color: "#7f7f7f"
                border.color: "#ffffff"

                Rectangle{
                    id: btnCT1
                    x:4
                    y:15
                    width: 50
                    height: 30
                    radius: 5
                    border.color: "#404040"
                    color: "red"
                    Text {
                        id: txtCT1
                        anchors.centerIn: parent
                        color: "#404040"
                        font.pixelSize: 20
                        text: qsTr("CT1")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed:{
                            btnStart.pressIsTrue = false
                            objXRay.getIsStart(btnStart.pressIsTrue);
                            txtCT1.color="#ffffff"
                            btnCT1.border.color = "#ffffff"
                            imageInput.source ="qrc:Images/NG4.png"
                            imageresult.source="qrc:Images/spectrum1.png"
                            txtBtnSelected.text =txtCT1.text
                            btnSelected.color=btnCT1.color
                        }
                        onReleased: {
                            txtCT1.color="#404040"
                            btnCT1.border.color = "#404040"
                        }
                    }
                }
                Rectangle{
                    id: btnCT2
                    x: btnCT1.x +btnCT1.width +4
                    y:15
                    width: 50
                    height: 30
                    radius: 5
                    border.color: "#404040"
                    color: "#00CD66"
                    Text {
                        id: txtCT2
                        anchors.centerIn: parent
                        color: "#404040"
                        font.pixelSize: 20
                        text: qsTr("CT2")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed:{
                            btnStart.pressIsTrue = false
                            objXRay.getIsStart(btnStart.pressIsTrue);
                            txtCT2.color="#ffffff"
                            btnCT2.border.color = "#ffffff"
                            imageInput.source ="qrc:Images/NG5.png"
                            imageresult.source="qrc:Images/spectrum2.png"
                            txtBtnSelected.text =txtCT2.text
                            btnSelected.color=btnCT2.color
                        }
                        onReleased: {
                            txtCT2.color="#404040"
                            btnCT2.border.color = "#404040"
                        }
                    }
                }
                Rectangle{
                    id: btnCT3
                    x: btnCT2.x+btnCT2.width +4
                    y:15
                    width: 50
                    height: 30
                    radius: 5
                    border.color: "#404040"
                    color: "#00CD66"
                    Text {
                        id: txtCT3
                        anchors.centerIn: parent
                        color: "#404040"
                        font.pixelSize: 20
                        text: qsTr("CT3")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed:{
                            btnStart.pressIsTrue = false
                            objXRay.getIsStart(btnStart.pressIsTrue);
                            txtCT3.color="#ffffff"
                            btnCT3.border.color = "#ffffff"
                            imageInput.source ="qrc:Images/NG7.png"
                            imageresult.source="qrc:Images/spectrum4.png"
                            txtBtnSelected.text =txtCT3.text
                            btnSelected.color=btnCT3.color
                        }
                        onReleased: {
                            txtCT3.color="#404040"
                            btnCT3.border.color = "#404040"
                        }
                    }
                }
                Rectangle{
                    id: btnCT4
                    x: btnCT3.x+btnCT3.width +4
                    y:15
                    width: 50
                    height: 30
                    radius: 5
                    border.color: "#404040"
                    color: "red"
                    Text {
                        id: txtCT4
                        anchors.centerIn: parent
                        color: "#404040"
                        font.pixelSize: 20
                        text: qsTr("CT4")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed:{
                            btnStart.pressIsTrue = false
                            objXRay.getIsStart(btnStart.pressIsTrue);
                            txtCT4.color="#ffffff"
                            btnCT4.border.color = "#ffffff"
                            imageInput.source ="qrc:Images/NG9.png"
                            imageresult.source="qrc:Images/spectrum5.png"
                            txtBtnSelected.text =txtCT4.text
                            btnSelected.color=btnCT4.color
                        }
                        onReleased: {
                            txtCT4.color="#404040"
                            btnCT4.border.color = "#404040"
                        }
                    }
                }
                Rectangle{
                    id: btnCT5
                    x: btnCT4.x+btnCT4.width +4
                    y:15
                    width: 50
                    height: 30
                    radius: 5
                    border.color: "#404040"
                    color: "#00CD66"
                    Text {
                        id: txtCT5
                        anchors.centerIn: parent
                        color: "#404040"
                        font.pixelSize: 20
                        text: qsTr("CT5")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed:{
                            btnStart.pressIsTrue = false
                            objXRay.getIsStart(btnStart.pressIsTrue);
                            txtCT5.color="#ffffff"
                            btnCT5.border.color = "#ffffff"
                            imageInput.source ="qrc:Images/NG8.png"
                            imageresult.source="qrc:Images/spectrum2.png"
                            txtBtnSelected.text =txtCT5.text
                            btnSelected.color=btnCT5.color
                        }
                        onReleased: {
                            txtCT5.color="#404040"
                            btnCT5.border.color = "#404040"
                        }
                    }
                }
                Rectangle{
                    id: btnCT6
                    x:4
                    y:btnCT1.y +btnCT1.height +15
                    width: 50
                    height: 30
                    radius: 5
                    border.color: "#404040"
                    color: "#00CD66"
                    Text {
                        id: txtCT6
                        anchors.centerIn: parent
                        color: "#404040"
                        font.pixelSize: 20
                        text: qsTr("CT6")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed:{
                            btnStart.pressIsTrue = false
                            objXRay.getIsStart(btnStart.pressIsTrue);
                            txtCT6.color="#ffffff"
                            btnCT6.border.color = "#ffffff"
                            imageInput.source ="qrc:Images/NG5.png"
                            imageresult.source="qrc:Images/spectrum3.png"
                            txtBtnSelected.text =txtCT6.text
                            btnSelected.color=btnCT6.color
                        }
                        onReleased: {
                            txtCT6.color="#404040"
                            btnCT6.border.color = "#404040"
                        }
                    }
                }
                Rectangle{
                    id: btnCT7
                    x: btnCT1.x +btnCT1.width +4
                    y: btnCT1.y +btnCT1.height +15
                    width: 50
                    height: 30
                    radius: 5
                    border.color: "#404040"
                    color: "#00CD66"
                    Text {
                        id: txtCT7
                        anchors.centerIn: parent
                        color: "#404040"
                        font.pixelSize: 20
                        text: qsTr("CT7")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed:{
                            btnStart.pressIsTrue = false
                            objXRay.getIsStart(btnStart.pressIsTrue);
                            txtCT7.color="#ffffff"
                            btnCT7.border.color = "#ffffff"
                            imageInput.source ="qrc:Images/NG7.png"
                            imageresult.source="qrc:Images/spectrum1.png"
                            txtBtnSelected.text =txtCT7.text
                            btnSelected.color=btnCT7.color
                        }
                        onReleased: {
                            txtCT7.color="#404040"
                            btnCT7.border.color = "#404040"
                        }
                    }
                }
                Rectangle{
                    id: btnCT8
                    x: btnCT2.x+btnCT2.width +4
                    y:btnCT1.y +btnCT1.height +15
                    width: 50
                    height: 30
                    radius: 5
                    border.color: "#404040"
                    color: "red"
                    Text {
                        id: txtCT8
                        anchors.centerIn: parent
                        color: "#404040"
                        font.pixelSize: 20
                        text: qsTr("CT8")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed:{
                            btnStart.pressIsTrue = false
                            objXRay.getIsStart(btnStart.pressIsTrue);
                            txtCT8.color="#ffffff"
                            btnCT8.border.color = "#ffffff"
                            imageInput.source ="qrc:Images/NG9.png"
                            imageresult.source="qrc:Images/spectrum4.png"
                            txtBtnSelected.text =txtCT8.text
                            btnSelected.color=btnCT8.color
                        }
                        onReleased: {
                            txtCT8.color="#404040"
                            btnCT8.border.color = "#404040"
                        }
                    }
                }
                Rectangle{
                    id: btnCT9
                    x: btnCT3.x+btnCT3.width +4
                    y:btnCT1.y +btnCT1.height +15
                    width: 50
                    height: 30
                    radius: 5
                    border.color: "#404040"
                    color: "red"
                    Text {
                        id: txtCT9
                        anchors.centerIn: parent
                        color: "#404040"
                        font.pixelSize: 20
                        text: qsTr("CT9")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed:{
                            btnStart.pressIsTrue = false
                            objXRay.getIsStart(btnStart.pressIsTrue);
                            txtCT9.color="#ffffff"
                            btnCT9.border.color = "#ffffff"
                            imageInput.source ="qrc:Images/NG8.png"
                            imageresult.source="qrc:Images/spectrum5.png"
                            txtBtnSelected.text =txtCT9.text
                            btnSelected.color=btnCT9.color
                        }
                        onReleased: {
                            txtCT9.color="#404040"
                            btnCT9.border.color = "#404040"
                        }
                    }
                }
                Rectangle{
                    id: btnCT10
                    x: btnCT4.x+btnCT4.width +4
                    y:btnCT1.y +btnCT1.height +15
                    width: 50
                    height: 30
                    radius: 5
                    border.color: "#404040"
                    color: "#00CD66"
                    Text {
                        id: txtCT10
                        anchors.centerIn: parent
                        color: "#404040"
                        font.pixelSize: 20
                        text: qsTr("CT10")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed:{
                            btnStart.pressIsTrue = false
                            objXRay.getIsStart(btnStart.pressIsTrue);
                            txtCT10.color="#ffffff"
                            btnCT10.border.color = "#ffffff"
                            imageInput.source ="qrc:Images/NG4.png"
                            imageresult.source="qrc:Images/spectrum1.png"
                            txtBtnSelected.text =txtCT10.text
                            btnSelected.color=btnCT10.color
                        }
                        onReleased: {
                            txtCT10.color="#404040"
                            btnCT10.border.color = "#404040"
                        }
                    }
                }
                Rectangle{
                    id: btnCT0
                    x: 4
                    y: btnCT6.y +btnCT6.height +15
                    width: 50
                    height: 30
                    radius: 5
                    border.color: "#404040"
                    color: "red"
                    Text {
                        id: txtCT0
                        anchors.centerIn: parent
                        color: "#404040"
                        font.pixelSize: 20
                        text: qsTr("CT0")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed:{
                            btnStart.pressIsTrue = false
                            objXRay.getIsStart(btnStart.pressIsTrue);
                            txtCT0.color="#ffffff"
                            btnCT0.border.color = "#ffffff"
                            imageInput.source ="qrc:Images/NG7.png"
                            imageresult.source="qrc:Images/spectrum2.png"
                            txtBtnSelected.text =txtCT0.text
                            btnSelected.color=btnCT0.color
                        }
                        onReleased: {
                            txtCT0.color="#404040"
                            btnCT0.border.color = "#404040"
                        }
                    }
                }
                Rectangle{
                    id: btnCT11Up
                    x: (btnCT0.x+btnCT0.width)*3 + 4
                    y: btnCT6.y +btnCT6.height +15
                    width: 100
                    height: 30
                    radius: 5
                    border.color: "#404040"
                    color: "#00CD66"
                    Text {
                        id: txtCT11Up
                        anchors.centerIn: parent
                        color: "#404040"
                        font.pixelSize: 20
                        text: qsTr("CT11-CT14")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed:{
                            txtCT11Up.color="#ffffff"
                            btnCT11Up.border.color = "#ffffff"
                        }
                        onReleased: {
                            txtCT11Up.color="#404040"
                            btnCT11Up.border.color = "#404040"
                        }
                    }
                }


            }
            Rectangle{
                x:0
                y:445
                width: 274
                height: 195
                color: "#FDF5E6"
                Text {
                    id: txtLimitDitection
                    x: 5
                    y:30
                    font.pixelSize: 15
                    color: "red"
                    text: qsTr("Limit Detection")
                }
                Spinner2{
                    id: ditectionLimit
                    x:168
                    y:-45
                    spinWidth: 60
                    spinHeight: 150
                    rotation: 270
                    mod: 50

                    Component.onCompleted: {
                        console.log(ditectionLimit.currIndex)

                    }
                }
                Text {
                    id: txtNoiseRemoval
                    x: 5
                    y:30 +60
                    font.pixelSize: 15
                    color: "red"
                    text: qsTr("Noise Removal")
                }
                Spinner2{
                    id: noiseRemoval
                    x:168
                    y:20
                    spinWidth: 60
                    spinHeight: 150
                    rotation: 270
                    mod: 12
                }
                Rectangle{
                    id: btnUpdate
                    x: 24
                    y: 135
                    width: 100
                    height: 50
                    radius: 5
                    color: "#5a6469"
                    Text {
                        id: txtUpdate
                        anchors.centerIn: parent
                        font.pixelSize: 20
                        color: "#EEE8AA"
                        text: qsTr("UPDATE")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: {
                            btnUpdate.color = "#788287"
                        }
                        onReleased: {
                            btnUpdate.color = "#5a6469"
                        }
                    }
                }
                Rectangle{
                    id: btnCancel
                    x: 49 +btnUpdate.width
                    y: 135
                    width: 100
                    height: 50
                    radius: 5
                    color: "#5a6469"
                    Text {
                        id: txtCancel
                        anchors.centerIn: parent
                        font.pixelSize: 20
                        color: "#EEE8AA"
                        text: qsTr("CANCEL")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: {
                            btnCancel.color = "#788287"
                        }
                        onReleased: {
                            btnCancel.color = "#5a6469"
                        }
                    }
                }
            }
        }
    }
}
