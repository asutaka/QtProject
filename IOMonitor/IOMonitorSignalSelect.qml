import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.2
import CommonControl 1.0
import "qrc:/Dialog"

Item {
    id: ioMonitorSignalSelect

    property string title: ""
    property string inputName: ""
    property string outputName: ""
    property string internalName: ""
    property string noneName: ""
    property string btnOKName: ""
    property string btnCancelName: ""

    Rectangle {
        id: dlgSignalSelect
        width: 627
        height: 463
        color: "#424142"

        Rectangle {
            id: header
            y: 0
            width: parent.width
            height: 64
            color: "#424142"

            Text {
                id: txtTitle
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
                font.family: "MS Gothic"
                font.pixelSize: 24
                font.bold: true
                color: "#FFFFFF"
                text: title
            }
        }

        Rectangle {
            id: contend
            width: parent.width
            height: parent.height - header.height - footer.height
            y: header.height
            color: "#FFEBDE"

            Rectangle {
                id: leftContend
                anchors.left: parent.left
                width: 210
                height: parent.height
                color: "#FFEBDE"

                RadioButton {
                    id: rdbInputSignal
                    anchors.top: parent.top
                    anchors.topMargin: 40
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    font.family: "MS Gothic"
                    font.pixelSize: 20
                    font.bold: true
                    text: inputName
                    onClicked: {
                        tblView.tableView.visible = true
                        tblView.tableView.model = libraryInput
                    }
                }

                RadioButton {
                    id: rdbOutputSignal
                    anchors.top: rdbInputSignal.top
                    anchors.topMargin: 50
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    font.family: "MS Gothic"
                    font.pixelSize: 20
                    font.bold: true
                    text: outputName
                    onClicked: {
                        tblView.tableView.visible = true
                        tblView.tableView.model = libraryOutput
                    }
                }

                RadioButton {
                    id: rdbInternalSignal
                    anchors.top: rdbOutputSignal.top
                    anchors.topMargin: 50
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    font.family: "MS Gothic"
                    font.pixelSize: 20
                    font.bold: true
                    text: internalName
                    onClicked: {
                        tblView.tableView.visible = true
                        tblView.tableView.model = libraryInternal
                    }
                }

                RadioButton {
                    id: rdbNone
                    anchors.top: rdbInternalSignal.top
                    anchors.topMargin: 50
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    font.family: "MS Gothic"
                    font.pixelSize: 20
                    font.bold: true
                    text: noneName
                    checked: true
                    onClicked: {
                        tblView.tableView.visible = false
                        tblView.tableView.model = null
                    }
                }
            }

            Rectangle {
                id: centerContend
                anchors.left: leftContend.right
                width: parent.width - leftContend.width
                height: parent.height

                DataGridView {
                    id: tblView
                    anchors.fill: parent
                    visible: true

                    Component.onCompleted: {
                        tableView.addColumn(colPort)
                        tableView.addColumn(colSignal)
                        tableView.addColumn(colLineNo)
                        tableView.addColumn(colImageLine)
                        if (rdbNone.checked)
                        {
                            tableView.visible = false
                        }
                    }
                }

                TableViewColumn {
                    id: colIDSignal
                    width: 85
                    role: "idSignal"
                    visible: false
                }

                TableViewColumn {
                    id: colPort
                    width: 100
                    role: "port"
                }

                TableViewColumn {
                    id: colSignal
                    width: 145
                    role: "signal"
                }

                TableViewColumn {
                    id: colLineNo
                    width: 85
                    role: "lineNo"
                }

                TableViewColumn {
                    id: colImageLine
                    width: 85
                    role: "imgLine"
                    visible: false
                }
            }
        }

        Rectangle {
            id: footer
            y: contend.height + contend.y
            width: parent.width
            height: 70
            color: "#424142"

            ToolButton {
                id: btnOK
                width: 144
                height: 66
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.1
                anchors.verticalCenter: parent.verticalCenter

                contentItem: Image {
                    id: imgOK
                    source: btnOK.pressed ? "qrc:/Images/keyboard_btn_touched_okcancel.png" : "qrc:/Images/keyboard_btn_okcancel.png"

                    Text {
                        id: txtOK
                        anchors.centerIn: parent
                        font.family: "MS Gothic"
                        font.pixelSize: 20
                        font.bold: true
                        color: "#FFFFFF"
                        text: btnOKName
                    }
                }

                onClicked: {
                    if (tblView.tableView.rowCount > 0)
                    {
                        var portName = tblView.tableView.model.get(tblView.tableView.currentRow).port
                        var signalName = tblView.tableView.model.get(tblView.tableView.currentRow).signal
                        var lineNoName = tblView.tableView.model.get(tblView.tableView.currentRow).lineNo
                        loaderContent.item.objIOMonitor.settingValueChanel(portName, signalName, lineNoName)
                    }
                    else
                    {
                        loaderContent.item.objIOMonitor.settingValueChanel("None", "", "")
                    }
                    ioMonitorSignalSelect.visible = false
                }
            }

            ToolButton {
                id: btnCancel
                width: btnOK.width
                height: btnOK.height
                anchors.right: parent.right
                anchors.rightMargin: parent.width * 0.1
                anchors.verticalCenter: parent.verticalCenter

                contentItem: Image {
                    id: imgCancel
                    source: btnCancel.pressed ? "qrc:/Images/keyboard_btn_touched_okcancel.png" : "qrc:/Images/keyboard_btn_okcancel.png"

                    Text {
                        id: txtCancel
                        anchors.centerIn: parent
                        font.family: "MS Gothic"
                        font.pixelSize: 20
                        font.bold: true
                        color: "#FFFFFF"
                        text: btnCancelName
                    }
                }

                onClicked: {
                    ioMonitorSignalSelect.visible = false
                }
            }
        }

        ListModel {
            id: libraryInput
            ListElement {
                idSignal: 2
                port: "[A] INA2"
                signal: "MOT ON:M"
                lineNo: "Line 1"
            }
            ListElement {
                idSignal: 3
                port: "[A] INA3"
                signal: "MOT ON:A"
                lineNo: "Line 1"
            }
            ListElement {
                idSignal: 4
                port: "[A] INA4"
                signal: "EXT.ZERO"
                lineNo: "Line 1"
            }
            ListElement {
                idSignal: 6
                port: "[A] INA6"
                signal: "STOP PS1"
                lineNo: "Line 1"
            }
            ListElement {
                idSignal: 7
                port: "[A] INA7"
                signal: "STOP PS2"
                lineNo: "Line 1"
            }
            ListElement {
                idSignal: 8
                port: "[A] INA8"
                signal: "STOP PS3"
                lineNo: "Line 1"
            }
            ListElement {
                idSignal: 9
                port: "[A] INA9"
                signal: "STOP PS4"
                lineNo: "Line 1"
            }
            ListElement {
                idSignal: 10
                port: "[A] INA10"
                signal: "EXNG:SPS"
                lineNo: "Line 1"
            }
        }

        ListModel {
            id: libraryOutput
            ListElement {
                idSignal: 1
                port: "[A] OUTA1"
                signal: "No output"
                lineNo: ""
            }
            ListElement {
                idSignal: 2
                port: "[A] OUTA2"
                signal: "No output"
                lineNo: ""
            }
            ListElement {
                idSignal: 3
                port: "[A] OUTA3"
                signal: "No output"
                lineNo: ""
            }
            ListElement {
                idSignal: 4
                port: "[A] OUTA4"
                signal: "No output"
                lineNo: ""
            }
            ListElement {
                idSignal: 5
                port: "[A] OUTA5"
                signal: "No output"
                lineNo: ""
            }
            ListElement {
                idSignal: 6
                port: "[A] OUTA6"
                signal: "No output"
                lineNo: ""
            }
            ListElement {
                idSignal: 7
                port: "[A] OUTA7"
                signal: "No output"
                lineNo: ""
            }
            ListElement {
                idSignal: 8
                port: "[A] OUTA8"
                signal: "No output"
                lineNo: ""
            }
            ListElement {
                idSignal: 9
                port: "[A] OUTA9"
                signal: "No output"
                lineNo: ""
            }
        }

        ListModel {
            id: libraryInternal
            ListElement {
                idSignal: 1
                port: "PHOTO(W)"
                signal: ""
                lineNo: ""
            }
            ListElement {
                idSignal: 2
                port: "PHOTO(MD)"
                signal: ""
                lineNo: ""
            }
            ListElement {
                idSignal: 3
                port: "PHOTO(R1)"
                signal: ""
                lineNo: ""
            }
        }
    }
}
