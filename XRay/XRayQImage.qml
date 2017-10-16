import QtQuick 2.0
import ControlApp 1.0
import "qrc:/Control/spinner"
import "qrc:/Control/slideControl"
import QtQuick.Particles 2.0

Item {
    property XRay_qimage objXRay:xrayCpp
    property int thresholdValue: 100
    property int timerValue: 2000
    Rectangle{
        x:0
        y:0
        width: 1024
        height: 640
        color: "transparent"

        Timer{
            id: timerCT
            running: false
            repeat: true
            interval: timerValue
            onTriggered: {
                imageInput.source="qrc:/Images/NG"+ Math.ceil(Math.random()*8)+".png"
                imageResult.source="qrc:/Images/spectrum"+ Math.ceil(Math.random()*4)+".png"
                seqAnimation.running=true
                seqAnimOP.running=true
            }
            onRunningChanged: {
                seqAnimation.running=false
                seqAnimOP.running=false
            }
        }
        Rectangle{
            id: isRunning
            visible: false
            x:275
            y:50
            width: 200
            height: 80
            border.color: "#00CD66"
            border.width: 5
            radius: 10

            Text {
                anchors.centerIn: parent
                id: txtRun
                text: qsTr("Running")
                font.pixelSize: 30
            }
        }
        Rectangle{
            id: isStopping
            visible: true
            x:275
            y:50
            width: 200
            height: 80
            border.color: "#CD3333"
            border.width: 5
            radius: 10

            Text {
                anchors.centerIn: parent
                id: txtStopping
                text: qsTr("Stop")
                font.pixelSize: 30
            }
        }

        Rectangle{
            id:showImageArea
            x:0
            y:0
            width: 750
            height: 450
            color: "transparent"
            border.color: "#7f7f7f"
            border.width: 2
            clip: true

            // Draw animation an image.
            Canvas {
                id: canvas
                anchors.fill: parent
                antialiasing: true
                onPaint: {
                    var context = canvas.getContext("2d")
                    context.clearRect(0, 0, width, height)
                    context.strokeStyle = "transparent"
                    context.path = pathAnim.path
                    context.stroke()
                }
            }

            SequentialAnimation {
                id: seqAnimation
                running: false
                loops: -1
                //PauseAnimation { duration: 1000 }

                PathAnimation {
                    id: pathAnim
                    duration: timerCT.interval
                    //easing.type: Easing.InQuad
                    target: imageInput
                    orientation: PathAnimation.RightFirst

                    anchorPoint: Qt.point(imageInput.width/2, imageInput.height/2)
                    path: Path {
                        startX: -100; startY: 200

                        PathLine {
                            x: showImageArea.width+150
                            y: 200
                        }
                        onChanged: {

                            canvas.requestPaint()
                        }
                    }

                }
                onStarted: {
                    imageInput.visible=true
                }

                onStopped: {
                    imageInput.visible=false
                }
            }
            Image {
                id: imageInput
                y: showImageArea.height/2-imageInput.height/2
                z: imageInput.x < 0 ? -1 : 0
                width: 350; height: 350
                smooth: true
            }
            NumberAnimation {
                id: animacion
                target: imageInput
                property: "scale"
                easing.type: Easing.InOutQuad
            }
        }
        SlideControl2V{
            id: slideBtn
            x:670
            y:320
            widthHandle: 8
            widthBound: 170
            widthBgr: 150
            rotation: -90
            fromValue: 500
            toValue: 2000
            stepSizeValue: 500
            startValue: 500
            text1: "500"
            text2: "1000"
            text3: "1500"
            text4: "2000"
            text5: "2500"
            onGetValueChanged: {
                if(timerCT.running==true){
                    timerCT.stop()
                    timerCT.start()
                    timerCT.interval=slideBtn.slideValue
                }
            }
        }

        // Option start/stop
        Rectangle{
            id: btnStart
            property bool pressIsTrue: false
            x: 650
            y: 340
            width: 80
            height: 40
            color: "#777777"
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
                    btnStart.pressIsTrue=true
                    btnStart.color="#008800"
                    btnStop.color="#777777"
                    isRunning.visible=true
                    isStopping.visible=false
                }
            }
        }

        Rectangle{
            id: btnStop
            x: 650
            y: 400
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
                    timerCT.running=false
                    btnStart.pressIsTrue = false
                    objXRay.getIsStart(btnStart.pressIsTrue);
                    btnStart.color="#777777"
                    btnStop.color="#CC3300"
                    isRunning.visible=false
                    isStopping.visible=true
                }
            }
        }

        // Controller Zoom in/out an image
        Rectangle{
            id: zoomIn
            x: 690
            y: 15
            width: 30
            height: 30
            color: "transparent"
            Image {
                anchors.fill: parent
                id: imgZoomIn
                source: "qrc:/Images/zoom_in.png"
            }
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    zoomIn.width=40
                    zoomIn.height=40
                    if(imageInput.height<showImageArea.height){
                        imageInput.width=imageInput.width*1.25
                        imageInput.height=imageInput.height*1.25
                        imageInput.y =showImageArea.height/2-imageInput.height/2
                    }
                }
                onReleased: {
                    zoomIn.width=30
                    zoomIn.height=30
                }
            }
        }
        Rectangle{
            id: zoomOut
            x: 690
            y: 65
            width: 30
            height: 30
            color: "transparent"
            Image {
                anchors.fill: parent
                id: imgZoomOut
                source: "qrc:/Images/zoom_out.png"
            }
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    zoomOut.width=40
                    zoomOut.height=40
                    if(imageInput.height>showImageArea.height/4)
                    {
                        imageInput.width=imageInput.width*0.75
                        imageInput.height=imageInput.height*0.75
                        imageInput.y=imageInput.y =showImageArea.height/2-imageInput.height/2
                    }

                }
                onReleased: {
                    zoomOut.width=30
                    zoomOut.height=30
                }
            }
        }

        // Daw Result Spectrum
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
            clip: true

            Canvas {
                id: canvas2
                anchors.fill: parent
                antialiasing: true
                onPaint: {
                    var context = canvas2.getContext("2d")
                    context.clearRect(0, 0, width, height)
                    context.strokeStyle = "transparent"
                    context.path = pathAnimOP.path
                    context.stroke()
                }
            }
            SequentialAnimation {
                id: seqAnimOP
                running: false
                loops: -1
                //PauseAnimation { duration: 1000 }

                PathAnimation {
                    id: pathAnimOP
                    duration: timerCT.interval
                    //easing.type: Easing.InQuad
                    target: imageResult
                    orientation: PathAnimation.RightFirst

                    anchorPoint: Qt.point(imageResult.width/2, imageResult.height/2)
                    path: Path {
                        startX: -100; startY: 150

                        PathLine {
                            x: showresult.width+150
                            y: 150
                        }
                        onChanged: canvas2.requestPaint()
                    }
                }

                onStarted: {
                    imageResult.visible=true
                }

                onStopped: {
                    imageResult.visible=false
                }
            }
            Image {
                id: imageResult
                y:90
                z: imageResult.x < 0 ? -1 : 0
                width: 200; height: 100
                smooth: true
            }
            Canvas{
                id: threshold
                anchors.fill: parent
                onPaint: {
                    var ctx = getContext("2d");
                    ctx.strokeStyle="red";
                    ctx.lineWidth=4;
                    ctx.moveTo(3,thresholdValue);
                    ctx.lineTo(747, thresholdValue);
                    ctx.stroke();
                }
                //                onDataChanged: {
                //                    threshold.requestPaint()
                //                }

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

        XRay_qimage{
            id:xrayCpp
            x: 0
            y:0
            width: 1024
            height: 640
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
                            if(btnStart.pressIsTrue == true)
                            {
                                objXRay.getIsStart(btnStart.pressIsTrue);
                                timerCT.running=true
                                txtCT1.color="#ffffff"
                                btnCT1.border.color = "#ffffff"
                                console.log(imageResult.source +"press CT1")
                                txtBtnSelected.text =txtCT1.text
                                btnSelected.color=btnCT1.color
                                isRunning.visible=false
                                isStopping.visible=false
                            }
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
                            if(btnStart.pressIsTrue == true)
                            {
                                objXRay.getIsStart(btnStart.pressIsTrue);
                                timerCT.running=true
                                txtCT2.color="#ffffff"
                                btnCT2.border.color = "#ffffff"
                                console.log(imageResult.source +"press CT2")
                                txtBtnSelected.text =txtCT2.text
                                btnSelected.color=btnCT2.color
                                isRunning.visible=false
                                isStopping.visible=false
                            }
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
                            if(btnStart.pressIsTrue == true)
                            {
                                objXRay.getIsStart(btnStart.pressIsTrue);
                                timerCT.running=true
                                txtCT3.color="#ffffff"
                                btnCT3.border.color = "#ffffff"
                                txtBtnSelected.text =txtCT3.text
                                btnSelected.color=btnCT3.color
                                isRunning.visible=false
                                isStopping.visible=false
                            }
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
                            if(btnStart.pressIsTrue == true)
                            {
                                objXRay.getIsStart(btnStart.pressIsTrue);
                                timerCT.running=true
                                txtCT4.color="#ffffff"
                                btnCT4.border.color = "#ffffff"
                                txtBtnSelected.text =txtCT4.text
                                btnSelected.color=btnCT4.color
                                isRunning.visible=false
                                isStopping.visible=false
                            }
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
                            if(btnStart.pressIsTrue == true)
                            {
                                objXRay.getIsStart(btnStart.pressIsTrue);
                                timerCT.running=true
                                txtCT5.color="#ffffff"
                                btnCT5.border.color = "#ffffff"
                                txtBtnSelected.text =txtCT5.text
                                btnSelected.color=btnCT5.color
                                isRunning.visible=false
                                isStopping.visible=false
                            }
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
                            if(btnStart.pressIsTrue == true)
                            {
                                objXRay.getIsStart(btnStart.pressIsTrue);
                                timerCT.running=true
                                txtCT6.color="#ffffff"
                                btnCT6.border.color = "#ffffff"
                                txtBtnSelected.text =txtCT6.text
                                btnSelected.color=btnCT6.color
                                isRunning.visible=false
                                isStopping.visible=false
                            }
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
                            if(btnStart.pressIsTrue == true)
                            {
                                objXRay.getIsStart(btnStart.pressIsTrue);
                                timerCT.running=true
                                txtCT7.color="#ffffff"
                                btnCT7.border.color = "#ffffff"
                                txtBtnSelected.text =txtCT7.text
                                btnSelected.color=btnCT7.color
                                isRunning.visible=false
                                isStopping.visible=false
                            }
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
                            if(btnStart.pressIsTrue == true)
                            {
                                objXRay.getIsStart(btnStart.pressIsTrue);
                                timerCT.running=true
                                txtCT8.color="#ffffff"
                                btnCT8.border.color = "#ffffff"
                                txtBtnSelected.text =txtCT8.text
                                btnSelected.color=btnCT8.color
                                isRunning.visible=false
                                isStopping.visible=false
                            }
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
                            if(btnStart.pressIsTrue == true)
                            {
                                objXRay.getIsStart(btnStart.pressIsTrue);
                                timerCT.running=true
                                txtCT9.color="#ffffff"
                                btnCT9.border.color = "#ffffff"
                                txtBtnSelected.text =txtCT9.text
                                btnSelected.color=btnCT9.color
                                isRunning.visible=false
                                isStopping.visible=false
                            }
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
                            if(btnStart.pressIsTrue == true)
                            {
                                objXRay.getIsStart(btnStart.pressIsTrue);
                                timerCT.running=true
                                txtCT10.color="#ffffff"
                                btnCT10.border.color = "#ffffff"
                                txtBtnSelected.text =txtCT10.text
                                btnSelected.color=btnCT10.color
                                isRunning.visible=false
                                isStopping.visible=false
                            }
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
                            if(btnStart.pressIsTrue == true)
                            {
                                objXRay.getIsStart(btnStart.pressIsTrue);
                                timerCT.running=true
                                txtCT0.color="#ffffff"
                                btnCT0.border.color = "#ffffff"
                                txtBtnSelected.text =txtCT0.text
                                btnSelected.color=btnCT0.color
                                isRunning.visible=false
                                isStopping.visible=false
                            }
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
                            if(btnStart.pressIsTrue == true)
                            {
                                txtCT11Up.color="#ffffff"
                                btnCT11Up.border.color = "#ffffff"
                            }
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

