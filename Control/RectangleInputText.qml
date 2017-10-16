import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
   property string txtTitle: "TitleInput"
   property string  txtUnit: "ms"
   Rectangle{
       id: rect
       border.color: mouseArea.focus?"#00BFFF":"#DF7401"
       width:280
       height: 40
       color: "transparent"
       border.width: 2
       radius: 5
       Text {
           x:6
           y:5
           anchors.verticalCenter: parent.verticalCenter
           text: txtTitle
           font.pixelSize:18
           color: "white"
       }
       Text{
           x:245
           text: txtUnit
           anchors.verticalCenter: parent.verticalCenter
           font.pixelSize:18
           color: "white"
       }
       TextField {
           id: txtProdLen
           anchors.fill: parent
           anchors.verticalCenter: parent.verticalCenter
           anchors.right: parent.right
           anchors.rightMargin: 40
           text: "1200"
           readOnly: true
           horizontalAlignment :TextInput.AlignRight
           font.pixelSize:18
           style:  TextFieldStyle {
               textColor: "#95B3D7"
               background: Rectangle {
                   color: "transparent"
               }
           }
           validator: IntValidator { bottom:1; top: 275}
           maximumLength: 10
       }
       MouseArea{
           id: mouseArea
           cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
           anchors.fill: parent
           hoverEnabled: true;
           onClicked: {
               inputKeyboard.visible = true;
               myKeyBoard.state ="active";
           }
       }
   }
}
