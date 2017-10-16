import QtQuick 2.5
import ControlApp 1.0
import CommonControl 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.2 as Controls
import QtCharts 2.1
import "../AdjustTiming"
import "../Dialog"
import "../Control/VirtualKey.js" as Ops

Item {
    id:adjustTimingScreen
    property alias    objAdjustTimingVM:  adjTimeVer4VM
    property AdjustTimingVer4       timAdjObj:          adjTimeVer4
    property CateListDialog         objSettingTime:     settingTime
    property string sourceImage: ""
    property real widthGraph: 0
    property int  optionTime : 1
    property int  indexlineActive : 0
    property int heightPanelItem: 45
    property int spaceItem: 10
    property bool isTextInputChange: true
    property int xMax: 695
    property int xMin: 105
    property int originY: 570
    property int localT1
    property int localT2
    property int localT3
    property int localT4
    property int localT7
    property int localT9
    property string titleColor: objAdjustTimingVM.getTextColor()
    property string lineColor: objAdjustTimingVM.getLineColor()
    property string valueColor: objAdjustTimingVM.getValueColor()
    property string backGColor: objAdjustTimingVM.getBackGColor()
    property string needTransparent: "transparent"
    property rect rectWeightGraph : Qt.rect(0, 0, 720, 450)
    property rect rectSignalGraph : Qt.rect(0, 450, 720, 150 )


    AdjustTimingVer4_VM{
        id: adjTimeVer4VM
    }

    AdjustTimingVer4{
        width: 1024
        height: 640
        id: adjTimeVer4
        Rectangle{
            id: productionInfo
            x:4
            y: 10
            width:280
            height: 125
            color: backGColor
            border.width: 1
            border.color: lineColor
            radius:5
            TK_Label{
                id: txtProd
                x: 6
                y:5
                width: 50
                height: 30
                mText: objAdjustTimingVM.txtProdName
                mBackColor: backGColor
                mForeColor:titleColor
                mFont:           Qt.font({pixelSize: 20,
                                                family: "MS Gothic",
                                                italic: false,
                                                bold: false})
            }

            TK_Label{
                id: txtSample
                x: 6
                y:40
                width: 100
                height: 30
                mText: objAdjustTimingVM.txtSample
                mBackColor: backGColor
                mForeColor:titleColor
                mFont:           Qt.font({pixelSize: 20,
                                                family: "MS Gothic",
                                                italic: false,
                                                bold: false})
            }
            TK_Label{
                id: txtProductNo
                x: 104
                y:15
                width: 150
                height: 50
                mText: objAdjustTimingVM.valueProdNo
                mBackColor: backGColor
                mForeColor:titleColor
                mFont:           Qt.font({pixelSize: 34,
                                                family: "MS Gothic",
                                                italic: false,
                                                bold: false})
            }
        }


        //Setting area
        AdjustTimingSubControl{
            id: refVal          //RefVal
            x:4
            y: 185
            widthItem: 280
            heightItem: heightPanelItem
            txtTitle: objAdjustTimingVM.txtRefValue
            txtUnit: objAdjustTimingVM.txtUnitG
            txtTextField: objAdjustTimingVM.valueRefVal

        }
        AdjustTimingSubControl{
            id: prodLen          //Prod Len
            x:4
            y: refVal.y +heightPanelItem+ spaceItem
            widthItem: 280
            heightItem: heightPanelItem
            txtTitle: objAdjustTimingVM.txtProdLen
            txtUnit: objAdjustTimingVM.txtUnitMM
            txtTextField: objAdjustTimingVM.valueProdLen
        }
        AdjustTimingSubControl{
            id: firstT          //T7
            x:4
            y: prodLen.y +heightPanelItem+ spaceItem
            widthItem: 280
            heightItem: heightPanelItem
            txtTitle: objAdjustTimingVM.txtT7
            txtUnit: objAdjustTimingVM.txtUnitMS
            txtTextField: objAdjustTimingVM.valueT7
            onPressTitle: {
                selectT7.visible=true
            }
            onPressTextInput: {

                Ops.showCalculator(firstT.txtBox ,"1","1495");

            }
            onInputComplete: {
                getLocationTn()
            }
        }
        AdjustTimingSubControl{
            id: secondT          //T1
            x:4
            y: firstT.y +heightPanelItem+ spaceItem
            widthItem: 280
            heightItem: heightPanelItem
            txtTitle: objAdjustTimingVM.txtT1
            txtUnit: objAdjustTimingVM.txtUnitMS
            txtTextField: objAdjustTimingVM.valueT1
            onPressTitle: {
                selectT1.visible=true
            }
            onPressTextInput: {
                Ops.showCalculator(secondT.txtBox ,"1","1000");

            }
            onInputComplete: {
                if(optionTime ===1){
                valueAxisX.max =(parseInt(secondT.txtTextField)+ parseInt(thirdT.txtTextField))*2;
                signalAxisX.max =(parseInt(secondT.txtTextField)+ parseInt(thirdT.txtTextField))*2;
                }
                getLocationTn()
            }
        }
        AdjustTimingSubControl{
            id: thirdT          //T2
            x:4
            y: secondT.y +heightPanelItem+ spaceItem
            widthItem: 280
            heightItem: heightPanelItem
            txtTitle: objAdjustTimingVM.txtT2
            txtUnit: objAdjustTimingVM.txtUnitMS
            txtTextField: objAdjustTimingVM.valueT2
            onPressTitle: {
                selectT2.visible=true
            }
            onPressTextInput: {
                Ops.showCalculator(thirdT.txtBox ,"1","1000");

            }
            onInputComplete: {
                if(optionTime ===1){
                valueAxisX.max =(parseInt(secondT.txtTextField)+ parseInt(thirdT.txtTextField))*2;
                signalAxisX.max =(parseInt(secondT.txtTextField)+ parseInt(thirdT.txtTextField))*2;
                }
                getLocationTn()
            }
        }
        AdjustTimingSubControl{
            id: fourthT          //T3
            x:4
            y: thirdT.y +heightPanelItem+ spaceItem
            widthItem: 280
            heightItem: heightPanelItem
            txtTitle: objAdjustTimingVM.txtT3
            txtUnit: objAdjustTimingVM.txtUnitMS
            txtTextField: objAdjustTimingVM.valueT3
            onPressTitle: {
                selectT3.visible=true
            }
            onPressTextInput: {
                Ops.showCalculator(fourthT.txtBox ,"1","1000");

            }
            onInputComplete: {
                getLocationTn()
            }
        }
        AdjustTimingSubControl{
            id: fifthT          //T4
            x:4
            y: fourthT.y +heightPanelItem+ spaceItem
            widthItem: 280
            heightItem: heightPanelItem
            txtTitle: objAdjustTimingVM.txtT4
            txtUnit: objAdjustTimingVM.txtUnitMS
            txtTextField: objAdjustTimingVM.valueT4
            onPressTitle: {
                selectT4.visible=true
            }
            onPressTextInput: {
                Ops.showCalculator(fifthT.txtBox ,"1","1000");

            }
            onInputComplete: {

                getLocationTn()
            }

        }
        AdjustTimingSubControl{
            id: filterTime          //Filter Time
            x:4
            y: fifthT.y +heightPanelItem+ spaceItem
            widthItem: 280
            heightItem: heightPanelItem
            txtTitle: objAdjustTimingVM.txtFilterTime
            txtUnit: objAdjustTimingVM.txtUnitMS
            txtTextField: objAdjustTimingVM.valueFilterTime
        }
        //end setting area

        Rectangle{
            id:chartArea
            x: 300
            y: 4
            width: 720
            height: 632
            color: "transparent"
            border.width: 1
            border.color: lineColor
            radius:5
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    console.log("mouseX: "+ mouseX)
                }
            }

            TK_Label{
                id: rectWeight
                x: 25
                y:10
                width: 120
                height: 30
                mBackColor: backGColor
                mText: objAdjustTimingVM.txtWeight
                mForeColor:titleColor
                mFont:           Qt.font({pixelSize: 20,
                                                family: "MS Gothic",
                                                italic: false,
                                                bold: false})
            }
            TK_Label{
                id: weight
                x: rectWeight.x+ rectWeight.width
                y:10
                width: 80
                height: 30
                mForeColor: valueColor
                mBackColor: backGColor
                mText: objAdjustTimingVM.valueWeight
                mFont:           Qt.font({pixelSize: 20,
                                                family: "MS Gothic",
                                                italic: false,
                                                bold: false})
            }

            TK_Label{
                id: rectGram
                x: rectWeight.x+ rectWeight.width +80
                y:10
                width: 40
                height: 30
                mText: objAdjustTimingVM.txtUnitG
                mBackColor: backGColor
                mForeColor:titleColor
                mFont:           Qt.font({pixelSize: 20,
                                                family: "MS Gothic",
                                                italic: false,
                                                bold: false})
            }

            TK_Label{
                id: rectUnitY
                x: 410
                y:10
                width: 40
                height: 30
                mText: objAdjustTimingVM.txtUnitY
                mBackColor: backGColor
                mForeColor:titleColor
                mFont:           Qt.font({pixelSize: 20,
                                                family: "MS Gothic",
                                                italic: false,
                                                bold: false})
            }

            TK_Label{
                id: rectUnitYY
                x: rectUnitY.x +rectUnitY.width +80
                y:10
                width: 80
                height: 30
                mText: objAdjustTimingVM.txtUnitG+"/"+objAdjustTimingVM.txtUnitDIV
                mBackColor: backGColor
                mForeColor:titleColor
                mFont:           Qt.font({pixelSize: 20,
                                                family: "MS Gothic",
                                                italic: false,
                                                bold: false})
            }

            TK_Label{
                id: rectValueY
                x: rectUnitY.x+ rectUnitY.width
                y:10
                width: 80
                height: 30
                mText: objAdjustTimingVM.valueY
                mBackColor: backGColor
                mForeColor: valueColor
                mFont:           Qt.font({pixelSize: 20,
                                                family: "MS Gothic",
                                                italic: false,
                                                bold: false})
            }

            TK_Label{
                id: rectUnitT
                x: 410
                y:50
                width: 40
                height: 30
                mText: objAdjustTimingVM.txtUnitT
                mBackColor: backGColor
                mForeColor:titleColor
                mFont:           Qt.font({pixelSize: 20,
                                                family: "MS Gothic",
                                                italic: false,
                                                bold: false})
            }
            TK_Label{
                id: rectUnitTT
                x: rectUnitY.x +rectUnitY.width +80
                y:50
                width: 80
                height: 30
                mText: objAdjustTimingVM.txtUnitMS+"/"+objAdjustTimingVM.txtUnitDIV
                mBackColor: backGColor
                mForeColor:titleColor
                mFont:           Qt.font({pixelSize: 20,
                                                family: "MS Gothic",
                                                italic: false,
                                                bold: false})
            }
            TK_Label{
                id: rectValueT
                x: rectUnitT.x+ rectUnitT.width
                y:50
                width: 80
                height: 30
                mForeColor:valueColor
                mBackColor: backGColor
                mFont:           Qt.font({pixelSize: 20,
                                                family: "MS Gothic",
                                                italic: false,
                                                bold: false})
                mText: objAdjustTimingVM.valueT
            }

            ChartView{
                id: weightChart
                legend.visible: false
                x:0
                y:0
                width: 720
                height: 450
                margins.top: 110
                margins.bottom: 0
                margins.right: 0
                margins.left: 70
                antialiasing: true
                backgroundColor:"transparent"

                ValueAxis {
                    id: valueAxisX
                    min:0
                    max: (parseInt(secondT.txtTextField) + parseInt(thirdT.txtTextField))*2
                    gridVisible: false
                    labelsVisible: false
                    tickCount: 2
                }

                ValueAxis {
                    id:valueAxisY
                    min:  -(refVal.txtTextField*3)/9;
                    max: (refVal.txtTextField*3)/2
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
                x:0
                y:430
                height:150
                width: 720
                margins.top: 0
                margins.bottom: 0
                margins.right: 0
                margins.left: 70
                antialiasing: true
                backgroundColor:"transparent"
                legend.visible : false

                ValueAxis {
                    id: signalAxisX
                    labelFormat: "%.0f"
                    min:0
                    max: (parseInt(secondT.txtTextField) + parseInt(thirdT.txtTextField))*2
                    gridVisible: false
                    labelsColor: "white"
                    minorGridVisible: false
                    tickCount: (parseInt(valueAxisX.max)- parseInt(valueAxisX.min)) +1
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

            Rectangle{
                id: btnManualT1
                x:230
                y:570
                width: 25
                height: 25
                color: "transparent"
                visible: false
                Image {
                    anchors.fill: parent
                    id: redIcon
                    source: "image://MyProvider/red_triangle.png"
                }
                MouseArea{
                    anchors.fill: parent
                    drag.target: parent
                    drag.minimumX: 100
                    drag.maximumX: 680
                    drag.minimumY: 570
                    drag.maximumY: 570
                    onPressed: {
                        isTextInputChange=false
                    }
                }

                onXChanged: {
                    getLocationTn()

                }
            }
            Rectangle{
                id: btnManualT2
                x:365
                y:570
                width: 25
                height: 25
                color: "transparent"
                visible: false
                Image {
                    anchors.fill: parent
                    id: grayIcon
                    source: "qrc:/Images/green_triangle.png"
                }
                MouseArea{
                    anchors.fill: parent
                    drag.target: parent
                    drag.minimumX: 200
                    drag.maximumX: 680
                    drag.minimumY: 570
                    drag.maximumY: 570

                }
                onXChanged: {
                    isTextInputChange=false
                    getLocationTn()
                }
            }

            TK_Label{
                id: nameAxisY
                x: 80
                y: 100
                mForeColor:titleColor
                horizontalAlignment: Text.Center
                width: 80
                mBackColor: needTransparent
                mRightToLeft:false
                mText: objAdjustTimingVM.txtUnitY
                mFont:           Qt.font({pixelSize: 18,
                                                family: "MS Gothic",
                                                italic: false,
                                                bold: false})
            }

            TK_TextBox{
                id: txtAsisY_min
                x: 20
                y: 376
                width:70
                height: 35
                text: Number(0).toFixed(2)
                backgroundColor: "transparent"
                foreColor: valueColor
                fontFamily:"MS Gothic"
                font.pixelSize: 18

                onActiveFocusChanged:
                {
                    if(activeFocus)
                    {
                        var limitYmin=Number(txtAsisY_max.text)-1
                        Ops.showCalculator(txtAsisY_min,"0",limitYmin+"");
                    }
                }
                onDisplayTextChanged:
                {
                    valueAxisY.min =parseInt(txtAsisY_min.text)-((valueAxisY.max - parseInt(txtAsisY_min.text))/9)*2;
                    getLocationTn();
                }
                Component.onCompleted:
                {
                    valueAxisY.min =parseInt(txtAsisY_min.text)-((valueAxisY.max - parseInt(txtAsisY_min.text))/9)*2;
                    getLocationTn();
                }

            }

            TK_TextBox{
                id: txtAsisY_max
                x: 20
                y: 146
                width:70
                height: 35
                text: Number(9).toFixed(2)
                fontFamily:"MS Gothic"
                font.pixelSize: 18
                backgroundColor: "transparent"
                foreColor: valueColor
                onActiveFocusChanged:
                {
                    if(activeFocus)
                    {
                        var limitYmax=Number(txtAsisY_min.text)+1
                        Ops.showCalculator(txtAsisY_max,limitYmax+"","9");
                    }
                }
                onDisplayTextChanged:
                {
                    valueAxisY.max = parseInt(txtAsisY_max.text);
                    valueAxisY.min =parseInt(txtAsisY_min.text)-((valueAxisY.max - parseInt(txtAsisY_min.text))/9)*2;
                    getLocationTn();
                }
                Component.onCompleted:
                {
                    valueAxisY.max = parseInt(txtAsisY_max.text);
                    valueAxisY.min =parseInt(txtAsisY_min.text)-((valueAxisY.max - parseInt(txtAsisY_min.text))/9)*2;
                    getLocationTn();
                }

            }

            TK_TextBox{
                id: txtAsisX_min
                x: 90
                y: 570
                width:70
                height: 35
                text: valueAxisX.min.toFixed(2)
                fontFamily:"MS Gothic"
                font.pixelSize: 18
                backgroundColor: "transparent"
                foreColor: valueColor
                onActiveFocusChanged:
                {
                    if(activeFocus)
                    {
                        var limitXmin = Number(txtAsisX_max.text)-1
                        Ops.showCalculator(txtAsisX_min,"0",limitXmin+"");
                    }
                }
                onDisplayTextChanged:
                {
                    valueAxisX.min = parseInt(txtAsisX_min.text);
                    signalAxisX.min = parseInt(txtAsisX_min.text);

                    getLocationTn();
                }
                Component.onCompleted:
                {

                    valueAxisX.min = parseInt(txtAsisX_min.text);
                    signalAxisX.min = parseInt(txtAsisX_min.text);

                    getLocationTn();
                }

            }

            TK_Label{
                id: valueAsisY1
                x: 50
                y: 216
                horizontalAlignment: Text.Center
                width: 50
                mBackColor: backGColor
                mForeColor:titleColor
                mText:((parseInt(txtAsisY_max.text) - parseInt(txtAsisY_min.text))*2/3 +parseInt(txtAsisY_min.text)).toFixed(2)
                mFont:           Qt.font({pixelSize: 18,
                                                family: "MS Gothic",
                                                italic: false,
                                                bold: false})
            }
            TK_Label{
                id: valueAsisY2
                x: 50
                y: 293
                mForeColor:titleColor
                horizontalAlignment: Text.Center
                width: 50
                mBackColor: backGColor
                mText:((parseInt(txtAsisY_max.text) - parseInt(txtAsisY_min.text))/3 +parseInt(txtAsisY_min.text)).toFixed(2)
                mFont:           Qt.font({pixelSize: 18,
                                                family: "MS Gothic",
                                                italic: false,
                                                bold: false})
            }

            TK_TextBox{
                id: txtAsisX_max
                x: 640
                y:570
                width:70
                height: 35
                text: Number(8).toFixed(2)
                fontFamily:"MS Gothic"
                font.pixelSize: 18
                backgroundColor: "transparent"
                foreColor: valueColor
                onActiveFocusChanged:
                {
                    if(activeFocus)
                    {
                        var limitXmax=Number(txtAsisX_min.text)+1
                        Ops.showCalculator(txtAsisX_max,limitXmax+"","100");
                    }
                }
                onDisplayTextChanged:
                {
                    valueAxisX.max = parseInt(txtAsisX_max.text);
                    signalAxisX.max = parseInt(txtAsisX_max.text);
                    getLocationTn();
                }
                Component.onCompleted:
                {
                    valueAxisX.max = parseInt(txtAsisX_max.text);
                    signalAxisX.max = parseInt(txtAsisX_max.text);
                    getLocationTn();
                }

            }


            TK_Label{
                id: valueAsisX1
                x: (xMax - xMin)*2/3.0  +xMin
                y: 570
                horizontalAlignment: Text.Center
                width: 60
                mBackColor: backGColor
                mForeColor:titleColor
                mRightToLeft: true
                mText:Number((parseInt(txtAsisX_max.text) - parseInt(txtAsisX_min.text))*2/3.0 + parseInt(txtAsisX_min.text)).toFixed(2)
                mFont:           Qt.font({pixelSize: 18,
                                                family: "MS Gothic",
                                                italic: false,
                                                bold: false})
            }
            TK_Label{
                id: valueAsisX2
                x: (xMax - xMin)/3.0  +xMin
                y: 570
                horizontalAlignment: Text.Center
                width: 60
                mBackColor: backGColor
                mForeColor:titleColor
                mText:((parseInt(txtAsisX_max.text) - parseInt(txtAsisX_min.text))/3.0 + parseInt(txtAsisX_min.text)).toFixed(2);
                mFont:           Qt.font({pixelSize: 18,
                                                family: "MS Gothic",
                                                italic: false,
                                                bold: false})
            }

            TK_Label{
                id: nameAxisX
                x: 705
                y: 570
                mForeColor:titleColor
                horizontalAlignment: Text.Center
                width: 80
                mRightToLeft:false
                mBackColor: needTransparent
                mText: objAdjustTimingVM.txtUnitT
                mFont:           Qt.font({pixelSize: 18,
                                                family: "MS Gothic",
                                                italic: false,
                                                bold: false})
            }

            TK_DomainUpDown{
                id: showSignalSelection
                x: 10
                y: 445
                onCurrentIndexChanged: {
                    clearLineNoLegend();
                    drawCharts();
                }
            }

        }



        Component.onCompleted: {
            console.log("scale_factor"+scale_factor)
            console.log("plot area"+signalChart.plotArea.x)
            drawCharts()
            updateText()
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
        function showDialogSignalAdjust(){
            signalAdjust.source=listSignalInput
            signalAdjust.visible=true
        }
        function showDialogSignalSelect(){
            displaySignal.visible=true;
        }

        function showDialogSignalPhoto(){
            displaySignal.visible=true;
        }

        function showDialogSelectTn(){
            selectTn.visible=true
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
    ListModel{
        id: listTn
        ListElement {
            title: "T1"
        }
        ListElement {
            title: "T2"
        }
        ListElement {
            title: "T3"
        }
        ListElement {
            title: "T4"
        }
        ListElement {
            title: "T7"
        }
        ListElement {
            title: "T9"
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
            statusBarItem.normalStatusBarAdjust4.settingValueTime(value)
            statusBarItem.normalStatusBarAdjust4.settingValueTime(value)
            var curentIndexTime=settingTime.settingDialog.getCurrentIndex()
            console.log("curentIndexTime: "+curentIndexTime)
            if(curentIndexTime ===1){
                optionTime = 1;
                clearScale();
            }
            else if(curentIndexTime === 2){
                optionTime = 1;
                clearScale();
            }
            else if(curentIndexTime === 3){
                optionTime =3;
                clearScale();
            }
            else if(curentIndexTime === 4){
                optionTime  =4;
                clearScale();
            }
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
            statusBarItem.normalStatusBarAdjust4.updateVerticalRange(value)
        }
    }
    CateListDialog{
        id:selectT7
        x: 397
        y: 100
        title: "縦レンジ"
        visible: false
        source: listTn
        onSend: {
            firstT.updateTitle(value)
            getLocationTn()
            bottomBarItem.bottomBarAdjustTimingV4.visibleSelectSignalBtn()
        }
    }
    CateListDialog{
        id:selectT1
        x: 397
        y: 100
        title: "縦レンジ"
        visible: false
        source: listTn
        onSend: {
            secondT.updateTitle(value)
            getLocationTn()
            bottomBarItem.bottomBarAdjustTimingV4.visibleSelectSignalBtn()
        }
    }
    CateListDialog{
        id:selectT2
        x: 397
        y: 100
        title: "縦レンジ"
        visible: false
        source: listTn
        onSend: {
            thirdT.updateTitle(value)
            getLocationTn()
            bottomBarItem.bottomBarAdjustTimingV4.visibleSelectSignalBtn()
        }
    }
    CateListDialog{
        id:selectT3
        x: 397
        y: 100
        title: "縦レンジ"
        visible: false
        source: listTn
        onSend: {
            fourthT.updateTitle(value)
            getLocationTn()
            bottomBarItem.bottomBarAdjustTimingV4.visibleSelectSignalBtn()
        }
    }
    CateListDialog{
        id:selectT4
        x: 397
        y: 100
        title: "縦レンジ"
        visible: false
        source: listTn
        onSend: {
            fifthT.updateTitle(value)
            getLocationTn()
            bottomBarItem.bottomBarAdjustTimingV4.visibleSelectSignalBtn()
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
            bottomBarItem.bottomBarAdjustTimingV4.settingValueMeasTime(value)
            var curIndexMeas =settingMeasTiming.settingDialog.getCurrentIndex()
            console.log("curIndexMeas: " + curIndexMeas)
            if(curIndexMeas ===1){

                btnManualT1.visible=false
                btnManualT2.visible=false
                optionTime=1
                clearScale()
            }
            else if(curIndexMeas ===2){
                btnManualT1.visible=true
                btnManualT2.visible=true
            }
        }
        onIndexSelectChanged: {

        }
    }
    CateListDialog{
        id: signalAdjust
        x: 397
        y: 100
        visible: false
        indexSelect: 0

    }
    CateListDialog{
        id: signalSelect
        x: 397
        y: 100
        visible: false
        indexSelect: 0

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
                        font.pixelSize:20
                        font.family: "MS Gothic"
                        color: titleColor
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

                            selectPhoto.settingDialog.pressBtnOK()
                            statusBarItem.normalStatusBarAdjust4.updateSignal(selectPhoto.value)
                            showSignalSelection.textSelection =selectPhoto.value
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
                        font.pixelSize:20
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
        visible: false
        Text {
            anchors.centerIn: parent
            id: txtSignalName
            font.pixelSize: 20
            font.family: "MS Gothic"
            color: titleColor
            text: "Photo(W1)"
        }
    }



    function setAsisX(value){
        switch(value.toString()){
        case "(T1+T2)*2":
            txtAsisX_max.text = ((parseInt(secondT.txtTextField) + parseInt(thirdT.txtTextField))*2).toString();
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
        getLocationTn();
        statusBarItem.normalStatusBarAdjust4.updateSettingTime(value.toString());
    }

    function getLocationTn(){
        var maxWidthGraph= (parseInt(valueAxisX.max)- parseInt(valueAxisX.min))
        var scale = parseFloat(xMax-xMin)/ maxWidthGraph;
        console.log("maxWidthGraph: " +maxWidthGraph) // =8
        console.log("scale: " +scale) // =72,75
        var localTn = [];
        var stringTn= [];

        var stringT1 =secondT.txtTitle; //T1
        var stringT2 =thirdT.txtTitle; //T2
        var stringT3 =fourthT.txtTitle; //T3
        var stringT4 =fifthT.txtTitle; //T4
        var stringT7 =firstT.txtTitle; //T7

        stringTn.push(stringT1);
        stringTn.push(stringT2);
        stringTn.push(stringT3);
        stringTn.push(stringT4);
        stringTn.push(stringT7);

        if(isTextInputChange){
            localT1 = xMin + parseInt(scale*(parseInt(secondT.txtTextField)));
            console.log("localT1: " +localT1)
            localT2 = localT1 + parseInt(scale*(parseInt(thirdT.txtTextField)));
            localT3 = localT2 + parseInt(scale*(parseInt(fourthT.txtTextField)));
            localT4 = localT3 + parseInt(scale*(parseInt(fifthT.txtTextField)));
            localT7 = localT4 + parseInt(scale*(parseInt(firstT.txtTextField))); //T7
            //localT9 = localT7 + parseInt(scale*(parseInt(inputT9.text)));

        }
        else {
            localT1 = xMin + (btnManualT1.x-100)
            localT2 = localT1 + (btnManualT2.x -200)
            localT3 = localT2 + parseInt(scale*(parseInt(fourthT.txtTextField)));
            localT4 = localT3 + parseInt(scale*(parseInt(fifthT.txtTextField)));
            localT7 = localT4 + parseInt(scale*(parseInt(firstT.txtTextField)));
            //localT9 = localT7 + parseInt(scale*(parseInt(inputT9.text)));
        }

        localTn.push(originY); //local[0]
        localTn.push(localT1+300); //local[1]
        localTn.push(localT2+300); //local[2]
        localTn.push(localT3+300); //local[3]
        localTn.push(localT4+300); //local[4]
        localTn.push(localT7+300); //local[5]
        localTn.push(localT9+300); //local[6]
        localTn.push(xMax+300);    //local[7]
        localTn.push(xMin+300); //local[8]
        timAdjObj.setDrawTn(localTn, stringTn);

    }
    function drawCharts(){
        getLocationTn()
        var lineImport=[];
        var countLineImport =  Math.floor((Math.random() * 7) + 5);
        var valueWeight = [];
        valueWeight=objAdjustTimingVM.genDataWeight();
        for(var i =0 ;i<countLineImport ; i++){
            lineImport.push((Math.random() * 11) + 1);
            var series = weightChart.createSeries(ChartView.SeriesTypeSpline,"",valueAxisX,valueAxisY);
            var seriesSignal = signalChart.createSeries(ChartView.SeriesTypeLine,"",signalAxisX,signalAxisY);
            for(var j=0;j<=12;j++){
                series.append(j, Math.floor((Math.random() * 3) + 3));
                //series.append(j, valueWeight[j]);
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
                seriesSignal.append(9,1);
                seriesSignal.append(10,1);
                seriesSignal.append(11,1);
                seriesSignal.append(11,0);
                seriesSignal.append(12,0);
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
                seriesSignal.append(10,1);
                seriesSignal.append(11,1);
                seriesSignal.append(12,1);
                seriesSignal.append(12,0);

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
        valueAxisY.min = -(refVal.txtTextField*3)/9;
        valueAxisY.max = (refVal.txtTextField*3)/2
        if(optionTime === 1){
            valueAxisX.max = (parseInt(secondT.txtTextField) + parseInt(thirdT.txtTextField))*2
            signalAxisX.max = (parseInt(secondT.txtTextField) + parseInt(thirdT.txtTextField))*2
        }
        else if(optionTime === 2){
            valueAxisX.max = 50;
            signalAxisX.max = 50;
        }
        else if(optionTime === 3){
            valueAxisX.max = 100;
            signalAxisX.max = 100;
        }
        else if(optionTime === 4){
            valueAxisX.max = 200;
            signalAxisX.max = 200;
        }
        txtAsisX_min.text = valueAxisX.min.toString();
        txtAsisY_min.text = 0;
        txtAsisX_max.text = valueAxisX.max.toString();
        txtAsisY_max.text = valueAxisY.max.toString();
        getLocationTn();
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

    Component.onCompleted: {
        objAdjustTimingVM.OnLoad();
        mainModel.onChangeLanguage.connect(updateText)
        updateText()
    }

    function updateText(){
        objAdjustTimingVM.onChangeLanguage()

        txtProd.mText = objAdjustTimingVM.txtProdName;
        txtSample.mText = objAdjustTimingVM.txtSample;
        txtProductNo.mText = objAdjustTimingVM.valueProdNo;
        refVal.txtTitle = objAdjustTimingVM.txtRefValue;
        prodLen.txtTitle = objAdjustTimingVM.txtProdLen;
        rectWeight.mText = objAdjustTimingVM.txtWeight
        adjTimeVer4.update();
    }
}
