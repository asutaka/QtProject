import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Extras 1.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.2
import QtQuick.Window 2.0

Rectangle{
    id: roundRect
    property int indexSelect: 0
    property Rectangle itemDialog: roundRect
    signal selectItem()

    anchors.centerIn: parent
    color: "#2E2E2E"
    width: 500
    height: 400
    radius: 20
    Rectangle{
        x: 130
        y: 15
        width: 240
        height: 40
        color:"transparent"
        Text{
            anchors.fill: parent
            color: "white"
            text: "Country - Theme"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 22
            font.family: "MS Gothic"
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
            theme: "Black"
        }
        ListElement {
            image: "../Images/ensign_eg.png"
            language:"English"
            theme: "Blue Cerulean"
        }
        ListElement {
            image: ""
            language:"VietNamese"
            theme: "Dark"
        }
        ListElement {
            image: ""
            language:"Chinese"
            theme: "Brown Sand"
        }
        ListElement {
            image: ""
            language:"Korea"
            theme: "Blue NCS"
        }
        ListElement {
            image: ""
            language:"India"
            theme: "High Contrast"
        }
        ListElement {
            image: ""
            language:"ThaiLand"
            theme: "Blue Icy"
        }
        ListElement {
            image: ""
            language:"Combodiese"
            theme: "Qt"
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
        model: source //[ "Black", "Blue Cerulean", "Dark","Brown Sand", "Blue NCS", "High Contrast","Blue Icy", "Qt" ]
        alternatingRowColors: true
        frameVisible: false
        TableViewColumn {
            id:col1
            width:list.width/4
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
                width: 2*list.width/4
                Text {
                    height: 50
                    width: 150
                    id: iContent
                    color: "black"
                    text: styleData.value
                    font.family: "MS Gothic"
                    font.pointSize: 16
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }
        TableViewColumn{
            id:col3
            movable : false
            role: "theme"
            delegate: Rectangle{
                color: "transparent"
                width: 3*list.width/4
                Text {
                    height: 50
                    width: 150
                    id: themeTitle
                    color: "black"
                    text: styleData.value
                    font.pointSize: 16
                    font.family: "MS Gothic"
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
                    x: 450
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

            indexSelect = row;
            roundRect.selectItem()

        }
        Component.onCompleted: {
//            indexSelect = appWindow.langCode;
            indexSelect = mainModel.language;
            list.selection.select(indexSelect);
        }
    }
}
