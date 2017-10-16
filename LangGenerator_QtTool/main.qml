import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.0
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    id: applicationWindow
    property int temp: 0
    property string outputPathDefault: "C:/LangGenerator/Output/GenFileCode"
    property string passwordDefault: "anlab2017"
    property bool isSQLite: true
    visible: true
    width: 500
    height: 280
    title: qsTr("Language Generator")
    GroupBox {
        x: 7
        y: 8
        width: 485
        height: 82
        title: qsTr("Input Excel File")
        Rectangle{
            property string display
            id:rectInput
            anchors.fill: parent
            color:"transparent"
            Label {
                id: lbFileName
                x: 0
                y: 11
                text: qsTr("File Name:")
            }
            DropArea{
                id: dropArea
                anchors.fill: parent
                onDropped: {
                    if (drop.hasText) {
                        if (drop.proposedAction == Qt.MoveAction || drop.proposedAction == Qt.CopyAction) {
                            if(((drop.text.indexOf(".xls")!=-1)||(drop.text.indexOf(".xlsx")!= -1))){
                                drop.acceptProposedAction();
                                rectInput.display = getFilePath(drop.text);
                            }
                        }
                    }
                }
            }
            ToolTip {
                id: toolTip
                text: qsTr("Please drag excel file(*.xls,*.xlsx) into area input!")
                visible: false
                y: parent.y-24
                background: Rectangle{
                    color: "#F2EFFB"
                    radius: 3
                }
                contentItem:  Text{
                    id: txtToolTip
                    text: toolTip.text
                    anchors.verticalCenter: TextInput.verticalCenter
                }
            }
            MouseArea{
                id: mouseArea
                cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
                hoverEnabled: true
                anchors.fill: parent
                onHoveredChanged: {
                    if(txtInput.text ==""){
                        if(containsMouse){
                            rectInput.color = "#BDBDBD"
                            toolTip.visible= true;
                        }
                        else{
                            rectInput.color = "transparent"
                            toolTip.visible= false;
                        }
                    }
                }
            }
        }
    }
    Rectangle{
        x: 423
        y: 37
        width: 47
        height: 26
        border.color: "#084B8A"
        radius: 3
        color: "#81DAF5"
        ToolButton {
            id: btnBrowseInput
            anchors.fill: parent
            text: qsTr("Browse")
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    temp = 1;
                    fileDialog.selectFolder = false;
                    fileDialog.visible = true;
                }
            }
        }
    }
    Text {
        id: txtMsgInput
        x: 75
        y: 38
        color: "red"
        text: qsTr("")
        font.pixelSize: 12
    }
    TextField {
        id: txtInput
        x: 75
        y: 38
        width: 342
        height: 25
        text: rectInput.display
        onTextChanged: {
            if(txtInput.text !=""){
                txtMsgInput.text = "";
            }
        }
    }

    GroupBox {
        id: gbOutput
        x: 7
        y: 103
        width: 485
        height: 109
        title: qsTr("Output")
        Label {
            id: label2
            x: 0
            y: 11
            text: qsTr("Output folder:")
        }
        Rectangle{
            x: 422
            y: 4
            width: 47
            height: 26
            border.color: "#084B8A"
            radius: 3
            color: "#81DAF5"
            ToolButton {
                id: btnBrowseOutput
                anchors.fill: parent
                text: qsTr("Browse")
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        temp = 2;
                        fileDialog.selectFolder = true;
                        fileDialog.visible = true;
                    }
                }
            }
        }
        TextField {
            id: txtOutputPath
            text: outputPathDefault
            x: 75
            y: 5
            width: 342
            height: 25
            onTextChanged: {
                if(txtOutputPath.text !=""){
                    txtMsgOutput.text = "";
                }
            }
        }

        Text {
            id: txtMsgOutput
            x: 74
            y: 38
            color: "red"
            text: qsTr("")
            font.pixelSize: 12
        }
        Text{
            x: 0
            y: 56
            text: "Output file mode: "
        }
        RowLayout {
            x: 114
            y: 54
            ExclusiveGroup { id: tabPositionGroup }
               RadioButton {
                   x: 262
                   y: 52
                   text: "SQLite file"
                   checked: true
                   exclusiveGroup: tabPositionGroup
                   onClicked: {
                       isSQLite = true;
                   }
               }
               RadioButton {
                   x: 117
                   y: 54
                   text: "Binary file"
                   exclusiveGroup: tabPositionGroup
                   onClicked: {
                       isSQLite = false;
                   }
               }
           }

    }
    Rectangle{
        id: rectBtnGenerator
        x: 147
        y: 225
        width: 224
        height: 50
        border.color: "#084B8A"
        radius: 3
        color: "#F7BE81"
        ToolButton {
            id: btnGenerator
            anchors.fill: parent
            text: qsTr("Generator")
        }
        MouseArea{
            anchors.rightMargin: 0
            anchors.bottomMargin: -1
            anchors.leftMargin: 0
            anchors.topMargin: 1
            anchors.fill: parent
            onPressed: {
                rectBtnGenerator.color ="#F6E3CE";
            }
            onReleased: {
                rectBtnGenerator.color ="#F7BE81";
                if((txtOutputPath.text !="")&&(txtInput.text)!=""){
                    mainWindow.btnGenerator_Click(txtInput.text,txtOutputPath.text,isSQLite);
                }
                else if(txtOutputPath.text ==""){
                    txtMsgOutput.text = "Please choose output folder!"
                }
                else if(txtInput.text ==""){
                    txtMsgInput.text = "Please import file access!"
                }
                else{
                    txtMsgOutput.text = "Please choose output folder!";
                    txtMsgInput.text = "Please import file access!";
                }
            }
        }
    }
    FileDialog {
        id: fileDialog
        title: "Please choose a access file"
        nameFilters: [ "Data Excel files (*.xls *.xlsx)"]
        visible: false

        onAccepted: {
            if(temp ===1){
                txtInput.text = getFilePath(fileDialog.fileUrls.toString());
                txtMsgInput.text = "";
            }
            else if(temp ===2){
                txtOutputPath.text = getFilePath(fileDialog.folder.toString());
                txtMsgOutput.text = "";
            }
        }
        onVisibleChanged: {
            if(fileDialog.visible){
                if(txtInput.text!==""){
                    fileDialog.folder ="file:///" + txtInput.text.replace("\\","/").substr(0, txtInput.text.lastIndexOf("/"));
                }
                else {
                    folder = shortcuts.home;
                }
            }
        }
        onRejected: {
            fileDialog.visible= false;
        }
    }
    function getFilePath(strInput){
        var sResult = "";
        if(strInput.length > 8){
            sResult = strInput.substring(8,strInput.length);
        }
        return sResult;
    }
}
