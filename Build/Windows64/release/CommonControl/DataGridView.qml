import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.2

Item {
    id: dataGridView

    property TableView tableView: tblView
    property string indexRow: "0"
    property string totalRow: "0"
    readonly property int stepRow: 6
    property int indexSelect: 1
    property ListModel source: null

    Rectangle {
        id: contend
        width: 417
        height: 329
        color: "#FFEBDE"

        Rectangle {
            id: centerContend
            anchors.left: parent.left
            width: parent.width
            height: parent.height

            TableView {
                id: tblView
                headerVisible: false
                anchors.left: parent.left
                width: parent.width - rightContend.width
                height: parent.height
                model: source

                style: TableViewStyle {
                    itemDelegate:
                        Text {
                        id: iContent
                        color: "black"
                        text: styleData.value
                        font.pixelSize: 14
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }
                    rowDelegate: Rectangle {
                        id: curItem
                        width: tblView.width
                        height: tblView.height / stepRow
                        border.color: "#9cb65a"
                        border.width: 1
                        color: styleData.selected ? "#f79642" :"#eff3e7"
                    }
                    frame: Rectangle {
                        border {
                            color: "#c6c3c6"
                        }
                    }
                }

                onClicked: {
                    indexSelect = tblView.currentRow + 1
                    txtIndexRow.text = indexSelect.toString()
                }

                onRowCountChanged: {
                    centerContend.updateTableView()
                }

                Component.onCompleted: {
                    centerContend.updateTableView()
                }
            }

            Rectangle {
                id: rightContend
                anchors.right: parent.right
                width: 68
                height: parent.height
                color: "#FFEBDE"

                ToolButton {
                    id: btnPageUp
                    anchors.right: parent.right
                    width: 68
                    height: 60
                    contentItem: Image {
                        id: imgPageUp
                        anchors.fill: parent
                        source: btnPageUp.pressed ? "qrc:/Images/scroll_pageup_on.png" : "qrc:/Images/scroll_pageup_off.png"
                    }

                    onClicked: {
                        if (tblView.rowCount > 0) {
                            indexSelect = (Math.floor((indexSelect / stepRow)) - 1) * stepRow
                            if(indexSelect < 1) {
                                indexSelect = 1
                            }
                            txtIndexRow.text = indexSelect;
                            tblView.selection.clear()
                            tblView.selection.select(indexSelect - 1)
                            tblView.positionViewAtRow(indexSelect - 1, ListView.Beginning)
                        }
                    }
                }

                ToolButton {
                    id: btnRowUp
                    anchors.right: parent.right
                    anchors.top: btnPageUp.bottom
                    anchors.topMargin: 2
                    width: btnPageUp.width
                    height: btnPageUp.height
                    contentItem: Image {
                        id: imgRowUp
                        anchors.fill: parent
                        source: btnRowUp.pressed ? "qrc:/Images/scroll_lineup_on.png" : "qrc:/Images/scroll_lineup_off.png"
                    }

                    onClicked: {
                        if (tblView.rowCount > 0) {
                            indexSelect--
                            if(indexSelect < 1) {
                                indexSelect = 1;
                            }
                            txtIndexRow.text = indexSelect
                            tblView.selection.clear()
                            tblView.selection.select(indexSelect - 1)
                            tblView.positionViewAtRow(indexSelect - 1, ListView.Beginning)
                        }
                    }
                }

                ToolButton {
                    id: btnCenter
                    anchors.right: parent.right
                    anchors.top: btnRowUp.bottom
                    anchors.topMargin: 2
                    width: btnPageUp.width
                    height: 81

                    contentItem: Image {
                        id: imgCenter
                        anchors.fill: parent
                        source: btnCenter.pressed ? "qrc:/Images/scroll_centerkey_p.png" : "qrc:/Images/scroll_centerkey.png"

                        Text {
                            id: txtIndexRow
                            anchors.top: parent.top
                            anchors.topMargin: parent.height * 0.1
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.family: "MS Gothic"
                            font.pixelSize: 20
                            font.bold: true
                            text: indexRow
                        }

                        Rectangle {
                            anchors.centerIn: parent
                            width: 30
                            height: 3
                            color: "#000000"
                        }

                        Text {
                            id: txtTotalRow
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: parent.height * 0.1
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.family: "MS Gothic"
                            font.pixelSize: 20
                            font.bold: true
                            text: totalRow
                        }
                    }
                }

                ToolButton {
                    id: btnRowDown
                    anchors.bottom: btnPageDown.top
                    anchors.bottomMargin: 2
                    anchors.right: parent.right
                    width: btnPageUp.width
                    height: btnPageUp.height
                    contentItem: Image {
                        id: imgRowDown
                        anchors.fill: parent
                        source: btnRowDown.pressed ? "qrc:/Images/scroll_linedown_on.png" : "qrc:/Images/scroll_linedown_off.png"
                    }

                    onClicked: {
                        if (tblView.rowCount > 0) {
                            indexSelect++
                            if (indexSelect > tblView.rowCount){
                                indexSelect = tblView.rowCount
                            }
                            txtIndexRow.text = indexSelect.toString()
                            tblView.selection.clear()
                            tblView.selection.select(indexSelect - 1);
                            tblView.positionViewAtRow(indexSelect - 1, ListView.End)
                        }
                    }
                }

                ToolButton {
                    id: btnPageDown
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    width: btnPageUp.width
                    height: btnPageUp.height
                    contentItem: Image {
                        id: imgPageDown
                        anchors.fill: parent
                        source: btnPageDown.pressed ? "qrc:/Images/scroll_pagedown_on.png" : "qrc:/Images/scroll_pagedown_off.png"
                    }

                    onClicked: {
                        if (tblView.rowCount > 0) {
                            indexSelect = (Math.floor((indexSelect / stepRow)) + 1) * stepRow
                            if (indexSelect > tblView.rowCount){
                                indexSelect = tblView.rowCount
                            }
                            txtIndexRow.text = indexSelect.toString()
                            tblView.selection.clear()
                            tblView.selection.select(indexSelect - 1);
                            tblView.positionViewAtRow(indexSelect - 1, ListView.End)
                        }
                    }
                }
            }

            function updateTableView()
            {
                if (tblView.rowCount > 0) {
                    indexSelect = 1
                    txtIndexRow.text = indexSelect.toString()
                    txtTotalRow.text = tblView.rowCount
                    tblView.selection.select(indexSelect - 1)
                }
                else {
                    indexSelect = 0
                    tableView.selection.clear()
                    txtIndexRow.text = "0"
                    txtTotalRow.text = "0"
                }
            }
        }
    }
}
