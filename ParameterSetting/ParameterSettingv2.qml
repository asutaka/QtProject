import QtQuick 2.0
import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.2
import "qrc:/Control/VirtualKey.js" as Ops
import "qrc:/Control/switchControl"
import "qrc:/Control/switchLineUC"
import "qrc:/ParameterSetting"
import ControlApp 1.0
import CommonControl 1.0
import CommonModule 1.0

Item {
    id: objParamSettingv2
    property Item objSettingContent: rectcontentMenuListv2
    property int indexSelect: 1;
    property int linePage: 10;
    property int temp;
    property int  _currentLineNo: 1
    property real wParent: 1024
    property real hParent: 640
    property real wLeftContent: 232
    property real hLeftContent: hParent
    property real wRightContent: 80
    property real hRightContent: hParent
    property real wMainContent: wParent - wLeftContent - wRightContent
    property real hMainContent: hParent
    property ParameterSettingVM paramSetting: _paramSetting
    property real rowHeight: 1

    Label {
        id: lblValNumber
        visible: false
        text: "0"
        onTextChanged: {
            listModel.setValue(indexSelect - 1, lblValNumber.text)
        }
    }

    Label {
        id: lbIndex
        visible: false
        text: "0"
        onTextChanged: {
            navGridView.indexRowSelected = parseInt(lbIndex.text)
        }
    }

    ParameterSettingListModel {
        id: listModel
    }

    ParameterSettingVM {
        id: _paramSetting
    }

    MenuBarSubControl {
        id: _menubarLayer
        x: 0
        y: 0
        width: 1024
        height: 40
        color: "#000"
    }

    StartSwitchLineModule {
        id: rectLeftContent
        x: 0
        y: 40
        implicitWidth: wLeftContent
        implicitHeight: hLeftContent
        txtSwitchRight: paramSetting.txtForline
    }

    Rectangle {
        id: rectcontentMenuListv2
        x: 232
        y: 40
        width: 713
        height: 599
        color: "#EEF2E7"

        TK_DataGridView {
            id: list
            highlightOnFocus: true
            width: parent.width
            height: 1
            model: listModel
            verticalScrollBarPolicy :Qt.ScrollBarAlwaysOn
            horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff
            TableViewColumn {
                id: col1
                movable : false
                role: paramSetting.txtCSerial
                title: paramSetting.txtHSerial
                width: 100
                delegate: Item {
                    Text {
                        text: styleData.value
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "MS Gothic"
                        font.pixelSize: 27
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }

            TableViewColumn {
                id: col2
                movable : false
                role: paramSetting.txtCParam
                title: paramSetting.txtHParam
                width: 400
                delegate: Item {
                    Text {
                        id: txtCol2
                        text: qsTr(styleData.value + "\n検査対象の品名を設定します。")
                        anchors.leftMargin: 20
                        font.family: "MS Gothic"
                        font.pixelSize: 27
                        anchors.verticalCenter: parent.verticalCenter
                        Component.onCompleted: {
                            rowHeight = txtCol2.height
                        }
                    }
                }
            }

            TableViewColumn {
                id: col3
                movable : false
                role: paramSetting.txtCValue
                title: paramSetting.txtHValue
                width: (list.width - col1.width - col2.width - 15)
                delegate: Text {
                    text: styleData.value
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "MS Gothic"
                    font.pixelSize: 27
                }
            }

            style: TableViewStyle {
                headerDelegate: Rectangle {
                    id: headerDelegateView
                    height: 55

                    Image {
                        anchors.fill: parent
                        source: "image://MyProvider/TabMenu.png"
                    }

                    Text {
                        id: textItem
                        text: styleData.value
                        font.family: "MS Gothic"
                        font.pixelSize: 27
                        anchors.centerIn: parent
                    }
                }

                itemDelegate: Item {
                    Text {
                        id: iContent
                        color: "black"
                        text: styleData.value
                        font {
                            family: "MS Gothic"
                            pixelSize: 27
                        }
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                rowDelegate: Rectangle {
                    id: curItem
                    width: list.width
                    height: rowHeight + 20
                    border {
                        color: "#BECD91"
                        width: 0.5
                    }
                    color: styleData.selected ? "#F69642" : (styleData.alternate ? "#EFE7B6" : "#EEF2E7")
                }

                handle: Item {
                    implicitWidth: 10
                    implicitHeight: 0

                    Rectangle {
                        color: "#F69642"
                        anchors.fill: parent
                        anchors.leftMargin: 5
                        anchors.topMargin: 2
                        anchors.bottomMargin: 2
                        anchors.rightMargin: 0
                    }
                }

                decrementControl: Rectangle {
                    visible: false
                }

                incrementControl: Rectangle {
                    visible: false
                }
            }

            onClicked: {
                navGridView.indexRowSelected = (currentRow + 1).toString()
                indexSelect = list.currentRow + 1
            }

            onDoubleClicked: {
                indexSelect = list.currentRow + 1
                switch (listModel.getType(indexSelect - 1)) {
                    case 1:
                        break;
                    case 2:
                        Ops.showCalculator(lblValNumber, "0", "1000");
                        break;
                    default:
                        break;
                }
            }

            Keys.onPressed: {
                if (event.key === Qt.Key_Down) {
                    if (indexSelect < list.rowCount) {
                        navGridView.indexRowSelected = (++indexSelect).toString();
                    }
                } else if (event.key === Qt.Key_Up) {
                    if (indexSelect > 1) {
                        navGridView.indexRowSelected = (--indexSelect).toString();
                    }
                }
            }

            Component.onCompleted: {
                list.selection.select(indexSelect - 1)
                navGridView.indexRowSelected = 1
                navGridView.numberRow = list.rowCount.toString()
                if (list.rowCount * rowHeight < 543) {
                    list.height = list.rowCount * (rowHeight + 20) + 56
                } else {
                    list.height = 599
                }
            }
        }

        DialogInfoSubControl {
            id: rectInfo
            mTxtContent: listModel.getInfomation(indexSelect - 1)
            mWidth: 600
            mHeight: 300
            y: 150
            x: 70
        }

        function showInfo() {
            if (rectInfo.visible === true) {
                rectInfo.visible = false
            } else {
                rectInfo.visible = true
            }
        }
    }

    TK_Navigator {
        id: navGridView
        x: 944
        y: 40
        height: 599
        colorBackground: "#EEF2E7"
        fontName: "MS Gothic"
        fontSize: 27
        maxIndex: list.rowCount

        onKeyChanged: {
            indexSelect = indexRowSelected
            list.selection.clear();
            list.selection.select(indexRowSelected - 1)
        }

        onPressCenterKey: {
            Ops.showCalculator(lbIndex, "1", maxIndex.toString())
        }
    }

    function updateText() {
        paramSetting.onUpdateLang()
        listModel.updateData()
        rectLeftContent.txtSwitchRight = paramSetting.txtForline
        col1.title = paramSetting.txtHSerial
        col2.title = paramSetting.txtHParam
        col3.title = paramSetting.txtHValue
    }

    Component.onCompleted: {
        paramSetting.OnLoad()
        updateColumnName()
        updateText()
        mainModel.onChangeLanguage.connect(updateText)
    }

    function updateColumnName() {
        paramSetting.onUpdateColumnName()
        col1.role = paramSetting.txtCSerial
        col2.role = paramSetting.txtCParam
        col3.role = paramSetting.txtCValue
    }
}
