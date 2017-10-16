import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import ControlApp 1.0

Item {
    property Item sensCorrStep: sensCorrStepContent
    property SensCorrStep  sensCorrStep1: drawContent
    property bool imgActive: true
    property bool checkBox: false
    id: sensCorrStepContent
    width: 1024
    height: 768
    opacity: 1
    SensCorrStep{
        id: drawContent
        width: 1024
        height: 640
        x:0
        y:0

        MouseArea{
            anchors.fill: parent
            propagateComposedEvents: true
            onPressed: {
                if(checkBox && image.visible ===false){
                    sensCorrStep1.onClickToSeclectLinePanel(mouseX,mouseY);
                }
            }
        }
        Rectangle{
            Text {
                id: _lblTitleStep
                x: 5
                y: 0
                width: 806
                height: 48
                text: qsTr("Step Title")
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
            Text {
                id: _lblGuideStep
                x: 8
                y: 35
                width: 859
                height: 74
                text: qsTr("Tap to select line")
                font.family: "MS Gothic"
                verticalAlignment: Text.AlignVCenter
                textFormat: Text.PlainText
                font.pixelSize: 26
            }

            Rectangle{
                id: image
                ToolButton {
                    id: _exPlaneBtn
                    x: 833
                    y: 19
                    width: 180
                    height: 40
                    Image{
                        id: imgExplain
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
                            imgExplain.source= "../Images/btn_touched_180_40.png"
                        }
                        onReleased:{
                            imgExplain.source= "../Images/btn_180_40.png"
                        }
                        onCanceled: {
                            imgExplain.source= "../Images/btn_180_40.png"
                        }
                    }
                }
                Image {
                    id: _imgStep1g
                    x: 266
                    y: 114
                    width: 56
                    height: 58
                    anchors.leftMargin: 3
                    source: "../Images/1_s_green.png"
                }
                Image {
                    id: _imgStep1w
                    x: 266
                    y: 114
                    width: 56
                    height: 58
                    visible: false
                    anchors.leftMargin: 3
                    source: "../Images/1_s_white.png"
                }

                Image {
                    id: _imgArrow1
                    x: 335
                    y: 133
                    width: 17
                    height: 23
                    anchors.leftMargin: 3
                    source: "../Images/arrow_right.png"
                }
                Image {
                    id: _imgStep2g
                    x: 366
                    y: 114
                    width: 56
                    height: 58
                    visible: false
                    anchors.leftMargin: 3
                    source: "../Images/2_s_green.png"
                }
                Image {
                    id: _imgStep2w
                    x: 366
                    y: 114
                    width: 56
                    height: 58
                    anchors.leftMargin: 3
                    source: "../Images/2_s_white.png"
                }
                Image {
                    id: _imgArrow2
                    x: 435
                    y: 133
                    width: 17
                    height: 23
                    anchors.leftMargin: 3
                    source: "../Images/arrow_right.png"
                }
                Image {
                    id: _imgStep3g
                    x: 466
                    y: 114
                    width: 56
                    height: 58
                    visible: false
                    anchors.leftMargin: 3
                    source: "../Images/3_s_green.png"
                }
                Image {
                    id: _imgStep3w
                    x: 466
                    y: 114
                    width: 56
                    height: 58
                    anchors.leftMargin: 3
                    source: "../Images/3_s_white.png"
                }
                Image {
                    id: _imgWeight
                    x: 935
                    y: 66
                    width: 27
                    height: 39
                    visible: false
                    anchors.leftMargin: 3
                    source: "../Images/weight.png"
                }
            }
            Image {
                id: _imgScaleLarge
                x: 885
                y: 105
                width: 127
                height: 73
                anchors.leftMargin: 3
                source: "../Images/scale_large.png"
            }
            Rectangle{
                x: 542
                y: 101
                width: 337
                height: 86
                color:"#ffc300"
                radius: 10
                Text {
                    id: _lblTitleMasterWeight
                    text: qsTr("Master Weight")
                    font.family: "MS Gothic"
                    verticalAlignment: Text.AlignVCenter
                    textFormat: Text.PlainText
                    font.pixelSize: 26
                }
                Text {
                    id: _lblValueMasterWeight
                    x: 181
                    y: 46
                    width: 105
                    height: 33
                    text: qsTr("50.000")
                    font.family: "MS Gothic"
                    verticalAlignment: Text.AlignVCenter
                    textFormat: Text.PlainText
                    font.pixelSize: 26
                }
                Text {
                    id: _lblUnitMasterWeight
                    x: 294
                    y: 46
                    width: 36
                    height: 32
                    text: qsTr("mg")
                    font.family: "MS Gothic"
                    verticalAlignment: Text.AlignVCenter
                    textFormat: Text.PlainText
                    font.pixelSize: 26
                }
            }
        }
    }
    function setValue(weight,isCheck){
        _lblValueMasterWeight.text= weight;
        checkBox =isCheck;
    }
    function setImgActive(isVisible){
        image.visible = !isVisible;
    }
    function visibleImageStep(index)
    {
        if(index ===0)
        {
            _lblGuideStep.text="Next to screen step 1";
        }
        else if(index === 1)
        {
            _imgStep1g.visible=false
            _imgStep1w.visible=true
            _imgStep2g.visible=true
            _imgStep2w.visible=false
            _imgStep3g.visible=false
            _imgStep3w.visible=true
            _imgWeight.visible=true
            _lblGuideStep.text="Next to screen step 2";
        } else if (index === 2)
        {
            _imgStep1g.visible=false
            _imgStep1w.visible=true
            _imgStep2g.visible=false
            _imgStep2w.visible=true
            _imgStep3g.visible=true
            _imgStep3w.visible=false
            _imgWeight.visible=true
            _lblGuideStep.text="Next to screen step 3";
        }
        else
        {
            _imgStep1g.visible=false
            _imgStep1w.visible=true
            _imgStep2g.visible=false
            _imgStep2w.visible=true
            _imgStep3g.visible=true
            _imgStep3w.visible=false
            _imgWeight.visible=true
            _lblGuideStep.text="Text of screen step 3";
        }
    }
}
