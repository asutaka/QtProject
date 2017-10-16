import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0

Rectangle {
    id: switchOnOff
    property bool isLeft: true
    property string textLeftOff
    property string textRightOn
    property color colorOn
    property color colorOff
    property color colorDefault

    signal switchButton(bool isLeft)

    width: 120
    height: 50
    z: 0
    radius: 30
    color: colorDefault
    border.width: 1
    border.color: "#F0F3F4"
    Text{
        x: 0
        width: 60
        height: parent.height
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        text: textLeftOff
        color: "#FFFFFF"
        font.pixelSize: 20
    }
    Text{
        x: 70
        width: 60
        height: parent.height
        text: textRightOn
        color: "#FFFFFF"
        font.pixelSize: 20
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
    Rectangle{
        id: btnSelect
        y:-10
        width: 70
        height: 70
        z: 1
        radius: 50
        color: "red"
        border.width: 1
        border.color: "white"

        Text{
            id: textSelect
            anchors.centerIn: parent
            text: textLeftOff
            color: "#FFFFFF"
            font.pixelSize: 24
        }
        MouseArea{
            anchors.fill: parent
            drag.target: btnSelect
            drag.axis: Drag.XAxis
            drag.minimumX: 0
            drag.maximumX: switchOnOff.width - btnSelect.width
            onReleased: {
                if(btnSelect.x > 45) {
                    isLeft = false
                }
                else{
                    isLeft = true
                }
                _switchButton(isLeft);
                switchOnOff.switchButton(isLeft);
            }
        }
    }
    MouseArea{
        anchors.fill: parent
        onPressed: {
            if(isLeft){
                isLeft = false
            }
            else {
                isLeft = true
            }
            _switchButton(isLeft);
            switchOnOff.switchButton(isLeft);
        }
    }
    function _switchButton(_isLeft)
    {
        if(_isLeft)
        {
            textSelect.text = textLeftOff
            btnSelect.color=colorOff
            btnSelect.x = 0
        }
        else
        {
            textSelect.text = textRightOn
            btnSelect.color=colorOn
            btnSelect.x = switchOnOff.width - btnSelect.width
        }
    }
}
