import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    property string  txtKey: "A"
    property int widthKey: 60
    property int heightKey: 60
    property string sourceKey:""
    property bool viewImage: false
    property string colorKey: "#9C9C9C"
    property string colorHover: "#1E90FF"
    property string textToolTip: txtKey
    property int fontSizeText: 30
    signal clicked(string sKey);
    signal pressAndHold();
    id: objKey
    ToolButton{
        width: widthKey
        height: heightKey
        Rectangle{
            id: imgChar
            anchors.fill: parent
            color: colorKey
            radius: 5
            Text{
                id: textKey
                anchors.centerIn: parent
                text:txtKey
                font.pixelSize: fontSizeText
                color:"white"
                visible: !viewImage
            }
            Image {
                anchors.fill: parent
                id: img
                source: sourceKey
                visible: viewImage
            }
            states: State {
                name: "pressed"; when: mouseArea.pressed === true
                PropertyChanges { target: imgChar; opacity: .7; color: colorHover}
            }
        }
        ToolTip {
            id: toolTip
            text: textToolTip
            visible: false
            x: 50
            timeout: 500
            background: Rectangle{
                color: "white"
                radius: 3
                height: 35
            }
            contentItem:  Text{
                id: txtToolTip
                font.pixelSize: 18
                text: toolTip.text
                anchors.verticalCenter: TextInput.verticalCenter
            }
        }
        MouseArea{
            id: mouseArea
            cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
            hoverEnabled: true
            anchors.fill: parent
            onClicked: {
                objKey.clicked(textKey.text)
            }
            onHoveredChanged: {
                if(containsMouse){
                    imgChar.color = colorHover
                    toolTip.visible= true;
                }
                else{
                    imgChar.color = colorKey
                    toolTip.visible= false;
                }
            }
           onPressAndHold: {
               objKey.pressAndHold()
           }
        }
    }
}
