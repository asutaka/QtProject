import QtQuick 2.0
import QtCharts 2.1
import CommonControl 1.0

DrawableControl {
    id: _lowerLayer

    //    property          alias	id:                     Not customize
    //    property          alias	enabled:                Not customize
    //    property          alias	visible:                Not customize
    //    property          alias	anchors.top:            Not customize
    //    property          alias	anchors.bottom:         Not customize
    //    property          alias	anchors.right:          Not customize
    //    property          alias	anchors.left:           Not customize
    //    property          alias	x:                      Not customize
    //    property          alias	y:                      Not customize
    //    property          alias	width:                  Not customize
    //    property          alias	height:                 Not customize
    //    property          alias	anchors.margins:        Not customize
    //    property          alias	anchors.leftMargin:     Not customize
    //    property          alias	anchors.rightMargin:    Not customize
    //    property          alias	anchors.topMargin:      Not customize
    //    property          alias	anchors.bottomMargin:   Not customize

    property        var         lastValue
    property        int         currentIndex:       -1
    property        color       lineChartColor:     "#fed49f"
    property        string      lineTitle2:         "Line X-Bar"
    property        int         newPointNumber:     200
    property        int         maxPointNumber:     250
    property        bool        isPress:            false
    property        int         distanceTickCount:  newPointNumber / valueAxisXx.tickCount;
    property        alias       plotX:              chartView.plotArea.x
    property        alias       plotY:              chartView.plotArea.y
    property        alias       plotWidth:          chartView.plotArea.width
    property        alias       plotHeight:         chartView.plotArea.height

    // UpperLayer or Lowerlayer
    property        alias       lowerLayer:         _lowerLayer
    property        alias       upperLayer:         _upperLayer

    signal genData()
    width: 720
    height: 250

    // Main Chart
    ChartView {
        id: chartView
        anchors.fill: parent
        animationOptions: ChartView.NoAnimation
        antialiasing: true
        backgroundColor: "transparent"
        clip: true
        plotAreaColor: "transparent"
        margins.left: 0
        margins.right: 0
        margins.top: 0
        margins.bottom: 0
        legend.visible: true
        legend.alignment: Qt.AlignTop
        legend.font.pixelSize: 15
        legend.labelColor: "white"
        legend.backgroundVisible: false


        //Draw border plotArea
        Rectangle{
            id: borderPlotArea0
            x: chartView.plotArea.x
            y: chartView.plotArea.y
            width: chartView.plotArea.width
            height: chartView.plotArea.height
            color: "transparent"
            border.color: "gray"
        }

        LineSeries{
            id:lineSeries
            name: lineTitle2
            useOpenGL: true
            axisX: CategoryAxis{
                id: valueAxisXx
                min: 0
                max: 200
                gridVisible: false
                labelsPosition:CategoryAxis.AxisLabelsPositionOnValue
                labelsColor : "#EECFA1"
                labelsFont.pixelSize: 11
                CategoryRange{
                    label: "0"
                    endValue: 0.5
                }
                CategoryRange{
                    label: (distanceTickCount*1).toString()
                    endValue: distanceTickCount*1
                }
                CategoryRange{
                    label: (distanceTickCount*2).toString()
                    endValue: distanceTickCount*2
                }
                CategoryRange{
                    label: (distanceTickCount*3).toString()
                    endValue: distanceTickCount*3
                }
                CategoryRange{
                    label: (distanceTickCount*4).toString()
                    endValue: distanceTickCount*4
                }
                CategoryRange{
                    label: (distanceTickCount*5).toString()
                    endValue: distanceTickCount*5
                }
            }
            axisY:
                ValueAxis {
                id:valueAxisY
                visible: false
                min: 0
                max: 300
                tickCount:6
                gridLineColor:"#585858"
                minorGridVisible: false
                gridVisible: false
                labelsVisible: false
                labelFormat: "%i"
                labelsFont.pixelSize: 1
            }
        }

        // UpperLayer
        DrawableControl {
            id: _upperLayer
            anchors.fill: parent
        }

        MouseArea {
            anchors.fill: parent
            property int lastX: 0
            property int lastY: 0
            onPressed: {
                lastX = mouse.x
                lastY = mouse.y
            }
            onDoubleClicked: {
                isPress = !isPress
                if(isPress){
                    rectBounder.visible = true
                }
                else{
                    if(currentIndex >chartView.axisX().max -2){
                        rectBounder.visible = false
                        chartView.axisX().min = currentIndex - (newPointNumber -2)
                        chartView.axisX().max = currentIndex + 2
                        chartView.update()
                    }
                    else{
                        rectBounder.visible = false
                    }

                }
            }

            onPositionChanged: {
                if(rectBounder.visible == true)
                {
                    var factorX =chartView.width/newPointNumber

                    // increate perfomance, avoid lookup variable in heap memory
                    var currentIndexTmp = currentIndex;
                    var newPointNumberTmp = newPointNumber;
                    var maxPointNumberTmp = maxPointNumber;

                    if (lastX > mouse.x && (currentIndexTmp-chartView.axisX().max) > -2) {
                        // scroll right  to left
                        if (currentIndexTmp > newPointNumberTmp) {
                            chartView.scrollLeft(-factorX*5)
                            chartView.axisX().min = chartView.axisX().max - newPointNumberTmp
                        }
                        else {
                            chartView.axisX().max = newPointNumberTmp;
                            chartView.axisX().min = 0;
                        }
                        lastX = mouse.x
                    }
                    // scroll left to right
                    else if(lastX < mouse.x && currentIndexTmp < maxPointNumberTmp){
                        if (currentIndexTmp > newPointNumberTmp && currentIndexTmp -newPointNumberTmp < chartView.axisX().min) {
                            chartView.scrollRight(-factorX*5)
                            chartView.axisX().min = chartView.axisX().max - newPointNumberTmp;
                        }
                        else {
                            chartView.axisX().max = newPointNumberTmp;
                            chartView.axisX().min = 0;
                        }
                        lastX=mouse.x
                    }
                    else if(currentIndexTmp > maxPointNumberTmp && (currentIndexTmp -maxPointNumberTmp) < (chartView.axisX().min )){
                        chartView.scrollRight(-factorX*5)
                        chartView.axisX().min = chartView.axisX().max - newPointNumberTmp;
                        lastX=mouse.x
                    }
                }
                else{

                }
            }
        }
    }

    Rectangle {
        id:rectBounder
        visible: false
        x: chartView.x
        y: chartView.y +45
        width: chartView.width
        height: chartView.height -50
        color: "transparent"
        border.color: "lightblue"
        border.width: 2

    }

    HandleManager {
        id: blockSignal
    }

    Component.onCompleted: {
        genData()
    }


    // Update Chart Data
    function timerTrigger() {
        currentIndex++;

        // increate perfomance, avoid lookup variable in heap memory
        var currentIndexTmp = currentIndex;
        var newPointNumberTmp = newPointNumber;

        lineSeries.color = lineChartColor

        if (currentIndexTmp >= newPointNumberTmp)
        {
            blockSignal.setBlockSignal(chartView);
        }

        if(currentIndexTmp > maxPointNumber){
            lineSeries.remove(0);
        }

        if (currentIndexTmp > newPointNumberTmp - 2) {
            // Append tickcount on the x-axis
            if(currentIndexTmp % distanceTickCount === 0) {
                valueAxisXx.append(currentIndexTmp, currentIndexTmp);
                valueAxisXx.remove(currentIndexTmp-distanceTickCount*6);
            }

            valueAxisXx.max += 1;
            valueAxisXx.min = valueAxisXx.max - newPointNumberTmp;
        }

        blockSignal.setBlockSignal(chartView, false);
        lineSeries.append(currentIndexTmp, lastValue);
    }
}
