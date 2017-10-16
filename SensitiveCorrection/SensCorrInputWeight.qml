import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import "qrc:/Control/VirtualKey.js" as Ops


Item {
    property Item sensCorrInputWeight: sensCorrInputWeightContent
    id: sensCorrInputWeightContent
    width: 1024
    height: 768
    opacity: 1
    Image{
        anchors.fill: parent
        source: "../Images/Navi_Background.png"
    }
    Rectangle{
        id: rectangle1

        Text {
            id: _wizardTitleLabel
            x: 5
            y: 0
            width: 809
            height: 45
            text: qsTr("Input Inner Weight")
            font.family: "MS Gothic"
            verticalAlignment: Text.AlignVCenter
            textFormat: Text.PlainText
            font.pixelSize: 28
        }
        Rectangle{
            id: _rectLine
            x: 5
            y: 40
            width: 809
            height: 4
            color: "#0099FF"
        }
        ToolButton {
            id: _exPlaneBtn
            x: 833
            y: 19
            width: 180
            height: 40
            Image{
                id: imgCaution
                anchors.fill: parent
                source: "../Images/btn_180_40.png"
                Text {
                    text: "Explain"
                    font.pixelSize: 21
                    color: "#ffffff"
                    anchors.centerIn: parent
                }
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    imgCaution.source= "../Images/btn_touched_180_40.png"
                }
                onReleased:{
                    imgCaution.source= "../Images/btn_180_40.png"
                }
                onCanceled: {
                    imgCaution.source= "../Images/btn_180_40.png"
                }
            }
        }
        Text {
            id: _guideLabel
            x: 91
            y: 183
            width: 474
            height: 81
            text: qsTr("Please input weight of mass")
            font.family: "MS Gothic"
            textFormat: Text.PlainText
            font.pixelSize: 26
        }
        Rectangle{
            x: 100
            y: 280
            width: 793
            height: 214
            color: "#dee7f7"
            border.color: "#ffffff"
            border.width: 3
            radius: 10
            opacity: 1
            Text {
                id: cwLabel2
                x: 9
                y: 2
                width: 24
                height: 25
                text: qsTr("*")
                font.family: "MS Gothic"
                textFormat: Text.PlainText
                verticalAlignment: Text.AlignTop
                font.pixelSize: 24
                color: "red"
            }
            Text {
                id: _masterWeightTitleLabel
                x: 29
                y: 6
                width: 385
                height: 48
                text: qsTr("Master Weight")
                font.family: "MS Gothic"
                textFormat: Text.PlainText
                font.pixelSize: 28
            }
            TextField{
                id: _lblValueAutoWeight
                x: 472
                y: 7
                width: 236
                height: 42
                validator: DoubleValidator {}
                inputMethodHints: Qt.ImhFormattedNumbersOnly
                text: qsTr("")
                readOnly: true
                font.family: "MS Gothic"
                font.pixelSize: 26
                style: TextFieldStyle {
                    background: Rectangle {
                        border.color: "black"
                        border.width: 1
                    }
                }

                onActiveFocusChanged:
                {
                    if(activeFocus)
                    {
                        Ops.showCalculator(_lblValueAutoWeight,"0","100");
                    }
                }
            }

            Text {
                id: _weightRangeUnitLabel2
                x: 732
                y: 7
                width: 40
                height: 42
                text: qsTr("g")
                verticalAlignment: Text.AlignVCenter
                font.family: "MS Gothic"
                textFormat: Text.PlainText
                font.pixelSize: 26
            }
            Text {
                id: _useLabel
                x: 28
                y: 53
                width: 754
                height: 139
                text: qsTr("If a subtition is used")
                font.family: "MS Gothic"
                textFormat: Text.PlainText
                font.pixelSize: 26
            }
        }

        Rectangle{

            x: 496
            y: 220
            width: 397
            height: 55
            color: "#dee7f7"
            border.color: "#ffffff"
            border.width: 3
            radius: 10

            Text {
                x: 0
                y: 0
                width: 397
                height: 55
                id: _weightRangeTitleLabel
                verticalAlignment: Text.AlignVCenter
                text: qsTr("Weight Range")
                font.family: "MS Gothic"
                textFormat: Text.PlainText
                font.pixelSize: 26
            }
            Text {
                id: _weightRangeLabel
                x: 189
                y: 9
                width: 157
                height: 33
                text: qsTr("")
                verticalAlignment: Text.AlignVCenter
                font.family: "MS Gothic"
                textFormat: Text.PlainText
                font.pixelSize: 26
            }
            Text {
                id: _weightRangeUnitLabel
                x: 334
                y: 9
                width: 47
                height: 35
                text: qsTr("mg")
                verticalAlignment: Text.AlignVCenter
                font.family: "MS Gothic"
                textFormat: Text.PlainText
                font.pixelSize: 26
            }
        }

        CheckBox{
            id: _selectLineCheckBox
            x: 96
            y: 533
            width: 788
            height: 35
            Text {
                x: 35
                y: 5
                id: name
                text: qsTr("Select Lines")
                verticalAlignment: Text.AlignVCenter
                font.family: "MS Gothic"
                textFormat: Text.PlainText
                font.pixelSize: 24
            }
            style: CheckBoxStyle {
                indicator: Rectangle {
                    implicitWidth: 26
                    implicitHeight: 26
                    radius: 3
                    border.color: control.activeFocus ? "darkblue" : "gray"
                    border.width: 1
                    Rectangle {
                        visible: control.checked
                        color: "#555"
                        border.color: "#333"
                        radius: 1
                        anchors.margins: 4
                        anchors.fill: parent
                    }
                }
            }

        }
    }
    function getValueInput(){
        return _lblValueAutoWeight.text;
    }
    function getStateCheckbox(){
        return _selectLineCheckBox.checked;
    }
}
