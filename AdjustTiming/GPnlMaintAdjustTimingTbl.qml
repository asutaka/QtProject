import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import ControlApp 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtCharts 2.1
import "../Control/switchControl"
import "../Control/switchLineUC"
import "../Dialog"
import "../Control/VirtualKey.js" as Ops

Item{
    property GPnlMaintAdjustTimingTbl adjustTimingScreen: drawContentAdjustTiming
    property ChartView chart: weightChart
    property ChartView chartMeasSignal: signalChart
    property CateListDialog objSettingTime: settingTime
    LayoutMirroring.enabled: true
    property int valueT1: 3
    property int valueT2: 3
    property int valueT3: 3
    property int valueT4: 3
    property int valueRefVal:6
    property int currentLine: 1
    property string sourceImage: ""
    property real widthGraph: 0
    property int  optionTime : 1;
    property int  indexlineActive :0;

    GPnlMaintAdjustTimingTbl{
        id: drawContentAdjustTiming
        width: 1024
        height: 640
        Rectangle{
            x:4
            y: 10
            width:260
            height: 100
            color: "transparent"
            border.width: 1
            border.color: "#848385"
            radius:5
            Text {
                x:2
                y:5
                text: "Prod"
                font.pixelSize:18
                color: "white"
            }
            Text {
                x:6
                y:40
                text: "sample"
                font.pixelSize:18
                color: "white"
            }
            Text {
                x:94
                text: "050"
                font.pixelSize:34
                color: "white"
            }
        }
        Rectangle{
            x:4
            y: 193
            width:280
            height: 40
            color: "transparent"
            border.width: 1
            border.color: "#848385"
            radius:5
            Text {
                x:6
                y:5
                anchors.verticalCenter: parent.verticalCenter
                text: "Ref.Val"
                font.pixelSize:18
                color: "white"
            }
            Text{
                x:260
                anchors.verticalCenter: parent.verticalCenter
                text: "g"
                font.pixelSize:18
                color: "white"
            }
            TextField {
                //x: 75
                anchors.fill: parent
                id: inputRefVal
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 20
                text: valueRefVal
                readOnly: true
                horizontalAlignment :TextInput.AlignRight
                font.pixelSize:18
                style:  TextFieldStyle {
                    textColor: "#95B3D7"
                    background: Rectangle {
                        color: "transparent"
                    }
                }
                maximumLength: 10
                validator: IntValidator { bottom:1; top: 6}
                onActiveFocusChanged:
                {
                    if(activeFocus)
                    {
                        Ops.showCalculator(inputRefVal,"1","6");
                    }
                }
                onDisplayTextChanged:
                {
                    valueAxisY.max = parseInt(inputRefVal.text)*1.5;
                    valueAxisY.min =parseInt(txtAsisY_min.text)-((valueAxisY.max - parseInt(txtAsisY_min.text))/9)*2;
                }
                Component.onCompleted:
                {
                    valueAxisY.max = parseInt(inputRefVal.text)*1.5;
                    valueAxisY.min =parseInt(txtAsisY_min.text)-((valueAxisY.max - parseInt(txtAsisY_min.text))/9)*2;
                }
            }
        }
        Rectangle{
            x:4
            y: 243
            width:280
            height: 40
            color: "transparent"
            border.width: 1
            border.color: "#848385"
            radius:5
            Text {
                x:6
                y:5
                anchors.verticalCenter: parent.verticalCenter
                text: "Prod Len"
                font.pixelSize:18
                color: "white"
            }
            Text{
                x:240
                anchors.verticalCenter: parent.verticalCenter
                text: "mm"
                font.pixelSize:18
                color: "white"
            }
            TextField {
                id: txtProdLen
                anchors.fill: parent
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 40
                text: "1200"
                readOnly: true
                horizontalAlignment :TextInput.AlignRight
                font.pixelSize:18
                style:  TextFieldStyle {
                    textColor: "#95B3D7"
                    background: Rectangle {
                        color: "transparent"
                    }
                }
                validator: IntValidator { bottom:1; top: 275}
                maximumLength: 10
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        inputKeyboard.visible = true;
                        myKeyBoard.state ="active";
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        inputKeyboard.visible = true;
                        inputKeyboard.objText.cursorVisible = true
                        inputKeyboard.objText.text = txtProdLen.text;
                        myKeyBoard.state ="active";
                    }
                }
            }
        }
        Rectangle{
            x:4
            y: 293
            width:280
            height: 40
            color: "transparent"
            border.width: 1
            border.color: "#848385"
            radius:5
            Text {
                x:6
                y:5
                id : txtMeasTiming
                anchors.verticalCenter: parent.verticalCenter
                text: "Meas. Timing"
                font.pixelSize:18
                color: "white"
            }
            Text {
                x: 210
                id: txtOptionMeasTiming
                anchors.verticalCenter: parent.verticalCenter
                text: "Manual"
                horizontalAlignment :TextInput.AlignRight
                font.pixelSize:18
                color: "#95B3D7"
            }
            MouseArea{
                anchors.fill: parent;
                onPressed: {
                    settingMeasTiming.source = listMeasTiming;
                    settingMeasTiming.visible = true;
                    settingMeasTiming.title = txtMeasTiming.text
                }
            }
        }
        Rectangle{
            x:4
            y: 343
            width:280
            height: 40
            color: "transparent"
            border.width: 1
            border.color: "#848385"
            radius:5
            Text {
                x:6
                y:5
                text: "T1"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize:18
                color: "white"
            }
            Text{
                x:245
                anchors.verticalCenter: parent.verticalCenter
                text: "ms"
                font.pixelSize:18
                color: "white"
            }
            TextField {
                id: inputT1
                anchors.fill: parent
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 35
                text:valueT1.toString();
                readOnly: true
                horizontalAlignment :TextInput.AlignRight
                font.pixelSize:18
                style:  TextFieldStyle {
                    textColor: "#95B3D7"
                    background: Rectangle {
                        color: "transparent"
                    }
                }
                validator: IntValidator { bottom:1; top: 1000}
                maximumLength: 10
                onActiveFocusChanged:
                {
                    if(activeFocus)
                    {
                        Ops.showCalculator(inputT1,"1","1000");
                    }
                }
                onDisplayTextChanged:
                {
                    if(optionTime ===1){
                        valueAxisX.max =(parseInt(inputT1.text)+ parseInt(inputT2.text))*2;
                        signalAxisX.max =(parseInt(inputT1.text)+ parseInt(inputT2.text))*2;
                    }
                    getLocalTn();
                }
                Component.onCompleted:
                {
                    if(optionTime ===1){
                        valueAxisX.max =(parseInt(inputT1.text)+ parseInt(inputT2.text))*2;
                        signalAxisX.max =(parseInt(inputT1.text)+ parseInt(inputT2.text))*2;
                    }
                    getLocalTn();
                }
                       }
        }
        Rectangle{
            x:4
            y: 393
            width:280
            height: 40
            color: "transparent"
            border.width: 1
            border.color: "#848385"
            radius:5
            Text {
                x:6
                y:5
                anchors.verticalCenter: parent.verticalCenter
                text: "T2"
                font.pixelSize:18
                color: "white"
            }
            Text{
                x:245
                text: "ms"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize:18
                color: "white"
            }
            TextField {
                id :inputT2
                anchors.fill: parent
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 35
                text: valueT2.toString();
                readOnly: true
                horizontalAlignment :TextInput.AlignRight
                font.pixelSize:18
                style:  TextFieldStyle {
                    textColor: "#95B3D7"
                    background: Rectangle {
                        color: "transparent"
                    }
                }
                maximumLength: 10
                validator: IntValidator { bottom:1; top: 1000}
                onActiveFocusChanged:
                {
                    if(activeFocus)
                    {
                        Ops.showCalculator(inputT2,"1","1000");
                    }
                }
                onDisplayTextChanged:
                {
                    if(optionTime ===1){
                        valueAxisX.max =(parseInt(inputT1.text)+ parseInt(inputT2.text))*2;
                        signalAxisX.max =(parseInt(inputT1.text)+ parseInt(inputT2.text))*2;
                    }
                    getLocalTn();
                }
                Component.onCompleted:
                {
                    if(optionTime ===1){
                        valueAxisX.max =(parseInt(inputT1.text)+ parseInt(inputT2.text))*2;
                        signalAxisX.max =(parseInt(inputT1.text)+ parseInt(inputT2.text))*2;
                    }
                    getLocalTn();
                }
            }
        }
        Rectangle{
            x:4
            y: 443
            width:280
            height: 40
            color: "transparent"
            border.width: 1
            border.color: "#848385"
            radius:5
            Text {
                x:6
                y:5
                anchors.verticalCenter: parent.verticalCenter
                text: "T3"
                font.pixelSize:18
                color: "white"
            }
            Text{
                x:245
                text: "ms"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize:18
                color: "white"
            }
            TextField {
                id: inputT3
                anchors.fill: parent
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 35
                text: valueT3
                readOnly: true
                horizontalAlignment :TextInput.AlignRight
                font.pixelSize:18
                style:  TextFieldStyle {
                    textColor: "#95B3D7"
                    background: Rectangle {
                        color: "transparent"
                    }
                }
                validator: IntValidator { bottom:1; top: 9999}
                maximumLength: 10
                onActiveFocusChanged:
                {
                    if(activeFocus)
                    {
                        Ops.showCalculator(inputT3,"1","9999");
                    }
                }
                onDisplayTextChanged:
                {
                    getLocalTn();
                }
                Component.onCompleted:
                {
                    getLocalTn();
                }
            }
        }
        Rectangle{
            x:4
            y: 493
            width:280
            height: 40
            color: "transparent"
            border.width: 1
            border.color: "#848385"
            radius:5
            Text {
                x:6
                y:5
                anchors.verticalCenter: parent.verticalCenter
                text: "T4"
                font.pixelSize:18
                color: "white"
            }
            Text{
                x:245
                text: "ms"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize:18
                color: "white"
            }
            TextField {
                id: inputT4
                //x: 60
                anchors.fill: parent
                anchors.verticalCenter: parent.verticalCenter
                text: valueT4
                readOnly: true
                horizontalAlignment :TextInput.AlignRight
                anchors.right: parent.right
                anchors.rightMargin: 35
                font.pixelSize:18
                style:  TextFieldStyle {
                    textColor: "#95B3D7"
                    background: Rectangle {
                        color: "transparent"
                    }
                }
                validator: IntValidator { bottom:1; top: 9999}
                maximumLength: 10
                onActiveFocusChanged:
                {
                    if(activeFocus)
                    {
                        Ops.showCalculator(inputT4,"0","120");
                    }
                }
                onDisplayTextChanged:
                {
                    getLocalTn();
                }
                Component.onCompleted:
                {
                    getLocalTn();
                }
            }
        }
        Rectangle{
            x:4
            y: 543
            width:280
            height: 40
            color: "transparent"
            border.width: 1
            border.color: "#848385"
            radius:5
            Text {
                x:6
                y:5
                anchors.verticalCenter: parent.verticalCenter
                text: "Filter Time"
                font.pixelSize:18
                color: "white"
            }
            Text{
                x:245
                text: "ms"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize:18
                color: "white"
            }
            TextField {
                id: txtfilterTime
                //x: 60
                anchors.fill: parent
                anchors.verticalCenter: parent.verticalCenter
                text: "1200"
                readOnly: true
                horizontalAlignment :TextInput.AlignRight
                anchors.right: parent.right
                anchors.rightMargin: 35
                font.pixelSize:18
                style:  TextFieldStyle {
                    textColor: "#95B3D7"
                    background: Rectangle {
                        color: "transparent"
                    }
                }
                validator: IntValidator { bottom:1; top: 1495}
                maximumLength: 10
                onActiveFocusChanged:
                {
                    if(activeFocus)
                    {
                        Ops.showCalculator(txtfilterTime,"1","1495");
                    }
                }
            }
        }
        StartSwitchControl{
            id: switchControl
            x:20
            y: 593
            onSwitchControl:{
                var isLeft =  switchControl.isLeft;
                switchLine.visible = !isLeft;
            }
        }
        SwitchLineUc{

            id: switchLine
            currentLineNo: 5
            x:60
            y:115
            visible: !switchControl.isLeft
        }
        Rectangle{
            id: recChart
            x:297
            y: 10
            width:730
            height: 620
            color: "transparent"
            border.width: 1
            border.color: "#848385"
            radius:5

            ChartView {
                id: weightChart
                legend.visible: false
                x:25
                y:100
                width: 730
                height: 410
                antialiasing: true
                backgroundColor:"transparent"
                ValueAxis {
                    id: valueAxisX
                    min:0
                    max: (parseInt(inputT1.text) + parseInt(inputT2.text))*2
                    gridVisible: false
                    labelsVisible: false
                    tickCount: 2
                }

                ValueAxis {
                    id:valueAxisY
                    min: -(inputRefVal.text*3)/9;
                    max: (inputRefVal.text*3)/2
                    tickCount:2
                    gridLineColor:"#585858"
                    minorTickCount:10
                    minorGridVisible: true
                    labelsVisible: false
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    propagateComposedEvents: true
                }
            }
            ChartView {
                id: signalChart
                x:25
                y: 450
                height:150
                width: 725
                antialiasing: true
                backgroundColor:"transparent"
                legend.visible : false
                ValueAxis {
                    id: signalAxisX
                    labelFormat: "%.0f"
                    min:0
                    max: (parseInt(inputT1.text) + parseInt(inputT2.text))*2
                    gridVisible: false
                    labelsColor: "white"
                    minorTickCount:4
                    minorGridVisible: false
                    tickCount: 4
                    labelsVisible: false
                }
                ValueAxis {
                    id:signalAxisY
                    minorGridVisible: false
                    min: -0.5
                    max: 2
                    gridLineColor:"#2E2E2E"
                    labelsColor: "white"
                    labelsVisible: false
                    gridVisible: false
                    tickCount: 2
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    propagateComposedEvents: true
                }
            }
            Component.onCompleted: {
                getLocalTn();
                var lineImport=[];
                var countLineImport =  Math.floor((Math.random() * 7) + 5);
                for(var i =0 ;i<countLineImport ; i++){
                    lineImport.push((Math.random() * 11) + 1);
                    var series = weightChart.createSeries(ChartView.SeriesTypeSpline,"",valueAxisX,valueAxisY);
                    var seriesSignal = signalChart.createSeries(ChartView.SeriesTypeLine,"",signalAxisX,signalAxisY);
                    for(var j=0;j<=10;j++){
                        series.append(j, Math.floor((Math.random() * 3) + 3));
                    }
                    if(i%2 ===0){
                        seriesSignal.append(0,0);
                        seriesSignal.append(1,0);
                        seriesSignal.append(1,1);
                        seriesSignal.append(2,1);
                        seriesSignal.append(2,0);
                        seriesSignal.append(3,0);
                        seriesSignal.append(3,1);
                        seriesSignal.append(4,1);
                        seriesSignal.append(5,1);
                        seriesSignal.append(5,0);
                        seriesSignal.append(6,0);
                        seriesSignal.append(6,1);
                        seriesSignal.append(7,1);
                        seriesSignal.append(8,1);
                        seriesSignal.append(8,0);
                        seriesSignal.append(9,0);
                        seriesSignal.append(10,0);
                    }
                    else{
                        seriesSignal.append(0,0);
                        seriesSignal.append(1,0);
                        seriesSignal.append(2,0);
                        seriesSignal.append(2,1);
                        seriesSignal.append(3,1);
                        seriesSignal.append(3,1);
                        seriesSignal.append(3,0);
                        seriesSignal.append(4,0);
                        seriesSignal.append(5,0);
                        seriesSignal.append(6,0);
                        seriesSignal.append(6,1);
                        seriesSignal.append(7,1);
                        seriesSignal.append(7,0);
                        seriesSignal.append(8,0);
                        seriesSignal.append(9,0);
                        seriesSignal.append(10,0);
                    }
                    if(i!=(countLineImport -1)){
                        series.width = 0.7;
                        seriesSignal.width = 0.5;
                    }
                    else{
                        indexlineActive = i;
                        series.width = 4;
                        seriesSignal.width = 2;
                    }
                    var color = getColor(i);
                    series.color = color;
                    seriesSignal.color = color;
                }
                var dateLineActive= adjustTimingScreen.updateListResultImportLine(lineImport).split(",");
                txtWeight.text = dateLineActive[1];
                switchLine.currentLineNo = dateLineActive[2];
                indexlineActive = dateLineActive[0];
            }

        }
        Text{
            x:330
            y:15
            text: "Weight"
            font.pixelSize:18
            color: "white"
        }
        Text{
            id: txtWeight
            x:460
            y:15
            text: "0.00"
            font.pixelSize:18
            color: "#d7b69a"
        }
        Text{
            x:505
            y:15
            text: "g"
            font.pixelSize:18
            color: "white"
        }
        Text{
            x:315
            y:510
            width: 50
            text: "Meas Signal"
            font.pixelSize:18
            color: "white"
            wrapMode: Text.WordWrap
        }
        Text{
            x:970
            y:540
            width: 50
            text: "t  ms"
            font.pixelSize:18
            color: "white"
        }
        Text{
            x:340
            y:110
            width: 50
            text: "y  g"

            font.pixelSize:18
            color: "white"
        }
        Rectangle{
            x: 300
            y:140
            id: inputMaxY
            border.color: "white"
            color: "transparent"
            radius: 2
            width:70
            height: 35
            TextField {
                id: txtAsisY_max
                width: parent.width
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                text: valueAxisY.max
                readOnly: true
                horizontalAlignment :TextInput.AlignRight
                font.pixelSize:18
                style:  TextFieldStyle {
                    textColor: "#95B3D7"
                    background: Rectangle {
                        color: "transparent"
                    }
                }
                maximumLength: 10
                validator: IntValidator { bottom:1; top: 9}
                onActiveFocusChanged:
                {
                    if(activeFocus)
                    {
                        Ops.showCalculator(txtAsisY_max,"1","9");
                    }
                }
                onDisplayTextChanged:
                {
                    if(parseInt(txtAsisY_max.text) <= valueAxisY.min){
                        txtAsisY_max.text = valueAxisY.max.toString();
                    }
                    else{
                        valueAxisY.max = parseInt(txtAsisY_max.text);
                        valueAxisY.min =parseInt(txtAsisY_min.text)-((valueAxisY.max - parseInt(txtAsisY_min.text))/9)*2;
                    }
                }
                Component.onCompleted:
                {
                    if(parseInt(txtAsisY_max.text) <= valueAxisY.min){
                        txtAsisY_max.text = valueAxisY.max.toString();
                    }
                    else{
                        valueAxisY.max = parseInt(txtAsisY_max.text);
                        valueAxisY.min =parseInt(txtAsisY_min.text)-((valueAxisY.max - parseInt(txtAsisY_min.text))/9)*2;
                    }
                }
            }
        }
        Rectangle{
            x: 300
            y:395
            id: inputMinY
            border.color: "white"
            color: "transparent"
            radius: 3
            width:70
            height: 35
            TextField {
                id:txtAsisY_min
                x:0
                y:0
                width: parent.width
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                text: "0"
                readOnly: true
                horizontalAlignment :TextInput.AlignRight
                font.pixelSize:18
                style:  TextFieldStyle {
                    textColor: "#95B3D7"
                    background: Rectangle {
                        color: "transparent"
                    }
                }
                maximumLength: 10
                validator: IntValidator { bottom:0; top: 18}
                onActiveFocusChanged:
                {
                    if(activeFocus)
                    {
                        Ops.showCalculator(txtAsisY_min,"0","18");
                    }
                }
                onDisplayTextChanged:
                {
                    if(parseInt(txtAsisY_min.text) >= valueAxisY.max){
                        txtAsisY_min.text = valueAxisY.min.toString();
                    }
                    else{
                        valueAxisY.min =parseInt(txtAsisY_min.text)-((valueAxisY.max - parseInt(txtAsisY_min.text))/9)*2;
                    }
                }
                Component.onCompleted:
                {
                    if(parseInt(txtAsisY_min.text) >= valueAxisY.max){
                        txtAsisY_min.text = valueAxisY.min.toString();
                    }
                    else{
                        valueAxisY.min =parseInt(txtAsisY_min.text)-((valueAxisY.max - parseInt(txtAsisY_min.text))/9)*2;
                    }
                }
            }
        }
        Rectangle{
            x: 305
            y:580
            id: inputMinX
            border.color: "white"
            color: "transparent"
            radius: 3
            width:70
            height:35
            TextField {
                id:txtAsisX_min
                width: parent.width
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                text: valueAxisX.min
                readOnly: true
                horizontalAlignment :TextInput.AlignRight
                font.pixelSize:18
                style:  TextFieldStyle {
                    textColor: "#95B3D7"
                    background: Rectangle {
                        color: "transparent"
                    }
                }
                maximumLength: 10
                validator: IntValidator { bottom:0; top: 580}
                onActiveFocusChanged:
                {
                    if(activeFocus)
                    {
                        Ops.showCalculator(txtAsisX_min,"0","580");
                    }
                }
                onDisplayTextChanged:
                {
                    if(parseInt(txtAsisX_min.text) >= valueAxisX.max){
                        txtAsisX_min.text = valueAxisX.min.toString();
                    }
                    else{
                        valueAxisX.min = parseInt(txtAsisX_min.text);
                        signalAxisX.min = parseInt(txtAsisX_min.text);
                    }
                    getLocalTn();
                }
                Component.onCompleted:
                {
                    if(parseInt(txtAsisX_min.text) >= valueAxisX.max){
                        txtAsisX_min.text = valueAxisX.min.toString();
                    }
                    else{
                        valueAxisX.min = parseInt(txtAsisX_min.text);
                        signalAxisX.min = parseInt(txtAsisX_min.text);
                    }
                    getLocalTn();
                }
            }
        }
        Rectangle{
            x: 936
            y:580
            id: inputMaxX
            border.color: "white"
            color: "transparent"
            radius: 2
            width:70
            height: 35
            TextField {
                id: txtAsisX_max
                width: parent.width
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                text: valueAxisX.max
                readOnly: true
                horizontalAlignment :TextInput.AlignRight
                font.pixelSize:18
                style:  TextFieldStyle {
                    textColor: "#95B3D7"
                    background: Rectangle {
                        color: "transparent"
                    }
                }
                maximumLength: 10
                validator: IntValidator { bottom:0; top: 20000}
                onActiveFocusChanged:
                {
                    if(activeFocus)
                    {
                        Ops.showCalculator(txtAsisX_max,"0","100");
                    }
                }
                onDisplayTextChanged:
                {
                    if(parseInt(txtAsisX_max.text) <= valueAxisX.min){
                        txtAsisX_max.text = valueAxisX.max.toString();
                    }
                    else{
                        valueAxisX.max = parseInt(txtAsisX_max.text);
                        signalAxisX.max = parseInt(txtAsisX_max.text);
                    }
                    getLocalTn();
                }
                Component.onCompleted:
                {
                    if(parseInt(txtAsisX_max.text) <= valueAxisX.min){
                        txtAsisX_max.text = valueAxisX.max.toString();
                    }
                    else{
                        valueAxisX.max = parseInt(txtAsisX_max.text);
                        signalAxisX.max = parseInt(txtAsisX_max.text);
                    }
                    getLocalTn();
                }
            }
        }
        Text{
            color: "white"
            x: 760
            y: 580
            id: valueAsisX1
            horizontalAlignment: Text.Center
            width: 80
            text:parseInt((parseInt(txtAsisX_max.text) - parseInt(txtAsisX_min.text))*2/3) + parseInt(txtAsisX_min.text)
            font.pixelSize:16
        }
        Text{
            color: "white"
            x: 550
            y: 580
            width: 80
            horizontalAlignment: Text.Center
            id: valueAsisX2
            text:parseInt((parseInt(txtAsisX_max.text) - parseInt(txtAsisX_min.text))/3) + parseInt(txtAsisX_min.text);
            font.pixelSize:16
        }
        Text{
            color: "white"
            x: 330
            y: 310
            width: 40
            id: valueAsisY2
            horizontalAlignment: Text.AlignRight
            text:parseInt((parseInt(txtAsisY_max.text) - parseInt(txtAsisY_min.text))/3) +parseInt(txtAsisY_min.text)
            font.pixelSize:16
        }
        Text{
            color: "white"
            x: 330
            y: 220
            id: valueAsisY1
            width: 40
            horizontalAlignment:Text.AlignRight
            text: parseInt((parseInt(txtAsisY_max.text) - parseInt(txtAsisY_min.text))*2/3) +parseInt(txtAsisY_min.text);
            font.pixelSize:16
        }
        ListModel {
            id: listTime
            ListElement {
                title: "(T1+T2)*2"
            }
            ListElement {
                title: "50 ms"
            }
            ListElement {
                title: "100 ms"
            }
            ListElement {
                title: "200 ms"
            }
        }
        ListModel {
            id: listMeasTiming
            ListElement {
                title: "Auto"
            }
            ListElement {
                title: "Manual"
            }
        }
        CateListDialog{
            id: settingTime
            x: 397
            y: 100
            title: "Time"
            visible: false
            source: listTime
            value: statusBarItem.normalStatusBar.getValueTime()
        }
        CateListDialog{
            id: settingMeasTiming
            x: 397
            y: 100
            visible: false
            indexSelect: 1
            source: listMeasTiming
        }
        Rectangle{
            x: 450
            y: 50
            width:490
            height:60
            color: "transparent"
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    var result = adjustTimingScreen.changeLineActive(mouseX,mouseY);
                    if(result !==""){
                        result = result.split(",");
                        if( parseInt(result[0])!== 0){
                            if(!switchControl.isLeft){
                                switchLine.currentLineNo = parseInt(result[0]);
                            }
                            txtWeight.text = result[1];
                            indexlineActive = result[2];
                            for(var i = 0;i< weightChart.count; i++){
                                var obj = weightChart.series(i);
                                if(i === parseInt(indexlineActive)){
                                    obj.width = 4;
                                }
                                else{
                                    obj.width = 0.7;
                                }
                            }
                            for(var j = 0;j< signalChart.count; j++){
                                var obj1 = signalChart.series(j);
                                if(j === parseInt(indexlineActive)){
                                    obj1.width = 2;
                                }
                                else{
                                    obj1.width = 0.5;
                                }
                            }
                        }
                    }
                }
            }
        }
        function showDialog(){
            settingTime.source = listTime;
            settingTime.visible = true;
        }
        function clearScale(){
            valueAxisX.min =0;
            valueAxisY.min = -(inputRefVal.text*3)/9;
            valueAxisY.max = parseInt(inputRefVal.text)*1.5
            if(optionTime ==1){
                valueAxisX.max = (parseInt(inputT1.text) + parseInt(inputT2.text))*2;
                signalAxisX.max = (parseInt(inputT1.text) + parseInt(inputT2.text))*2;
            }
            else if(optionTime ==2){
                valueAxisX.max = 50;
                signalAxisX.max = 50;
            }
            else if(optionTime ==3){
                valueAxisX.max = 100;
                signalAxisX.max = 100;
            }
            else{
                valueAxisX.max = 200;
                signalAxisX.max = 200;
            }
            txtAsisX_min.text = valueAxisX.min.toString();
            txtAsisY_min.text = 0;
            txtAsisX_max.text = valueAxisX.max.toString();
            txtAsisY_max.text = valueAxisY.max.toString();
            getLocalTn();
        }
        function setAsisX(value){
            switch(value.toString()){
            case "(T1+T2)*2":
                txtAsisX_max.text = ((parseInt(inputT1.text) + parseInt(inputT2.text))*2).toString();
                optionTime = 1;
                break;
            case "50 ms" :
                txtAsisX_max.text =50;
                optionTime = 2;
                break;
            case "100 ms" :
                txtAsisX_max.text =100;
                optionTime= 3;
                break;
            case "200 ms" :
                txtAsisX_max.text =200;
                optionTime = 4;
                break;
            default: break;
            }
            signalAxisX.max =txtAsisX_max.text;
            valueAxisX.max = txtAsisX_max.text;
            getLocalTn();
            statusBarItem.normalStatusBar.updateSettingTime(value.toString());
        }
        function updateOptionMeasTiming(value){
            txtOptionMeasTiming.text = value;
        }
        function updateTextInput(sInput) {
            txtProdLen.text = sInput;
        }
        function clearLineNoLegend(){
            var result =  adjustTimingScreen.clearLegend(switchControl.isLeft).split(",");
            if(result[0] !== "-1"){
                if(!switchControl.isLeft){
                    switchLine.currentLineNo = parseInt(result[3]);
                    weightChart.removeSeries(weightChart.series(parseInt(result[0]-1)));
                    signalChart.removeSeries(signalChart.series(parseInt(result[0]-1)));
                    txtWeight.text = result[2];
                    if(parseInt(result[1]) !==0){
                        weightChart.series(parseInt(result[1]-1)).width = 4;
                        signalChart.series(parseInt(result[1]-1)).width = 2;
                    }
                    for (var i= 0;i< weightChart.count;i++){
                        var seriesObj = weightChart.series(i);
                        seriesObj.color = getColor(i);
                    }
                    for (var j= 0;j< signalChart.count;j++){
                        var seriesObjSignal = signalChart.series(j);
                        seriesObjSignal.color = getColor(j);
                    }
                }
                else{
                    switchLine.currentLineNo = parseInt(result[2]);
                    txtWeight.text = parseInt(result[1]);
                    weightChart.removeAllSeries();
                    signalChart.removeAllSeries();
                }
            }
        }

    }
    function getLocalTn(){
        var maxX = 1010;
        var originX = 378;
        var originY = 574;
        var scale = (maxX-originX)/(parseInt(valueAxisX.max)- parseInt(valueAxisX.min));
        var localTn = [];
        var localT1 = originX + parseInt(scale*(parseInt(inputT1.text)));
        var localT2 = localT1 + parseInt(scale*(parseInt(inputT2.text)));
        var localT3 = localT2 + parseInt(scale*(parseInt(inputT3.text)));
        var localT4 = localT3 + parseInt(scale*(parseInt(inputT4.text)));
        localTn.push(originY);
        localTn.push(localT1);
        localTn.push(localT2);
        localTn.push(localT3);
        localTn.push(localT4);
        localTn.push(maxX);
        localTn.push(originX);
        adjustTimingScreen.setDrawTn(localTn);
    }
    function getColor(index){
        var color;
        switch(index){
        case 0: color= "#FF0000";break;
        case 1: color= "#FFFF00";break;
        case 2: color= "#008B45";break;
        case 3: color= "#0000FF";break;
        case 4: color= "#00BFFF";break;
        case 5: color= "#FF6A6A";break;
        case 6: color= "#FF7F24";break;
        case 7: color= "#CD1076";break;
        case 8: color= "#FFFFFF";break;
        case 9: color= "#8B4726";break;
        case 10: color= "#00FF00";break;
        case 11: color= "#848385";break;
        default: color= "white";break;
        }
        return color;
    }
}

