import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0

Rectangle {
    id: switchControl
    property bool isLeft: true
    property string textLeft
    property string textRight

    signal switchButton(bool isLeft)

    width: 160
    height: 40
    z: 0
    radius: 20
    color: "#28AF09"
    border.width: 1
    border.color: "#F0F3F4"
    Text{
        x: 5
        width: 60
        height: parent.height
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        text: textLeft
        color: "#FFFFFF"
        font.pixelSize: 20
    }
    Text{
        x: 95
        width: 60
        height: parent.height
        text: textRight
        color: "#FFFFFF"
        font.pixelSize: 20
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
    Rectangle{
        id: btnSelect
        width: 95
        height: 40
        z: 1
        radius: 20
        color: "#143BEE"
        border.width: 1
        border.color: "white"
        Text{
            id: textSelect
            anchors.centerIn: parent
            text: textLeft
            color: "#FFFFFF"
            font.pixelSize: 24
        }
        MouseArea{
            anchors.fill: parent
            drag.target: btnSelect
            drag.axis: Drag.XAxis
            drag.minimumX: 0
            drag.maximumX: switchControl.width - btnSelect.width
            onReleased: {
                if(btnSelect.x > 45) {
                    isLeft = false
                }
                else{
                    isLeft = true
                }
                _switchButton(isLeft);
                switchControl.switchButton(isLeft);
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
            switchControl.switchButton(isLeft);
        }
    }
    function _switchButton(_isLeft)
    {
        if(_isLeft)
        {
            textSelect.text = textLeft
            btnSelect.x = 0
        }
        else
        {
            textSelect.text = textRight
            btnSelect.x = switchControl.width - btnSelect.width
        }
    }
}
