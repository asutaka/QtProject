import QtQuick 2.5
import ControlApp 1.0
import CommonControl 1.0
import CommonModule 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.2 as Controls
import QtCharts 2.1
import "../Dialog"
import "../Control/VirtualKey.js" as Ops
import "../Control"

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
    property int  preSignal: selectSignal.indexSelect
    property string preAsisY_min: txtAsisY_min.text
    property int preSelectLegend: 0

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
                font.family: "Noto Sans CJK JP DemiLight "
                color: "white"
            }
            Text {
                x:6
                y:40
                text: "サンプル"
                font.pixelSize:18
                font.family: "Noto Sans CJK JP DemiLight "
                color: "white"
            }
            Text {
                x:104
                y: 15
                text: "050"
                font.pixelSize:34
                font.family: "Noto Sans CJK JP DemiLight "
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
                font.family: "Noto Sans CJK JP DemiLight"
                color: "white"
            }
            Text{
                x:260
                anchors.verticalCenter: parent.verticalCenter
                text: "g"
                font.pixelSize:18
                font.family: "Noto Sans CJK JP DemiLight "
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
                font.family: "Noto Sans CJK JP DemiLight "
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
                    text = Math.round(text)
                    weightChart.maxY = parseInt(inputRefVal.text)*1.5;
                    weightChart.minY =parseInt(txtAsisY_min.text)-((weightChart.maxY - parseInt(txtAsisY_min.text))/9)*2;
                }
                Component.onCompleted:
                {
                    weightChart.maxY = parseInt(inputRefVal.text)*1.5;
                    weightChart.minY =parseInt(txtAsisY_min.text)-((weightChart.maxY - parseInt(txtAsisY_min.text))/9)*2;
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
                font.family: "Noto Sans CJK JP DemiLight "
                font.pixelSize:18
                color: "white"
            }
            Text{
                x:240
                anchors.verticalCenter: parent.verticalCenter
                text: "mm"
                font.family: "Noto Sans CJK JP DemiLight "
                font.pixelSize:18
                color: "white"
            }
            TextField {
                id: txtProdLen
                anchors.fill: parent
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 40
                text: "160"
                readOnly: true
                horizontalAlignment :TextInput.AlignRight
                font.pixelSize:18
                font.family: "Noto Sans CJK JP DemiLight "
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
                        Ops.showCalculator(txtProdLen,"1","1000");
                    }
                }
                onDisplayTextChanged:
                {
                    text = Math.round(text)
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
                font.family: "Noto Sans CJK JP DemiLight "
                color: "white"
            }
            Text{
                x:245
                anchors.verticalCenter: parent.verticalCenter
                text: "ms"
                font.pixelSize:18
                font.family: "Noto Sans CJK JP DemiLight "
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
                font.family: "Noto Sans CJK JP DemiLight "
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
                    text = Math.round(text)
//                    if(optionTime ===1){
//                        weightChart.maxX =(parseInt(inputT7.text)+ parseInt(inputT2.text))*2;
//                        signalChart.maxX =(parseInt(inputT7.text)+ parseInt(inputT2.text))*2;
//                    }
                    getLocalTn();
                }
                Component.onCompleted:
                {
//                    if(optionTime ===1){
//                        weightChart.maxX =(parseInt(inputT7.text)+ parseInt(inputT2.text))*2;
//                        signalChart.maxX =(parseInt(inputT7.text)+ parseInt(inputT2.text))*2;
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
                font.family: "Noto Sans CJK JP DemiLight "
                color: "white"
            }
            Text{
                x:245
                anchors.verticalCenter: parent.verticalCenter
                text: "ms"
                font.pixelSize:18
                font.family: "Noto Sans CJK JP DemiLight "
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
                font.family: "Noto Sans CJK JP DemiLight "
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
                    text = Math.round(text)
                    if(optionTime ===1){
                        weightChart.maxX =(parseInt(inputT1.text)+ parseInt(inputT2.text))*2;
                        signalChart.maxX =(parseInt(inputT1.text)+ parseInt(inputT2.text))*2;
                    }
                    getLocalTn();
                }
                Component.onCompleted:
                {
                    if(optionTime ===1){
                        weightChart.maxX =(parseInt(inputT1.text)+ parseInt(inputT2.text))*2;
                        signalChart.maxX =(parseInt(inputT1.text)+ parseInt(inputT2.text))*2;
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
                font.family: "Noto Sans CJK JP DemiLight "
                color: "white"
            }
            Text{
                x:245
                text: "ms"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize:18
                font.family: "Noto Sans CJK JP DemiLight "
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
                font.family: "Noto Sans CJK JP DemiLight "
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
                    text = Math.round(text)
                    if(optionTime ===1){
                        weightChart.maxX =(parseInt(inputT1.text)+ parseInt(inputT2.text))*2;
                        signalChart.maxX =(parseInt(inputT1.text)+ parseInt(inputT2.text))*2;
                    }
                    getLocalTn();
                }
                Component.onCompleted:
                {
                    if(optionTime ===1){
                        weightChart.maxX =(parseInt(inputT1.text)+ parseInt(inputT2.text))*2;
                        signalChart.maxX =(parseInt(inputT1.text)+ parseInt(inputT2.text))*2;
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
                font.family: "Noto Sans CJK JP DemiLight "
                color: "white"
            }
            Text{
                x:245
                text: "ms"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize:18
                font.family: "Noto Sans CJK JP DemiLight "
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
                font.family: "Noto Sans CJK JP DemiLight "
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
                    text = Math.round(text)
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
                font.family: "Noto Sans CJK JP DemiLight "
                color: "white"
            }
            Text{
                x:245
                text: "ms"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize:18
                font.family: "Noto Sans CJK JP DemiLight "
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
                font.family: "Noto Sans CJK JP DemiLight "
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
                    text = Math.round(text)
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
                font.family: "Noto Sans CJK JP DemiLight "
                color: "white"
            }
            Text{
                x:245
                text: "ms"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize:18
                font.family: "Noto Sans CJK JP DemiLight "
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
                font.family: "Noto Sans CJK JP DemiLight "
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
                        Ops.showCalculator(inputT9,"0","50");
                    }
                }
                onDisplayTextChanged:
                {
                    text = Math.round(text)
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
                font.family: "Noto Sans CJK JP DemiLight "
                color: "white"
            }
            Text{
                x:245
                text: "ms"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize:18
                font.family: "Noto Sans CJK JP DemiLight "
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
                font.family: "Noto Sans CJK JP DemiLight "
                style:  TextFieldStyle {
                    textColor: "#95B3D7"
                    background: Rectangle {
                        color: "transparent"
                    }
                }
                validator: IntValidator { bottom:1; top: 1495}
                maximumLength: 10
                onDisplayTextChanged: {
                    text = Math.round(text)
                }

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
                x: 10
                y: 5
                width: 80
                height: 20
                color: "transparent"
                Text {
                    id: txtWeight
                    anchors.centerIn: parent
                    font.pixelSize: 16
                    text: qsTr("質量値:")
                    font.family: "Noto Sans CJK JP DemiLight "
                    color: "white"
                }
            }

            Rectangle{
                id: weight
                x: rectWeight.x+ rectWeight.width
                y:5
                width: 50
                height: 20
                color: "transparent"
                Text {
                    id: txtValueWeight
                    anchors.centerIn: parent
                    font.pixelSize: 16
                    text: qsTr("3.25")
                    font.family: "Noto Sans CJK JP DemiLight "
                    color: "#FFD9BB"
                }
            }

            Rectangle{
                id: rectGram
                x: rectWeight.x+ rectWeight.width +50
                y: 5
                width: 20
                height: 20
                color: "transparent"
                Text {
                    id: txtGram
                    anchors.centerIn: parent
                    font.pixelSize: 16
                    font.family: "Noto Sans CJK JP DemiLight "
                    text: qsTr("g")
                    color: "white"
                }
            }

            Rectangle{
                id: rectUnitY
                x: rectGram.x+ rectGram.width + 50
                y: 5
                width: 50
                height: 20
                color: "transparent"
                Text {
                    id: txtUnitY
                    anchors.centerIn: parent
                    font.pixelSize: 17
                    text: qsTr("y : ")
                    font.family: "Noto Sans CJK JP DemiLight "
                    color: "white"
                }
            }

            Rectangle{
                id: rectUnitYY
                x: rectUnitY.x +rectUnitY.width + 50
                y: 5
                width: 80
                height: 20
                color: "transparent"
                Text {
                    id: txtUnitYY
                    anchors.centerIn: parent
                    font.pixelSize: 16
                    font.family: "Noto Sans CJK JP DemiLight "
                    text: qsTr("g/div")
                    color: "white"
                }
            }

            Rectangle{
                id: rectValueY
                x: rectUnitY.x+ rectUnitY.width
                y: 5
                width: 70
                height: 20
                color: "transparent"
                Text {
                    id: txtValueY
                    anchors.centerIn: parent
                    font.pixelSize: 16
                    font.family: "Noto Sans CJK JP DemiLight "
                    text: qsTr("19.00")
                    color: "#FFD9BB"
                }
            }

            Rectangle{
                id: rectUnitT
                x: 450
                y: 5
                width: 40
                height: 20
                color: "transparent"
                Text {
                    id: txtUnitT
                    anchors.centerIn: parent
                    font.pixelSize: 16
                    font.family: "Noto Sans CJK JP DemiLight "
                    text: qsTr("t : ")
                    color: "white"
                }
            }

            Rectangle{
                id: rectUnitTT
                x: rectUnitT.x +rectUnitT.width + 60
                y: 5
                width: 80
                height: 20
                color: "transparent"
                Text {
                    id: txtUnitTT
                    anchors.centerIn: parent
                    font.pixelSize: 16
                    font.family: "Noto Sans CJK JP DemiLight "
                    text: qsTr("ms/div")
                    color: "white"
                }
            }

            Rectangle{
                id: rectValueT
                x: rectUnitT.x+ rectUnitT.width
                y: 5
                width: 80
                height: 20
                color: "transparent"
                Text {
                    id: txtValueT
                    anchors.centerIn: parent
                    font.pixelSize: 16
                    font.family: "Noto Sans CJK JP DemiLight "
                    text: qsTr("100")
                    color: "#FFD9BB"
                }
            }

            Rectangle{
                y: 30
                width: 400
                anchors.horizontalCenter: parent.horizontalCenter
                color: "transparent"
                Legend{
                    id: legend0
                    x: 0
                    y: 0
                    strColor: getColor(0)
                    strSource: "qrc:/Images/Number_w24h24_01.png"
                    onClickStateChanged: {
                        changeSeries(0)
                        preSelectLegend = 0
                    }
                }
                Legend{
                    id: legend1
                    x: 80
                    y: 0
                    strColor: getColor(1)
                    strSource: "qrc:/Images/Number_w24h24_01.png"
                    onClickStateChanged: {
                        changeSeries(1)
                        preSelectLegend = 1
                    }
                }
                Legend{
                    id: legend2
                    x: 160
                    y: 0
                    strColor: getColor(2)
                    strSource: "qrc:/Images/Number_w24h24_01.png"
                    onClickStateChanged: {
                        changeSeries(2)
                        preSelectLegend = 2
                    }
                }
                Legend{
                    id: legend3
                    x: 240
                    y: 0
                    strColor: getColor(3)
                    strSource: "qrc:/Images/Number_w24h24_01.png"
                    onClickStateChanged: {
                        changeSeries(3)
                        preSelectLegend = 3
                    }
                }
                Legend{
                    id: legend4
                    x: 320
                    y: 0
                    strColor: getColor(4)
                    strSource: "qrc:/Images/Number_w24h24_01.png"
                    onClickStateChanged: {
                        changeSeries(4)
                        preSelectLegend = 4
                    }
                }
                Legend{
                    id: legend5
                    x: 400
                    y: 0
                    strColor: getColor(5)
                    strSource: "qrc:/Images/Number_w24h24_01.png"
                    onClickStateChanged: {
                        changeSeries(5)
                        preSelectLegend = 5
                    }
                }
                Legend{
                    id: legend6
                    x: 0
                    y: 35
                    strColor: getColor(6)
                    strSource: "qrc:/Images/Number_w24h24_01.png"
                    onClickStateChanged: {
                        changeSeries(6)
                        preSelectLegend = 6
                    }
                }
                Legend{
                    id: legend7
                    x: 80
                    y: 35
                    strColor: getColor(7)
                    strSource: "qrc:/Images/Number_w24h24_01.png"
                    onClickStateChanged: {
                        changeSeries(7)
                        preSelectLegend = 7
                    }
                }
                Legend{
                    id: legend8
                    x: 160
                    y: 35
                    strColor: getColor(8)
                    strSource: "qrc:/Images/Number_w24h24_01.png"
                    onClickStateChanged: {
                        changeSeries(8)
                        preSelectLegend = 8
                    }
                }
                Legend{
                    id: legend9
                    x: 240
                    y: 35
                    strColor: getColor(9)
                    strSource: "qrc:/Images/Number_w24h24_01.png"
                    onClickStateChanged: {
                        changeSeries(9)
                        preSelectLegend = 9
                    }
                }
                Legend{
                    id: legend10
                    x: 320
                    y: 35
                    strColor: getColor(10)
                    strSource: "qrc:/Images/Number_w24h24_01.png"
                    onClickStateChanged: {
                        changeSeries(10)
                        preSelectLegend = 10
                    }
                }
                Legend{
                    id: legend11
                    x: 400
                    y: 35
                    strColor: getColor(11)
                    strSource: "qrc:/Images/Number_w24h24_01.png"
                    onClickStateChanged: {
                        changeSeries(11)
                        preSelectLegend = 11
                    }
                }
            }

            DirectConnection {
                id: directConnectObj
            }

            TK_LineChart {
                id: weightChart
                x: 100
                y: 155
                width: 640
                height: 350
                antialiasing: true
                property real minX: 0
                property real maxX: (parseInt(inputT1.text) + parseInt(inputT2.text))*2
                property real minY: -(parseInt(inputRefVal.text) * 3)/9
                property real maxY: (parseInt(inputRefVal.text) * 3)/2

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    propagateComposedEvents: true
                }

                Component.onCompleted: {
                    // C++: setAxisOption(void* _item, QString _color, qreal _distanceX, qreal _distanceY, bool _drawGridX, bool _drawGridY)
                    adjTimeVer3.setAxisOption(weightChart.mLowerLayer, "#ffffff", width, height/10, false, true)

                    directConnectObj.source = weightChart.mLowerLayer
                    directConnectObj.signal = "onPaintHandle(QQuickItem*,QPainter*)"

                    // C++: drawAxisLine(QQuickItem *item, QPainter *painter);
                    directConnectObj.destination = adjTimeVer3
                    directConnectObj.slot = "drawAxisLine(QQuickItem*,QPainter*)"
                    directConnectObj.isConnect = true
                }
            }

            TK_LineChart {
                id: signalChart
                x: weightChart.x
                y: weightChart.y + weightChart.height + 20
                width: weightChart.width
                height: 60
                antialiasing: true
                property real minX: 0
                property real maxX: (parseInt(inputT1.text) + parseInt(inputT2.text))*2
                property real minY: -0.5
                property real maxY: 2

                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    propagateComposedEvents: true
                }

                Component.onCompleted: {
                    // C++: setAxisOption(void* _item, QString _color, qreal _distanceX, qreal _distanceY, bool _drawGridX, bool _drawGridY)
                    adjTimeVer3.setAxisOption(signalChart.mLowerLayer, "#ffffff", width/10, height, false, false)

                    directConnectObj.source = signalChart.mLowerLayer
                    directConnectObj.signal = "onPaintHandle(QQuickItem*,QPainter*)"

                    // C++: drawAxisLine(QQuickItem *item, QPainter *painter);
                    directConnectObj.destination = adjTimeVer3
                    directConnectObj.slot = "drawAxisLine(QQuickItem*,QPainter*)"
                    directConnectObj.isConnect = true
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
            y: 380
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
                font.family: "Noto Sans CJK JP DemiLight "
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
                    text = parseFloat(text).toFixed(2)
                    if(parseFloat(weightChart.maxY) - parseFloat(txtAsisY_min.text) < 0.08){
                        txtAsisY_min.text = preAsisY_min;
                    }
                    else{
                        weightChart.minX = parseFloat(txtAsisY_min.text)-((weightChart.maxY - parseInt(txtAsisY_min.text))/9)*2;
                        preAsisY_min = txtAsisY_min.text;
                    }
                }
                Component.onCompleted:
                {
                    if(parseFloat(weightChart.maxY) - parseFloat(txtAsisY_min.text) < 0.08){
                        txtAsisY_min.text = "" + weightChart.minY;
                    }
                    else{
                        weightChart.minY = parseFloat(txtAsisY_min.text)-((weightChart.maxY - parseInt(txtAsisY_min.text))/9)*2;
                    }
                    preAsisY_min = txtAsisY_min.text;
                }
            }
        }

        Rectangle{
            x: 325
            y: 150
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
                font.family: "Noto Sans CJK JP DemiLight"
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
                    text = parseFloat(text).toFixed(2)
                    if(parseFloat(txtAsisY_max.text) -  parseFloat(weightChart.minY) < 0.08){
                        txtAsisY_max.text = weightChart.maxY.toString();
                    }
                    else{
                        weightChart.maxY = parseFloat(txtAsisY_max.text);
                        weightChart.minY = parseFloat(txtAsisY_min.text)-((weightChart.maxY - parseInt(txtAsisY_min.text))/9)*2;
                    }
                }
                Component.onCompleted:
                {
                    if(parseFloat(txtAsisY_max.text) - parseFloat(weightChart.minY) < 0.08){
                        txtAsisY_max.text = weightChart.maxY.toString();
                    }
                    else{
                        weightChart.maxY = parseFloat(txtAsisY_max.text);
                        weightChart.minY =parseFloat(txtAsisY_min.text)-((weightChart.maxY - parseInt(txtAsisY_min.text))/9)*2;
                    }
                }
            }
        }

        Rectangle{
            x: 325
            y: 580
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
                text: "0"
                readOnly: true
                horizontalAlignment :TextInput.AlignRight
                font.pixelSize:18
                font.family: "Noto Sans CJK JP DemiLight "
                style:  TextFieldStyle {
                    textColor: "#95B3D7"
                    background: Rectangle {
                        color: "transparent"
                    }
                }
                maximumLength: 10
                validator: IntValidator { bottom:0; top: 100}
                onActiveFocusChanged:
                {
                    if(activeFocus)
                    {
                        Ops.showCalculator(txtAsisX_min,"0","100");
                    }
                }
                onDisplayTextChanged:
                {
                    text = Math.round(text)
                    if(parseInt(txtAsisX_min.text) >= weightChart.maxX){
                        txtAsisX_min.text = weightChart.minX.toString();
                    }
                    else{
                        weightChart.minX = parseInt(txtAsisX_min.text);
                        signalChart.minX = parseInt(txtAsisX_min.text);
                    }
                    getLocalTn();
                }
                Component.onCompleted:
                {
                    getLocalTn();
                }
            }
        }

        Rectangle{
            x: 910
            y: 585
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
                text: "8"
                readOnly: true
                horizontalAlignment :TextInput.AlignRight
                font.pixelSize:18
                font.family: "Noto Sans CJK JP DemiLight "
                style:  TextFieldStyle {
                    textColor: "#95B3D7"
                    background: Rectangle {
                        color: "transparent"
                    }
                }
                maximumLength: 10
                validator: IntValidator { bottom:0; top: 100}
                onActiveFocusChanged:
                {
                    if(activeFocus)
                    {
                        Ops.showCalculator(txtAsisX_max,"0","100");
                    }
                }
                onDisplayTextChanged:
                {
                    text = Math.round(text)
                    if(parseInt(txtAsisX_max.text) <= weightChart.minX){
                        txtAsisX_max.text = weightChart.maxX.toString();
                    }
                    else{
                        weightChart.maxX = parseInt(txtAsisX_max.text);
                        signalChart.maxX = parseInt(txtAsisX_max.text);
                    }
                    getLocalTn();
                }
                Component.onCompleted:
                {
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
            text: (parseFloat((parseInt(txtAsisX_max.text) - parseInt(txtAsisX_min.text))*2/3) + parseFloat(txtAsisX_min.text)).toFixed(2)
            font.pixelSize:16
            font.family: "Noto Sans CJK JP DemiLight "
        }

        Text{
            color: "white"
            x: 540
            y: 580
            width: 80
            horizontalAlignment: Text.Center
            id: valueAsisX2
            text: (parseFloat((parseInt(txtAsisX_max.text) - parseInt(txtAsisX_min.text))/3) + parseFloat(txtAsisX_min.text)).toFixed(2)
            font.pixelSize:16
            font.family: "Noto Sans CJK JP DemiLight "
        }

        Text{
            color: "white"
            x: 350
            y: 303
            width: 40
            id: valueAsisY2
            horizontalAlignment: Text.AlignRight
            text: (parseFloat((parseInt(txtAsisY_max.text) - parseInt(txtAsisY_min.text))/3) + parseFloat(txtAsisY_min.text)).toFixed(2)
            font.pixelSize:16
            font.family: "Noto Sans CJK JP DemiLight "
        }

        Text{
            color: "white"
            x: 350
            y: 226
            id: valueAsisY1
            width: 40
            horizontalAlignment:Text.AlignRight
            text: (parseFloat((parseInt(txtAsisY_max.text) - parseInt(txtAsisY_min.text))*2/3) +parseFloat(txtAsisY_min.text)).toFixed(2)
            font.pixelSize:16
            font.family: "Noto Sans CJK JP DemiLight "
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
            font.family: "Noto Sans CJK JP DemiLight "
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
            font.family: "Noto Sans CJK JP DemiLight "
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
            statusBarItem.normalStatusBar.disableStatusBar();
            bottomBarItem.bottomBarAdjustTiming.disableBottomBar();
        }

        function showDialogVerticalRange(){
            settingRange.source = listVerticalRange;
            settingRange.visible = true;
            statusBarItem.normalStatusBar.disableStatusBar();
            bottomBarItem.bottomBarAdjustTiming.disableBottomBar();
        }

        function showDialogMeasTiming(){
            settingMeasTiming.source=listMeasTiming;
            settingMeasTiming.visible=true;
            statusBarItem.normalStatusBar.disableStatusBar();
            bottomBarItem.bottomBarAdjustTiming.disableBottomBar();
        }

        function showDialogSignalPhoto(){
            displaySignal.visible=true;
            statusBarItem.normalStatusBar.disableStatusBar();
            bottomBarItem.bottomBarAdjustTiming.disableBottomBar();
            selectSignal.refreshList();
            selectPhoto.refreshList();
        }

        function disableScreen(){
            screenArea.propagateComposedEvents = true;
            screenArea.enabled =  true;
        }

        function enableScreen(){
            screenArea.propagateComposedEvents = false;
            screenArea.enabled =  false;
        }

        function clearCharts(){
            clearLineNoLegend()
        }

        function autoScale(){
            clearScale()
        }

        function updateTextInput(sInput) {
            txtProdLen.text = sInput;
        }

        function signalSetCurrentIndex(input){
            selectSignal.refreshList();
            selectSignal.setCurrentIndex(input);
        }

        function photoSetCurrentIndex(input2){
            selectPhoto.refreshList();
            selectPhoto.setCurrentIndex(input2);
        }

        function photoSetSource(input3){
            if(input3 === 0){
                selectPhoto.source = listSignalPhoto;
                for(var i=0;i<listSignalPhoto.count;i++){
                    if(statusBarItem.normalStatusBar.getValueSignal() == listSignalPhoto.get(i).title){
                        selectPhoto.setCurrentIndex(i);
                        selectPhoto.setListViewCount("3");
                    }
                }
            }
            else if(input3 === 1){
                selectPhoto.source = listSignalInput;
                for(i=0;i<listSignalInput.count;i++){
                    if(statusBarItem.normalStatusBar.getValueSignal() == listSignalInput.get(i).title){
                        selectPhoto.setCurrentIndex(i);
                        selectPhoto.setListViewCount("4");
                    }
                }
            }
            else if(input3 === 2){
                selectPhoto.source = listSignalOutput;
                for(i=0;i<listSignalOutput.count;i++){
                    if(statusBarItem.normalStatusBar.getValueSignal() == listSignalOutput.get(i).title){
                        selectPhoto.setCurrentIndex(i);
                        selectPhoto.setListViewCount("6");
                    }
                }
            }
        }

        function refreshList(){
            selectSignal.refreshList();
            selectPhoto.refreshList();
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

    MouseArea {
        id: screenArea
        anchors.fill: parent
        propagateComposedEvents: false;
        enabled:  false;
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
        onVisibleChanged: {
            screenArea.propagateComposedEvents = false;
            screenArea.enabled =  false;
            statusBarItem.normalStatusBar.enableStatusBar();
            bottomBarItem.bottomBarAdjustTiming.enableBottomBar();
        }

    }

    CateListDialog{
        id: settingRange
        x: 397
        y: 100
        indexSelect: 0
        title: "縦レンジ"
        visible: false
        source: listVerticalRange
        onSend: {
            statusBarItem.normalStatusBar.updateVerticalRange(value)      
        }
        onVisibleChanged: {
            statusBarItem.normalStatusBar.enableStatusBar();
            bottomBarItem.bottomBarAdjustTiming.enableBottomBar();
            screenArea.propagateComposedEvents = false;
            screenArea.enabled =  false;
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
            var curIndexMeas =settingMeasTiming.settingDialog.getCurrentIndex()
            if(curIndexMeas ===1){
                //clearScale()
                redBtn.visible=false
                grayBtn.visible=false
            }
            else if(curIndexMeas ===2){
                redBtn.visible=true
                grayBtn.visible=true
            }

        }
        onVisibleChanged: {
            statusBarItem.normalStatusBar.enableStatusBar();
            bottomBarItem.bottomBarAdjustTiming.enableBottomBar();
            screenArea.propagateComposedEvents = false;
            screenArea.enabled =  false;
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
            title: "種別"
            source: listSignalType

            onIndexSelectChanged: {
                selectPhoto.refreshList();
                var curIndex =selectSignal.indexSelect;
                if(curIndex ===1){
                    selectPhoto.source = listSignalPhoto;
                    selectPhoto.setListViewCount("3");
                    if(selectPhoto.getCount() == 0){
                        selectPhoto.indexSelect = 0;
                        selectPhoto.setCurrentIndex(0);
                    }
                }
                else if(curIndex===2){
                    selectPhoto.source=listSignalInput;
                    selectPhoto.setListViewCount("4");
                    if(selectPhoto.getCount() == 0){
                        selectPhoto.indexSelect = 0;
                        selectPhoto.setCurrentIndex(0);
                    }
                }
                else if(curIndex===3){
                    selectPhoto.source=listSignalOutput;
                    selectPhoto.setListViewCount("6");
                    if(selectPhoto.getCount() == 0){
                        selectPhoto.indexSelect = 0;
                        selectPhoto.setCurrentIndex(0);
                    }
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
            title: "信号名"

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
                        font.family: "Noto Sans CJK JP DemiLight "
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

                            preSignal = selectSignal.indexSelect;

                            statusBarItem.normalStatusBar.enableStatusBar();
                            bottomBarItem.bottomBarAdjustTiming.enableBottomBar();

                            screenArea.propagateComposedEvents = false;
                            screenArea.enabled =  false;

                            selectPhoto.refreshList();
                            selectSignal.refreshList();

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
                        font.family: "Noto Sans CJK JP DemiLight "
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
                            imgCancel.source = "../Images/keyboard_btn_okcancel.png";

                            selectSignal.indexSelect = preSignal;
                            selectSignal.setCurrentIndex(preSignal);

                            screenArea.propagateComposedEvents = false;
                            screenArea.enabled =  false;

                            statusBarItem.normalStatusBar.enableStatusBar();
                            bottomBarItem.bottomBarAdjustTiming.enableBottomBar();

                            selectPhoto.refreshList();
                            //selectSignal.refreshList();

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
            font.family: "Noto Sans CJK JP DemiLight "
            color: "white"
            text: statusBarItem.normalStatusBar.getValueSignal()

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
        signalChart.maxX =txtAsisX_max.text;
        weightChart.maxX = txtAsisX_max.text;
        getLocalTn();
        statusBarItem.normalStatusBar.updateSettingTime(value.toString());
    }

    function getLocalTn(){
        var maxX = 1000;
        var originX = weightChart.x + weightChart.parent.x;
        var originY = 574;
        var scale = (maxX-originX)/(parseInt(weightChart.maxX)- parseInt(weightChart.minX));
        var localTn = [];
        var localT1 = originX + parseInt(scale*(parseInt(inputT1.text)));
        var localT2 = localT1 + parseInt(scale*(parseInt(inputT2.text)));
        var localT3 = localT2 + parseInt(scale*(parseInt(inputT3.text)));
        var localT4 = localT3 + parseInt(scale*(parseInt(inputT4.text)));
        var localT7 = localT4 + parseInt(scale*(parseInt(inputT7.text)));
        var localT9 = localT7 + parseInt(scale*(parseInt(inputT9.text)));
        if(localT1 >= maxX - 80){
            localT1 = maxX - 15;
            localT2 = maxX - 12;
            localT3 = maxX - 9;
            localT4 = maxX - 6;
            localT7 = maxX - 3;
            localT9 = maxX;
        }
        else if(localT2 >= maxX - 80){
            localT2 = maxX - 12;
            localT3 = maxX - 9;
            localT4 = maxX - 6;
            localT7 = maxX - 3;
            localT9 = maxX;
        }
        else if(localT3 >= maxX - 80){
            localT3 = maxX - 9;
            localT4 = maxX - 6;
            localT7 = maxX - 3;
            localT9 = maxX;
        }
        else if(localT4 >= maxX - 80){
            localT4 = maxX - 6;
            localT7 = maxX - 3;
            localT9 = maxX;
        }
        else if(localT7 >= maxX - 80){
            localT7 = maxX - 3;
            localT9 = maxX;
        }
        else if(localT9 >=maxX)
            localT9 = maxX;
        localTn.push(originY);
        localTn.push(localT1);
        localTn.push(localT2);
        localTn.push(localT3);
        localTn.push(localT4);
        localTn.push(localT7);
        localTn.push(localT9);
        localTn.push(maxX);
        localTn.push(signalChart.y + signalChart.height - 5);
        timAdjObj.setDrawTn(localTn);
    }

    function drawCharts(){
        getLocalTn()
        var countLineImport =  12;
        var lineProperty = weightChart.lineProperty();
        var distanceX = 0;
        var distanceY = 0;

        for(var i = 0 ;i<countLineImport ; i++){
            //lineImport.push((Math.random() * 11) + 1);

            // create weight line
            var weightLineName = "weightLine_" + i;
            var weightLine = weightChart.getLine(weightLineName);

            if (weightLine === undefined) {
               lineProperty.lineName = weightLineName;
               weightLine = weightChart.createLine(lineProperty);
            }

            distanceX = weightChart.width/10;
            distanceY = weightChart.height/10;

            for(var j=0;j<=10;j++){
                var x = j*distanceX;
                var y = convertPointY(weightChart, Math.floor((Math.random() * 3) + 4)*distanceY);

                weightLine.append(x, y);
            }


            // create signal line
            var signalLineName = "signalLine_" + i;
            var signalLine = signalChart.getLine(signalLineName);

            if (signalLine === undefined) {
               lineProperty.lineName = signalLineName;
               signalLine = signalChart.createLine(lineProperty);
            }

            distanceX = signalChart.width/10;
            distanceY = convertPointY(signalChart, signalChart.height/3.5);

            if(i%2 === 0) {
                signalLine.append(0*distanceX,distanceY*2);
                signalLine.append(1*distanceX,distanceY*2);
                signalLine.append(1*distanceX,distanceY/2);
                signalLine.append(2*distanceX,distanceY/2);
                signalLine.append(2*distanceX,distanceY*2);
                signalLine.append(3*distanceX,distanceY*2);
                signalLine.append(3*distanceX,distanceY/2);
                signalLine.append(4*distanceX,distanceY/2);
                signalLine.append(5*distanceX,distanceY/2);
                signalLine.append(5*distanceX,distanceY*2);
                signalLine.append(6*distanceX,distanceY*2);
                signalLine.append(6*distanceX,distanceY/2);
                signalLine.append(7*distanceX,distanceY/2);
                signalLine.append(8*distanceX,distanceY/2);
                signalLine.append(8*distanceX,distanceY*2);
                signalLine.append(9*distanceX,distanceY*2);
                signalLine.append(10*distanceX,distanceY*2);
            }
            else{
                signalLine.append(0*distanceX,distanceY*2);
                signalLine.append(1*distanceX,distanceY*2);
                signalLine.append(2*distanceX,distanceY*2);
                signalLine.append(2*distanceX,distanceY/2);
                signalLine.append(3*distanceX,distanceY/2);
                signalLine.append(3*distanceX,distanceY/2);
                signalLine.append(3*distanceX,distanceY*2);
                signalLine.append(4*distanceX,distanceY*2);
                signalLine.append(5*distanceX,distanceY*2);
                signalLine.append(6*distanceX,distanceY*2);
                signalLine.append(6*distanceX,distanceY/2);
                signalLine.append(7*distanceX,distanceY/2);
                signalLine.append(7*distanceX,distanceY*2);
                signalLine.append(8*distanceX,distanceY*2);
                signalLine.append(9*distanceX,distanceY*2);
                signalLine.append(10*distanceX,distanceY*2);
            }

            var color = getColor(i);
            weightLine.lineColor = color;
            weightLine.update();

            signalLine.lineColor = color;
            signalLine.update();
        }
        weightChart.mLowerLayer.update();
    }

    function resetLine(){
        var i;
        for(i=0;i < weightChart.count;i++){
            weightChart.series(i).width = 0.7;
            signalChart.series(i).width = 0.5;
        }
    }

    function clearLineNoLegend(){
        weightChart.clearAllLine();
        signalChart.clearAllLine();
    }

    function resetSelectLegend(){
        switch(preSelectLegend){
            case 0:
                legend0.setWidth(0.8)
                break;
            case 1:
                legend1.setWidth(0.8)
                break;
            case 2:
                legend2.setWidth(0.8)
                break;
            case 3:
                legend3.setWidth(0.8)
                break;
            case 4:
                legend4.setWidth(0.8)
                break;
            case 5:
                legend5.setWidth(0.8)
                break;
            case 6:
                legend6.setWidth(0.8)
                break;
            case 7:
                legend7.setWidth(0.8)
                break;
            case 8:
                legend8.setWidth(0.8)
                break;
            case 9:
                legend9.setWidth(0.8)
                break;
            case 10:
                legend10.setWidth(0.8)
                break;
            case 11:
                legend11.setWidth(0.8)
                break;

        }
    }

    function changeSeries(pos){
        resetLine();
        resetSelectLegend();
        var i;
        for(i=0;i<weightChart.count;i++){
            if(weightChart.series(i).color == getColor(pos)){
                weightChart.series(i).width = 4;
                signalChart.series(i).width = 4;
                signalChart.series(i).color = getColor(pos)
                break;
            }
        }
    }

    function clearScale(){
        weightChart.minX =0;
        weightChart.minY = -(inputRefVal.text*3)/9;
        weightChart.maxY = parseInt(inputRefVal.text)*1.5
        if(optionTime ==1){
            weightChart.maxX = (parseInt(inputT1.text) + parseInt(inputT2.text))*2;
            signalChart.maxX = (parseInt(inputT1.text) + parseInt(inputT2.text))*2;
        }
        else if(optionTime ==2){
            weightChart.maxX = 50;
            signalChart.maxX = 50;
        }
        else if(optionTime ==3){
            weightChart.maxX = 100;
            signalChart.maxX = 100;
        }
        else{
            weightChart.maxX = 200;
            signalChart.maxX = 200;
        }
        txtAsisX_min.text = weightChart.minX.toString();
        txtAsisY_min.text = 0;
        txtAsisX_max.text = weightChart.maxX.toString();
        txtAsisY_max.text = weightChart.maxY.toString();
        getLocalTn();
    }

    function getColor(index){
        var color;
        switch(index){
        case 0: color= "#ff0000";break; //red
        case 1: color= "#ffff00";break; //yellow
        case 2: color= "#008b45";break; //green
        case 3: color= "#0000ff";break; //blue
        case 4: color= "#00bfff";break; //light blue
        case 5: color= "#ff6a6a";break; //pink
        case 6: color= "#ff7f24";break; //orange
        case 7: color= "#cd1076";break; //purple
        case 8: color= "#ffffff";break; //white
        case 9: color= "#8b4726";break; //brown
        case 10: color= "#00ff00";break; //green
        case 11: color= "#848385";break; //light black
        default: color= "white";break;
        }
        return color;
    }

    // because axis orgin on top left of rectangle, so we need convert to real physic position
    function convertPointY(lineChart, pointY) {
        pointY = lineChart.height - pointY;
        return pointY;
    }
}
