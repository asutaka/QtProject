import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import ControlApp 1.0
import "qrc:/Dialog"
import "qrc:/Control/switchControl";


Item {
    property IOMonitor objIOMonitor: ioMonitor
    property alias ioMonitorVM : ioMonitorVMControl
    property int chanelSelect: 1
    property int chanelOld: 1
    property bool isButtonUpDown: false
    property var itemControlList: [
        chanel1, chanel2, chanel3, chanel4, chanel5, chanel6, chanel7,
        chanel8, chanel9, chanel10, chanel11, chanel12, chanel13, chanel14
    ]

    IOMonitorScreenVM {
        id: ioMonitorVMControl
    }

    Rectangle {
        id: rectContent
        width: 1024
        height: 640

        IOMonitor {
            id: ioMonitor
            anchors.fill: parent

            IOMonitorItemControl {
                id: chanel1
                x: 21
                y: 55
                chanel: 1
                isSelected: true
                onClicked: {
                    ioMonitor.highlightChanel(1)
                }
            }

            IOMonitorItemControl {
                id: chanel2
                x: 21
                y: 95
                chanel: 2
                onClicked: ioMonitor.highlightChanel(2)
            }

            IOMonitorItemControl {
                id: chanel3
                x: 21
                y: 135
                chanel: 3
                onClicked: ioMonitor.highlightChanel(3)
            }

            IOMonitorItemControl {
                id: chanel4
                x: 21
                y: 175
                chanel: 4
                onClicked: ioMonitor.highlightChanel(4)
            }

            IOMonitorItemControl {
                id: chanel5
                x: 21
                y: 215
                chanel: 5
                onClicked: ioMonitor.highlightChanel(5)
            }

            IOMonitorItemControl {
                id: chanel6
                x: 21
                y: 255
                chanel: 6
                onClicked: ioMonitor.highlightChanel(6)
            }

            IOMonitorItemControl {
                id: chanel7
                x: 21
                y: 295
                chanel: 7
                onClicked: ioMonitor.highlightChanel(7)
            }

            IOMonitorItemControl {
                id: chanel8
                x: 21
                y: 335
                chanel: 8
                onClicked: ioMonitor.highlightChanel(8)
            }

            IOMonitorItemControl {
                id: chanel9
                x: 21
                y: 375
                chanel: 9
                onClicked: ioMonitor.highlightChanel(9)
            }

            IOMonitorItemControl {
                id: chanel10
                x: 21
                y: 415
                chanel: 10
                onClicked: ioMonitor.highlightChanel(10)
            }

            IOMonitorItemControl {
                id: chanel11
                x: 21
                y: 455
                chanel: 11
                onClicked: ioMonitor.highlightChanel(11)
            }

            IOMonitorItemControl {
                id: chanel12
                x: 21
                y: 495
                chanel: 12
                onClicked: ioMonitor.highlightChanel(12)
            }

            IOMonitorItemControl {
                id: chanel13
                x: 21
                y: 535
                chanel: 13
                onClicked: ioMonitor.highlightChanel(13)
            }

            IOMonitorItemControl {
                id: chanel14
                x: 21
                y: 575
                chanel: 14
                onClicked: ioMonitor.highlightChanel(14)
            }

            ToolButton {
                id: btnSMPCYC
                anchors.top: parent.top
                anchors.topMargin: 8
                anchors.right: parent.right
                anchors.rightMargin: parent.width * 0.06
                contentItem: Text {
                    id: txtSMPCYC
                    y: 10
                    font.family: "MS Gothic"
                    font.pixelSize: 28
                    color: "#95B3D7"
                    text: "10"
                }

                onClicked: {
                    showDlgSettingSMPCYC()
                }
            }

            Rectangle{
                id: areaStartStop
                x: ioMonitor.width * 0.05
                y: ioMonitor.height * 0.015
                width: 200
                height: 40
                color: "transparent"
                border.color: "#848385"
                border.width: 1
                radius: 5

                Rectangle{
                    id: btnStop
                    width: parent.width / 2 - 2
                    height: parent.height - 6
                    anchors.left: parent.left
                    anchors.leftMargin: 2
                    anchors.verticalCenter: parent.verticalCenter
                    color: "#dc8232"
                    radius: 10
                    border.color:"#78e8fe"
                    border.width: 5
                    Text {
                        id: txtStop
                        anchors.centerIn: parent
                        font.pixelSize: parent.height * 0.42
                        font.bold: true
                        color: "#ffffff"
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: {
                            btnStop.border.color = "#78e8fe"
                            txtStop.color ="#ffffff"
                            btnStart.border.color ="#5a6469"
                            txtStart.color ="#5a6469"
                            objIOMonitor.updateStartStopMachine(false)
                            loaderStatusBar.item.objIOMonitorStatusBar.settingValueTitle(false)
                        }
                    }
                }
                Rectangle{
                    id: btnStart
                    anchors.left: btnStop.right
                    anchors.verticalCenter: parent.verticalCenter
                    width: btnStop.width
                    height: btnStop.height
                    color: "#91be3c"
                    radius: 10
                    border.color:"#5a6469"
                    border.width: 5
                    Text {
                        id: txtStart
                        anchors.centerIn: parent
                        font.pixelSize: parent.height * 0.42
                        font.bold: true
                        color: "#5a6469"
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: {
                            btnStart.border.color = "#78e8fe"
                            txtStart.color ="#ffffff"
                            btnStop.border.color ="#5a6469"
                            txtStop.color ="#5a6469"
                            objIOMonitor.updateStartStopMachine(true)
                            loaderStatusBar.item.objIOMonitorStatusBar.settingValueTitle(true)
                        }
                    }
                }
            }

            RowLayout {
                id: switchSignal
                x: ioMonitor.width * 0.3
                y: ioMonitor.height * 0.015
                width: 80
                height: 40

                ToolButton {
                    id: switchDown
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    contentItem: Image {
                        id: imgDown
                        anchors.fill: parent
                        source: "image://MyProvider/scroll_linedown_off.png"
                    }

                    MouseArea
                    {
                        id: idMouseDown
                        anchors.fill: parent
                        drag.target: switchSignal
                        drag.minimumX: 0
                        drag.minimumY: 0
                        drag.maximumX: ioMonitor.width - switchDown.width
                        drag.maximumY: ioMonitor.height - switchDown.height
                        onPressed: {
                            imgDown.source =  "image://MyProvider/scroll_linedown_on.png"
                            chanelOld = chanelSelect
                            chanelSelect++
                            isSelectChanel()
                            isButtonUpDown = true
                            objIOMonitor.switchValueChanel(chanelSelect, chanelOld)
                        }
                        onReleased: {
                            imgDown.source =  "image://MyProvider/scroll_linedown_off.png"
                        }
                    }
                }

                ToolButton {
                    id: switchUp
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    anchors.left: switchDown.right
                    anchors.leftMargin: 2

                    contentItem: Image {
                        id: imgUp
                        anchors.fill: parent
                        source: "image://MyProvider/scroll_lineup_off.png"
                    }

                    MouseArea
                    {
                        id: idMouseUp
                        anchors.fill: parent
                        drag.target: switchSignal
                        drag.minimumX: 0
                        drag.minimumY: 0
                        drag.maximumX: ioMonitor.width - switchUp.width
                        drag.maximumY: ioMonitor.height - switchUp.height
                        onPressed: {
                            imgUp.source =  "image://MyProvider/scroll_lineup_on.png"
                            chanelOld = chanelSelect
                            chanelSelect--
                            isSelectChanel()
                            isButtonUpDown = true
                            objIOMonitor.switchValueChanel(chanelSelect, chanelOld)
                        }
                        onReleased: {
                            imgUp.source =  "image://MyProvider/scroll_lineup_off.png"
                        }
                    }
                }
            }

            ListModel {
                id: listSMPCYC
            }

            ListModel {
                id: listDisplay
            }

            ListModel {
                id: listTrigerCondition
            }

            ListModel {
                id: listTrigerNo
            }

            ListModel {
                id: listSignalType
            }

            CateListDialog {
                id: dlgSMPCYC
                x: 397
                y: 100
                indexSelect: 0
                visible: false
                onSend: {
                    txtSMPCYC.text = value
                    objIOMonitor.updateSamplingCycle(Number(value))
                }
            }

            CateListDialog {
                id: dlgDisplay
                x: 397
                y: 100
                indexSelect: 0
                visible: false
                onSend: {
                    loaderStatusBar.item.objIOMonitorStatusBar.settingValueDisplay(value)
                    if (value === listDisplay.get(1).title) {
                        loaderBottomBar.item.objIOMonitorBottomBar.updateStartStopImport(true)
                    }
                }
            }

            CateListDialog {
                id: dlgTrigerCondition
                x: 397
                y: 100
                indexSelect: 0
                visible: false
                onSend: {
                    var src = ""
                    if (value === listTrigerCondition.get(0).title)
                    {
                        src = "image://MyProvider/statbar_event_down.png"
                    }
                    else if (value === listTrigerCondition.get(1).title)
                    {
                        src = "image://MyProvider/statbar_event_up.png"
                    }
                    else
                    {
                        src = "image://MyProvider/statbar_event_none.png"
                    }
                    loaderStatusBar.item.objIOMonitorStatusBar.settingValueTriggerCondition(value, src)
                }
            }

            CateListDialog {
                id: dlgTrigerNo
                x: 397
                y: 100
                indexSelect: 0
                visible: false
                onSend: {
                    loaderStatusBar.item.objIOMonitorStatusBar.settingValueTriggerNo(value)
                }
            }

            CateListDialog {
                id: dlgSignalType
                x: 397
                y: 100
                indexSelect: 0
                visible: false
                onSend: {
                    loaderStatusBar.item.objIOMonitorStatusBar.settingValueSignalType(value)
                    if (value === listSignalType.get(0).title) {
                        objIOMonitor.updatePredictedSignal(false)
                    }
                    else
                    {
                        objIOMonitor.updatePredictedSignal(true)
                    }
                }
            }

            IOMonitorSignalSelect {
                id: dlgSignalSelect
                x: 397
                y: 100
                visible: false
            }

            function showDlgDisplay() {
                dlgDisplay.visible = true
            }

            function showDlgTrigerCondition() {
                dlgTrigerCondition.visible = true
            }

            function showDlgTrigerNo() {
                dlgTrigerNo.visible = true
            }

            function showDlgSignalType() {
                dlgSignalType.visible = true
            }

            function showDlgSignalSelect() {
                dlgSignalSelect.visible = true
            }

            function highlightChanel(ch) {
                chanelSelect = ch
                isSelectChanel()
                isButtonUpDown = false
            }

            function settingValueChanel(portName, signalName, lineNoName) {
                switch (chanelSelect)
                {
                case 1:
                    chanel1.portName = portName
                    chanel1.signalName = signalName
                    chanel1.lineNoName = lineNoName
                    break
                case 2:
                    chanel2.portName = portName
                    chanel2.signalName = signalName
                    chanel2.lineNoName = lineNoName
                    break
                case 3:
                    chanel3.portName = portName
                    chanel3.signalName = signalName
                    chanel3.lineNoName = lineNoName
                    break
                case 4:
                    chanel4.portName = portName
                    chanel4.signalName = signalName
                    chanel4.lineNoName = lineNoName
                    break
                case 5:
                    chanel5.portName = portName
                    chanel5.signalName = signalName
                    chanel5.lineNoName = lineNoName
                    break
                case 6:
                    chanel6.portName = portName
                    chanel6.signalName = signalName
                    chanel6.lineNoName = lineNoName
                    break
                case 7:
                    chanel7.portName = portName
                    chanel7.signalName = signalName
                    chanel7.lineNoName = lineNoName
                    break
                case 8:
                    chanel8.portName = portName
                    chanel8.signalName = signalName
                    chanel8.lineNoName = lineNoName
                    break
                case 9:
                    chanel9.portName = portName
                    chanel9.signalName = signalName
                    chanel9.lineNoName = lineNoName
                    break
                case 10:
                    chanel10.portName = portName
                    chanel10.signalName = signalName
                    chanel10.lineNoName = lineNoName
                    break
                case 11:
                    chanel11.portName = portName
                    chanel11.signalName = signalName
                    chanel11.lineNoName = lineNoName
                    break
                case 12:
                    chanel12.portName = portName
                    chanel12.signalName = signalName
                    chanel12.lineNoName = lineNoName
                    break
                case 13:
                    chanel13.portName = portName
                    chanel13.signalName = signalName
                    chanel13.lineNoName = lineNoName
                    break
                case 14:
                    chanel14.portName = portName
                    chanel14.signalName = signalName
                    chanel14.lineNoName = lineNoName
                    break
                }
            }

            function switchValueChanel(currentCh, oldCh) {
                var tmpPortName = itemControlList[currentCh - 1].portName
                var tmpSignalName = itemControlList[currentCh - 1].signalName
                var tmpLineNoName = itemControlList[currentCh - 1].lineNoName

                itemControlList[currentCh - 1].portName = itemControlList[oldCh - 1].portName
                itemControlList[currentCh - 1].signalName = itemControlList[oldCh - 1].signalName
                itemControlList[currentCh - 1].lineNoName = itemControlList[oldCh - 1].lineNoName

                itemControlList[oldCh - 1].portName = tmpPortName
                itemControlList[oldCh - 1].signalName = tmpSignalName
                itemControlList[oldCh - 1].lineNoName = tmpLineNoName
            }
        }
    }

    Component.onCompleted: {
        ioMonitorVM.onLoad();
        updateText()
        mainModel.onChangeLanguage.connect(updateText)
    }

    function updateText() {
        objIOMonitor.txtSampCycleTitle = loaderStatusBar.item.objIOMonitorVM.txtSampCycleTitle
        objIOMonitor.txtSampCycleUnit = loaderStatusBar.item.objIOMonitorVM.txtSampCycleUnit
        txtStart.text = loaderStatusBar.item.objIOMonitorVM.txtStart
        txtStop.text = loaderStatusBar.item.objIOMonitorVM.txtStop
        dlgSMPCYC.title = loaderStatusBar.item.objIOMonitorVM.txtSMPCYCTitle
        dlgDisplay.title = loaderStatusBar.item.objIOMonitorVM.txtDisplayTitle
        dlgTrigerCondition.title = loaderStatusBar.item.objIOMonitorVM.txtTrigerConditionTitle
        dlgTrigerNo.title = loaderStatusBar.item.objIOMonitorVM.txtTrigerNoTitle
        dlgSignalType.title = loaderStatusBar.item.objIOMonitorVM.txtSignalTypeTitle

        listSMPCYC.clear()
        for (var i = 0; i < loaderStatusBar.item.objIOMonitorVM.listSMPCYC.length; i++) {
            listSMPCYC.append({"title": loaderStatusBar.item.objIOMonitorVM.listSMPCYC[i]})
        }
        dlgSMPCYC.source = listSMPCYC

        listDisplay.clear()
        for (i = 0; i < loaderStatusBar.item.objIOMonitorVM.listDisplay.length; i++) {
            listDisplay.append({"title": loaderStatusBar.item.objIOMonitorVM.listDisplay[i]})
        }
        dlgDisplay.source = listDisplay

        listTrigerCondition.clear()
        for (i = 0; i < loaderStatusBar.item.objIOMonitorVM.listTrigerCondition.length; i++) {
            listTrigerCondition.append({"title": loaderStatusBar.item.objIOMonitorVM.listTrigerCondition[i]})
        }
        dlgTrigerCondition.source = listTrigerCondition

        listTrigerNo.clear()
        for (i = 0; i < loaderStatusBar.item.objIOMonitorVM.listTrigerNo.length; i++) {
            listTrigerNo.append({"title": loaderStatusBar.item.objIOMonitorVM.listTrigerNo[i]})
        }
        dlgTrigerNo.source = listTrigerNo

        listSignalType.clear()
        for (i = 0; i < loaderStatusBar.item.objIOMonitorVM.listSignalType.length; i++) {
            listSignalType.append({"title": loaderStatusBar.item.objIOMonitorVM.listSignalType[i]})
        }
        dlgSignalType.source = listSignalType

        objIOMonitor.update()
    }

    function showDlgSettingSMPCYC() {
        dlgSMPCYC.visible = true
    }

    function selectChanel(ch1, ch2, ch3, ch4, ch5, ch6, ch7, ch8, ch9, ch10, ch11, ch12, ch13, ch14)
    {
        chanel1.isSelected = ch1
        chanel2.isSelected = ch2
        chanel3.isSelected = ch3
        chanel4.isSelected = ch4
        chanel5.isSelected = ch5
        chanel6.isSelected = ch6
        chanel7.isSelected = ch7
        chanel8.isSelected = ch8
        chanel9.isSelected = ch9
        chanel10.isSelected = ch10
        chanel11.isSelected = ch11
        chanel12.isSelected = ch12
        chanel13.isSelected = ch13
        chanel14.isSelected = ch14
    }

    function isSelectChanel() {
        if (chanelSelect > 14) {
            chanelSelect = 1
        }
        else if (chanelSelect < 1)
        {
            chanelSelect = 14
        }

        switch(chanelSelect)
        {
        case 1:
            selectChanel(true, false, false, false, false, false, false,
                         false, false, false, false, false, false, false)
            break
        case 2:
            selectChanel(false, true, false, false, false, false, false,
                         false, false, false, false, false, false, false)
            break
        case 3:
            selectChanel(false, false, true, false, false, false, false,
                         false, false, false, false, false, false, false)
            break
        case 4:
            selectChanel(false, false, false, true, false, false, false,
                         false, false, false, false, false, false, false)
            break
        case 5:
            selectChanel(false, false, false, false, true, false, false,
                         false, false, false, false, false, false, false)
            break
        case 6:
            selectChanel(false, false, false, false, false, true, false,
                         false, false, false, false, false, false, false)
            break
        case 7:
            selectChanel(false, false, false, false, false, false, true,
                         false, false, false, false, false, false, false)
            break
        case 8:
            selectChanel(false, false, false, false, false, false, false,
                         true, false, false, false, false, false, false)
            break
        case 9:
            selectChanel(false, false, false, false, false, false, false,
                         false, true, false, false, false, false, false)
            break
        case 10:
            selectChanel(false, false, false, false, false, false, false,
                         false, false, true, false, false, false, false)
            break
        case 11:
            selectChanel(false, false, false, false, false, false, false,
                         false, false, false, true, false, false, false)
            break
        case 12:
            selectChanel(false, false, false, false, false, false, false,
                         false, false, false, false, true, false, false)
            break
        case 13:
            selectChanel(false, false, false, false, false, false, false,
                         false, false, false, false, false, true, false)
            break
        case 14:
            selectChanel(false, false, false, false, false, false, false,
                         false, false, false, false, false, false, true)
            break
        }
    }
}
