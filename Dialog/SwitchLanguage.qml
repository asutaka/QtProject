import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Extras 1.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.2
import QtQuick.Window 2.0

Rectangle{
    property int indexSelect: 0
    property Rectangle itemDialog: roundRect
    id: roundRect
    anchors.centerIn: parent
    color: "#2E2E2E"
    width: 300
    height: 400
    radius: 20
    Rectangle{
        x: 80
        y: 15
        width: 140
        height: 40
        color:"transparent"
        Text{
            anchors.fill: parent
            color: "white"
            text: "Language"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 25
        }
    }
    Rectangle {
        y: 68
        width: parent.width
        anchors.left: parent.Left
        height: 4
        color:"#8A2908"
    }
    ListModel {
        id: source
        ListElement {
            image: "../Images/ensign_jp.png"
            language:"Japan"
        }
        ListElement {
            image: "../Images/ensign_eg.png"
            language:"English"
        }
    }
    TableView {
        id: list
        y: 70
        x: 0
        width: parent.width
        height: 300
        antialiasing: true
        headerVisible: false
        anchors.rightMargin: -726
        highlightOnFocus: true
        anchors.topMargin: 64
        anchors.leftMargin: 14
        model: source
        alternatingRowColors: true
        frameVisible: false
        TableViewColumn {
            id:col1
            width:list.width/3
            movable : false
            role: "image"
            delegate: Rectangle{
                color: "transparent"
                Image {
                    id: myIcon;
                    sourceSize.height: 34*2
                    sourceSize.width: 24*2
                    source: styleData.value;
                    anchors.centerIn: parent
                }
            }
        }
        TableViewColumn {
            id:col2
            movable : false
            role: "language"
            delegate: Rectangle{
                color: "transparent"
                width: 2*list.width/3
                Text {
                    height: 50
                    width: 150
                    id: iContent
                    color: "black"
                    text: styleData.value
                    font.pixelSize: 18
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }
        style: TableViewStyle {
            rowDelegate:Rectangle{
                height: list.height/6
                border.color: "#9cb65a"
                border.width:1
                color: styleData.selected ? "#f79642" :(styleData.alternate ? "white" : "#efe7b5")
                Image {
                    id: imgCheck1
                    x: 250
                    y: 5
                    sourceSize.height: 31
                    sourceSize.width: 30
                    source: "../Images/language_check.png"
                    visible: styleData.selected ? true : false
                }
            }
            handle: Rectangle {
                implicitWidth: 14
                implicitHeight: 0

                Rectangle {
                    color: "#f79642"
                    anchors.fill: parent
                    border.color: "white"
                    border.width: 2
                }
            }
            decrementControl: Rectangle {
                visible: false
            }
            incrementControl: Rectangle {
                visible: false
            }
        }

        onDoubleClicked: {
            appWindow.closeDialog();
            mainModel.language = row;
            mainModel.onChangeLanguage();
        }

        Component.onCompleted: {
            console.log("language: " + mainModel.language);
            indexSelect = mainModel.language;
            list.selection.select(indexSelect);
        }
    }
}
