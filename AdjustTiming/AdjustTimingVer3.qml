import QtQuick 2.5
import ControlApp 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.2 as Controls
import QtCharts 2.1
import "../Dialog"
import "../Control/VirtualKey.js" as Ops

Item {

    property AdjustTimingVer3 timAdjObj: adjTimeVer3
    property CateListDialog objSettingTime: settingTime
    property int valueT1: 2
    property int valueT2: 2
    property int valueT3: 2
    property int valueT4: 2
    property int valueT7: 3
    property int valueT9: 2
    property int valueRefVal:6
    property int currentLine: 1
    property string sourceImage: ""
    property real widthGraph: 0
    property int  optionTime : 1;
    property int  indexlineActive :0;
    property int heightPanelItem: 45
    property int spaceItem: 10

    AdjustTimingVer3{
        width: 1024
        height: 640
        id: adjTimeVer3
        Rectangle{
            x:4
            y: 4
            width:280
            height: 125
            color: "transparent"
            border.width: 1
            border.color: "#848385"
            radius:5
            Text {
                id:txtProd
                x:6
                y:5
                text: "品種"
                font.pixelSize:18
                font.family: "MS Gothic"
                color: "white"
            }
            Text {
                x:6
                y:40
                text: "サンプル"
                font.pixelSize:18
                font.family: "MS Gothic"
                color: "white"
            }
            Text {
                x:104
                y: 15
                text: "050"
                font.pixelSize:34
                font.family: "MS Gothic"
                color: "white"
            }

        }
        Rectangle{
            id: itemPanel1
            x:4
            y: 150
            width:280
            height: heightPanelItem
            color: "transparent"
            border.width: 1
            border.color: "#848385"
            radius:5
            Text {
                x:6
                y:5
                anchors.verticalCenter: parent.verticalCenter
                text: "基準値"
                font.pixelSize:18
                font.family: "MS Gothic"
                color: "white"
            }
            Text{
                x:260
                anchors.verticalCenter: parent.verticalCenter
                text: "g"
                font.pixelSize:18
                font.family: "MS Gothic"
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
                font.family: "MS Gothic"
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
            id: itemPanel2
            x:4
            y: itemPanel1.y +itemPanel1.height+ spaceItem
            width:280
            height: heightPanelItem
            color: "transparent"
            border.width: 1
            border.color: "#848385"
            radius:5
            Text {
                x:6
                y:5
                anchors.verticalCenter: parent.verticalCenter
                text: "製品長さ"
                font.family: "MS Gothic"
                font.pixelSize:18
                color: "white"
            }
            Text{
                x:240
                anchors.verticalCenter: parent.verticalCenter
                text: "mm"
                font.family: "MS Gothic"
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
                font.family: "MS Gothic"
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
            id: itemPanel3
            x:4
            y: itemPanel2.y +itemPanel2.height+ spaceItem
            width:280
            height: heightPanelItem
            color: "transparent"
            border.width: 1
            border.color: "#848385"
            radius:5
            Text {
                x:6
                y:5
                text: "T7"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize:18
                font.family: "MS Gothic"
                color: "white"
            }
            Text{
                x:245
                anchors.verticalCenter: parent.verticalCenter
                text: "ms"
                font.pixelSize:18
                font.family: "MS Gothic"
                color: "white"
            }
            TextField {
                id: inputT7
                anchors.fill: parent
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 35
                text:valueT7.toString();
                readOnly: true
                horizontalAlignment :TextInput.AlignRight
                font.pixelSize:18
                font.family: "MS Gothic"
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
                        Ops.showCalculator(inputT7,"1","1000");
                    }
                }
                onDisplayTextChanged:
                {
//                    if(optionTime ===1){
//                        valueAxisX.max =(parseInt(inputT7.text)+ parseInt(inputT2.text))*2;
//                        signalAxisX.max =(parseInt(inputT7.text)+ parseInt(inputT2.text))*2;
//                    }
                    getLocalTn();
                }
                Component.onCompleted:
                {
//                    if(optionTime ===1){
//                        valueAxisX.max =(parseInt(inputT7.text)+ parseInt(inputT2.text))*2;
//                        signalAxisX.max =(parseInt(inputT7.text)+ parseInt(inputT2.text))*2;
//                    }
                    getLocalTn();
                }
            }
        }

        Rectangle{
            id: itemPanel4
            x:4
            y: itemPanel3.y +itemPanel3.height+ spaceItem
            width:280
            height: heightPanelItem
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
                font.family: "MS Gothic"
                color: "white"
            }
            Text{
                x:245
                anchors.verticalCenter: parent.verticalCenter
                text: "ms"
                font.pixelSize:18
                font.family: "MS Gothic"
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
                font.family: "MS Gothic"
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
            id: itemPanel5
            x:4
            y: itemPanel4.y +itemPanel4.height+ spaceItem
            width:280
            height: heightPanelItem
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
                font.family: "MS Gothic"
                color: "white"
            }
            Text{
                x:245
                text: "ms"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize:18
                font.family: "MS Gothic"
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
                font.family: "MS Gothic"
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
            id: itemPanel6
            x:4
            y: itemPanel5.y +itemPanel5.height+ spaceItem
            width:280
            height: heightPanelItem
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
                font.family: "MS Gothic"
                color: "white"
            }
            Text{
                x:245
                text: "ms"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize:18
                font.family: "MS Gothic"
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
                font.family: "MS Gothic"
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
            id: itemPanel7
            x:4
            y: itemPanel6.y +itemPanel6.height+ spaceItem
            width:280
            height: heightPanelItem
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
                font.family: "MS Gothic"
                color: "white"
            }
            Text{
                x:245
                text: "ms"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize:18
                font.family: "MS Gothic"
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
                font.family: "MS Gothic"
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
            id: itemPanel8
            x:4
            y: itemPanel7.y +itemPanel7.height+ spaceItem
            width:280
            height: heightPanelItem
            color: "transparent"
            border.width: 1
            border.color: "#848385"
            radius:5
            Text {
                x:6
                y:5
                anchors.verticalCenter: parent.verticalCenter
                text: "T9"
                font.pixelSize:18
                font.family: "MS Gothic"
                color: "white"
            }
            Text{
                x:245
                text: "ms"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize:18
                font.family: "MS Gothic"
                color: "white"
            }
            TextField {
                id: inputT9
                //x: 60
                anchors.fill: parent
                anchors.verticalCenter: parent.verticalCenter
                text: valueT9.toString()
                readOnly: true
                horizontalAlignment :TextInput.AlignRight
                anchors.right: parent.right
                anchors.rightMargin: 35
                font.pixelSize:18
                font.family: "MS Gothic"
                style:  TextFieldStyle {
                    textColor: "#95B3D7"
                    background: Rectangle {
                        color: "transparent"
                    }
                }
                validator: IntValidator { bottom:1; top: 999}
                maximumLength: 10
                onActiveFocusChanged:
                {
                    if(activeFocus)
                    {
                        Ops.showCalculator(txtfilterTime,"0","50");
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
            id: itemPanel9
            x:4
            y: itemPanel8.y +itemPanel8.height+ spaceItem
            width:280
            height: heightPanelItem
            color: "transparent"
            border.width: 1
            border.color: "#848385"
            radius:5
            Text {
                x:6
                y:5
                anchors.verticalCenter: parent.verticalCenter
                text: "フィルタ時間"
                font.pixelSize:18
                font.family: "MS Gothic"
                color: "white"
            }
            Text{
                x:245
                text: "ms"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize:18
                font.family: "MS Gothic"
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
                font.family: "MS Gothic"
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

        Rectangle{
            id:chartArea
            x: 300
            y: 4
            width: 720
            height: 632
            color: "transparent"
            border.width: 1
            border.color: "#848385"
            radius:5

            Rectangle{
                id: rectWeight
                x: 25
                y:10
                width: 120
                height: 30
                color: "transparent"
                Text {
                    id: txtWeight
                    anchors.centerIn: parent
                    font.pixelSize: 20
                    text: qsTr("質量値")
                    font.family: "MS Gothic"
                    color: "white"
                }
            }
            Rectangle{
                id: weight
                x: rectWeight.x+ rectWeight.width
                y:10
                width: 80
                height: 30
                color: "transparent"
                Text {
                    id: txtValueWeight
                    anchors.centerIn: parent
                    font.pixelSize: 20
                    text: qsTr("3.25")
                    font.family: "MS Gothic"
                    color: "#F4A460"
                }
            }
            Rectangle{
                id: rectGram
                x: rectWeight.x+ rectWeight.width +80
                y:10
                width: 40
                height: 30
                color: "transparent"
                Text {
                    id: txtGram
                    anchors.centerIn: parent
                    font.pixelSize: 20
                    font.family: "MS Gothic"
                    text: qsTr("g")
                    color: "white"
                }
            }

            Rectangle{
                id: rectUnitY
                x: 410
                y:10
                width: 40
                height: 30
                color: "transparent"
                Text {
                    id: txtUnitY
                    anchors.centerIn: parent
                    font.pixelSize: 20
                    text: qsTr("y : ")
                    font.family: "MS Gothic"
                    color: "white"
                }
            }
            Rectangle{
                id: rectUnitYY
                x: rectUnitY.x +rectUnitY.width +80
                y:10
                width: 80
                height: 30
                color: "transparent"
                Text {
                    id: txtUnitYY
                    anchors.centerIn: parent
                    font.pixelSize: 20
                    font.family: "MS Gothic"
                    text: qsTr("g/div")
                    color: "white"
                }
            }
            Rectangle{
                id: rectValueY
                x: rectUnitY.x+ rectUnitY.width
                y:10
                width: 80
                height: 30
                color: "transparent"
                Text {
                    id: txtValueY
                    anchors.centerIn: parent
                    font.pixelSize: 20
                    font.family: "MS Gothic"
                    text: qsTr("19.00")
                    color: "#F4A460"
                }
            }
            Rectangle{
                id: rectUnitT
                x: 410
                y:50
                width: 40
                height: 30
                color: "transparent"
                Text {
                    id: txtUnitT
                    anchors.centerIn: parent
                    font.pixelSize: 20
                    font.family: "MS Gothic"
                    text: qsTr("t : ")
                    color: "white"
                }
            }
            Rectangle{
                id: rectUnitTT
                x: rectUnitY.x +rectUnitY.width +80
                y:50
                width: 80
                height: 30
                color: "transparent"
                Text {
                    id: txtUnitTT
                    anchors.centerIn: parent
                    font.pixelSize: 20
                    font.family: "MS Gothic"
                    text: qsTr("ms/div")
                    color: "white"
                }
            }
            Rectangle{
                id: rectValueT
                x: rectUnitT.x+ rectUnitT.width
                y:50
                width: 80
                height: 30
                color: "transparent"
                Text {
                    id: txtValueT
                    anchors.centerIn: parent
                    font.pixelSize: 20
                    font.family: "MS Gothic"
                    text: qsTr("100")
                    color: "#F4A460"
                }
            }


            ChartView{
                id: weightChart
                legend.visible: false
                x:50
                y:100
                width: 695
                height: 400
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
                x:50
                y: 450
                height:150
                width: 690
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
                drawCharts()

                //var dateLineActive= adjustTimingScreen.updateListResultImportLine(lineImport).split(",");
//                txtWeight.text = dateLineActive[1];
//                switchLine.currentLineNo = dateLineActive[2];
//                indexlineActive = dateLineActive[0];
            }
        }
        Rectangle{
            x: 325
            y:380
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
                font.family: "MS Gothic"
                style:  TextFieldStyle {
                    textColor: "#95B3D7"
                    background: Rectangle {
                        color: "transparent"
                    }
                }
                maximumLength: 10
                validator: IntValidator { bottom:0; top: 8}
                onActiveFocusChanged:
                {
                    if(activeFocus)
                    {
                        Ops.showCalculator(txtAsisY_min,"0","8");
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
            x: 325
            y:150
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
                text: "9"
                readOnly: true
                horizontalAlignment :TextInput.AlignRight
                font.pixelSize:18
                font.family: "MS Gothic"
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
            x: 325
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
                font.family: "MS Gothic"
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
            x: 910
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
                //text: valueAxisX.max
                text: "16"
                readOnly: true
                horizontalAlignment :TextInput.AlignRight
                font.pixelSize:18
                font.family: "MS Gothic"
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
            x: 750
            y: 580
            id: valueAsisX1
            horizontalAlignment: Text.Center
            width: 80
            text:parseInt((parseInt(txtAsisX_max.text) - parseInt(txtAsisX_min.text))*2/3) + parseInt(txtAsisX_min.text)
            font.pixelSize:16
            font.family: "MS Gothic"
        }
        Text{
            color: "white"
            x: 540
            y: 580
            width: 80
            horizontalAlignment: Text.Center
            id: valueAsisX2
            text:parseInt((parseInt(txtAsisX_max.text) - parseInt(txtAsisX_min.text))/3) + parseInt(txtAsisX_min.text);
            font.pixelSize:16
            font.family: "MS Gothic"
        }

        Text{
            color: "white"
            x: 350
            y: 303
            width: 40
            id: valueAsisY2
            horizontalAlignment: Text.AlignRight
            text:parseInt((parseInt(txtAsisY_max.text) - parseInt(txtAsisY_min.text))/3) +parseInt(txtAsisY_min.text)
            font.pixelSize:16
            font.family: "MS Gothic"
        }

        Text{
            color: "white"
            x: 350
            y: 226
            id: valueAsisY1
            width: 40
            horizontalAlignment:Text.AlignRight
            text: parseInt((parseInt(txtAsisY_max.text) - parseInt(txtAsisY_min.text))*2/3) +parseInt(txtAsisY_min.text);
            font.pixelSize:16
            font.family: "MS Gothic"
        }
        Text {
            id: nameAxisX
            color: "white"
            x: 960
            y: 580
            width: 80
            horizontalAlignment: Text.Center
            font.pixelSize:16
            text: "t"
            font.family: "MS Gothic"
        }
        Text {
            id: nameAxisY
            color: "white"
            x: 350
            y: 120
            width: 40
            horizontalAlignment:Text.AlignRight
            font.pixelSize:16
            text: "y"
            font.family: "MS Gothic"
        }
        Rectangle{
            id: redBtn
            x:500
            y:570
            width: 25
            height: 25
            color: "transparent"
            visible: false
            Image {
                anchors.fill: parent
                id: redIcon
                source: "qrc:/Images/red_triangle.png"
            }
        }
        Rectangle{
            id: grayBtn
            x:600
            y:570
            width: 25
            height: 25
            color: "transparent"
            visible: false
            Image {
                anchors.fill: parent
                id: grayIcon
                source: "qrc:/Images/gray_triangle.png"
            }
        }

        function showDialogSettingTime(){
            settingTime.source = listTime;
            settingTime.visible = true;
        }

        function showDialogVerticalRange(){
            settingRange.source = listVerticalRange;
            settingRange.visible = true;
        }

        function showDialogMeasTiming(){
            settingMeasTiming.source=listMeasTiming;
            settingMeasTiming.visible=true;
        }

        function showDialogSignalPhoto(){
            displaySignal.visible=true;
        }

        function clearCharts()
        {
            clearLineNoLegend()
        }
        function autoScale(){
            clearScale()
        }
        function updateTextInput(sInput) {
            txtProdLen.text = sInput;
        }
    }

    ListModel {
        id: listTime
        ListElement {
            title: "(T1+T2)*2"
        }
        ListElement {
            title: "標準"
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
            title: "自動"
        }
        ListElement {
            title: "手動"
        }
    }

    ListModel {
        id:listSignalType
        ListElement {
            title: "装置内信号"
        }
        ListElement {
            title: "入力信号"
        }
        ListElement {
            title: "出力信号"
        }
    }

    ListModel {
        id: listSignalPhoto
        ListElement {
            title: "Photo(W1)"
        }
        ListElement {
            title: "Photo(RJ3)"
        }
        ListElement {
            title: "Photo(RJ1)"
        }
    }
    ListModel {
        id: listSignalInput
        ListElement {
            title: "INA1"
        }
        ListElement {
            title: "INA2"
        }
        ListElement {
            title: "INM1"
        }
        ListElement {
            title: "INM2"
        }
    }
    ListModel {
        id: listSignalOutput
        ListElement {
            title: "OUTA1"
        }
        ListElement {
            title: "OUTA2"
        }
        ListElement {
            title: "OUTM1"
        }
        ListElement {
            title: "OUTN1"
        }
        ListElement {
            title: "OUTN2"
        }
        ListElement {
            title: "OUTN3"
        }
    }
    ListModel {
        id: listVerticalRange
        ListElement {
            title: "オートレンジ基準"
        }
        ListElement {
            title: "オートレンジ全体"
        }
        ListElement {
            title: "レンジ固定"
        }
        ListElement {
            title: "レンジ2倍"
        }
        ListElement {
            title: "レンジ4倍"
        }
        ListElement {
            title: "レンジ8倍"
        }
    }

    CateListDialog{
        id: settingTime
        x: 397
        y: 100
        title: "Time"
        visible: false
        source: listTime
        indexSelect: 0
        onSend: {
            statusBarItem.normalStatusBar.settingValueTime(value)
        }

    }
    CateListDialog{
        id: settingRange
        x: 397
        y: 100
        title: "縦レンジ"
        visible: false
        source: listVerticalRange
        onSend: {
            statusBarItem.normalStatusBar.updateVerticalRange(value)
        }
    }
    CateListDialog{
        id: settingMeasTiming
        x: 397
        y: 100
        visible: false
        indexSelect: 0
        source: listMeasTiming
        onSend: {
            bottomBarItem.bottomBarAdjustTiming.settingValueMeasTime(value)
        }
        onIndexSelectChanged: {
            var curIndexMeas =settingMeasTiming.settingDialog.getCurrentIndex()
            console.log(curIndexMeas + "aaaa")
            if(curIndexMeas ===1){
                clearScale()
                redBtn.visible=false
                grayBtn.visible=false
            }
            else if(curIndexMeas ===2){
                redBtn.visible=true
                grayBtn.visible=true
            }
        }
    }

    Rectangle{
        id: displaySignal
        x: 397
        y: 100
        visible: false
        color: "transparent"
        width: 626
        height: 480

        CateListDialogVer2{
            id: selectSignal
            x:0
            y:0
            sizeWidth: 313
            sizeHeight: 400
            indexSelect: 0
            title: "種別"
            source: listSignalType
            onIndexSelectChanged: {
                var curIndex =selectSignal.settingDialog.getCurrentIndex()
                if(curIndex ===1){
                    selectPhoto.source = listSignalPhoto
                }
                else if(curIndex===2){
                    selectPhoto.source=listSignalInput
                }
                else if(curIndex===3){
                    selectPhoto.source=listSignalOutput
                }
                console.log(curIndex)
            }


        }
        CateListDialogVer2{
            id: selectPhoto
            x:313
            y:0
            sizeWidth: 313
            sizeHeight: 400
            indexSelect: 1
            title: "信号名"
            source: listSignalPhoto
        }
        Rectangle{
            x: 0
            y:400
            width: 626
            height: 80
            color: "#696969"
            visible: true
            Rectangle{
                x: 50
                y:10
                width: 100
                height: 60
                color: "transparent"
                radius: 6
                Image {
                    id:imgOK
                    source: "../Images/keyboard_btn_okcancel.png"
                    anchors.fill: parent
                    Text {
                        text: "OK"
                        font.pixelSize:24
                        font.family: "MS Gothic"
                        color: "white"
                        anchors.centerIn: parent
                        anchors.horizontalCenter: Text.horizontalCenter
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: {
                            imgOK.source = "../Images/keyboard_btn_touched_okcancel.png"
                            clearLineNoLegend()
                        }
                        onReleased:{
                            imgOK.source = "../Images/keyboard_btn_okcancel.png";
                            console.log(selectPhoto.settingDialog)
                            selectPhoto.settingDialog.pressBtnOK()
                            statusBarItem.normalStatusBar.updateSignal(selectPhoto.value)
                            txtSignalName.text=selectPhoto.value
                            displaySignal.visible=false
                            drawCharts()

                        }
                        onCanceled:
                        {
                            imgOK.source = "../Images/keyboard_btn_okcancel.png";
                        }
                    }
                }
            }
            Rectangle{
                x:476
                y:10
                width: 100
                height: 60
                color: "transparent"
                radius: 6
                Image {
                    id:imgCancel
                    source: "../Images/keyboard_btn_okcancel.png"
                    anchors.fill: parent
                    Text {
                        text: "CANCEL"
                        font.pixelSize:24
                        font.family: "MS Gothic"
                        color: "white"
                        anchors.centerIn: parent
                        anchors.horizontalCenter: Text.horizontalCenter
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: {
                            imgCancel.source = "../Images/keyboard_btn_touched_okcancel.png"
                        }
                        onReleased:{
                            displaySignal.visible=false
                        }
                        onCanceled:
                        {
                            imgCancel.source = "../Images/keyboard_btn_okcancel.png";
                        }
                    }
                }
            }
        }
    }

    Rectangle{
        id:showSignal
        x: 305
        y: 510
        color: "transparent"
        width: 95
        height: 35
        Text {
            anchors.centerIn: parent
            id: txtSignalName
            font.pixelSize: 20
            font.family: "MS Gothic"
            color: "white"
            text: "Photo(W1)"
        }
    }

    function setAsisX(value){
        switch(value.toString()){
        case "(T1+T2)*2":
            txtAsisX_max.text = ((parseInt(inputT1.text) + parseInt(inputT2.text))*2).toString();
            optionTime = 1;
            break;
        case "標準" :
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
    function getLocalTn(){
        var maxX = 990;
        var originX = 358;
        var originY = 574;
        var scale = (maxX-originX)/(parseInt(valueAxisX.max)- parseInt(valueAxisX.min));
        var localTn = [];
        var localT1 = originX + parseInt(scale*(parseInt(inputT1.text)));
        var localT2 = localT1 + parseInt(scale*(parseInt(inputT2.text)));
        var localT3 = localT2 + parseInt(scale*(parseInt(inputT3.text)));
        var localT4 = localT3 + parseInt(scale*(parseInt(inputT4.text)));
        var localT7 = localT4 + parseInt(scale*(parseInt(inputT7.text)));
        var localT9 = localT7 + parseInt(scale*(parseInt(inputT9.text)));
        localTn.push(originY);
        localTn.push(localT1);
        localTn.push(localT2);
        localTn.push(localT3);
        localTn.push(localT4);
        localTn.push(localT7);
        localTn.push(localT9);
        localTn.push(maxX);
        localTn.push(originX);
        timAdjObj.setDrawTn(localTn);
    }
    function drawCharts(){
        getLocalTn()
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
    }

    function clearLineNoLegend(){
        weightChart.removeAllSeries();
        signalChart.removeAllSeries();
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
