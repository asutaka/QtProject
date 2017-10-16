import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.2

Item{
    property Item settingDialog: gridview
    property ListModel source: null
    property ListModel sourceDetail: null
    property int indexSelect:1;
    property string value:"";
    property int linePage:6;
    property string title: "Title"
    property int temp;
    property int sizeHeight: 480
    property int sizeWidth: 626
    property string strOKCancel: "OK"

    id: gridview
    signal send()
    Rectangle {
        x: 0
        y: 0
        width: sizeWidth
        height: sizeHeight
        border.color: "gray"
        border.width: 2
        color: "#eff3e7"
        smooth: false
        Rectangle{
            x: 2
            y: 2
            width: (sizeWidth-4)
            height: 60
            color: "#393839"
            Text {
                anchors.verticalCenter: Text.verticalCenter
                x: 10
                y: 17
                id: txtTitle
                text: title
                font.pixelSize:27
                color: "lightblue"
            }
        }
        Rectangle{
            TableView {
                id: list
                x: 0
                y: 100
                width: sizeWidth/2
                height: 334
                antialiasing: true
                headerVisible: false
                anchors.rightMargin: -245
                highlightOnFocus: true
                anchors.topMargin: 63
                anchors.leftMargin: 2
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.left: parent.left
                model: source
                alternatingRowColors: true
                TableViewColumn {
                    id:col2
                    movable : false
                    role: "title"
                    title: "Title"
                }

                style: TableViewStyle {
                    itemDelegate:
                        Text {
                        x: 30
                        id: iContent
                        color: "black"
                        text: styleData.value
                        font.pixelSize:27
                        verticalAlignment: Text.AlignVCenter
                    }
                    rowDelegate: Rectangle {
                        id: curItem
                        width: list.width
                        height: list.height/linePage
                        border.color: "#9cb65a"
                        border.width:1
                        color: styleData.selected ? "#f79642" :"#eff3e7"
                    }
                    frame: Rectangle {
                        border{
                            color: "#c6c3c6"
                        }
                    }
                    handle: Rectangle {
                        width: list.width
                        height: list.height
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
                onClicked: {
                    indexSelect=list.currentRow+1;
                    txtSelectIndex.text=indexSelect.toString();
                }
                Keys.onPressed:
                {
                    if(event.key === Qt.Key_Down)
                    {
                        if(indexSelect<list.rowCount){
                            txtSelectIndex.text=(++indexSelect).toString();
                        }
                    }
                    else if(event.key === Qt.Key_Up)
                    {
                        if(indexSelect>1){
                            txtSelectIndex.text=(--indexSelect).toString();
                        }
                    }

                }
                Component.onCompleted: {
                    txtSelectIndex.text=1;
                    txtListViewCount.text = list.rowCount.toString()
                    for (var i = 0; i< list.model.count;i++){
                        if( list.model.get(i).title === value){
                            indexSelect = i;
                            break;
                        }
                    }
                    list.selection.select(indexSelect);
                }
            }

        }

            ToolButton {
                x: sizeWidth-68
                y: 64
                width: 68
                height: 60
                Image {
                    id: imgPageUp
                    anchors.fill: parent
                    source: "../Images/scroll_pageup_off.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        imgPageUp.source= "../Images/scroll_pageup_on.png"
                        temp =((Math.floor(indexSelect/linePage))-1)*linePage ;
                        if(temp < 1){
                            indexSelect = 1;
                        }
                        else{ indexSelect = temp;}
                        txtSelectIndex.text=indexSelect;
                        list.selection.clear();
                        list.selection.select(indexSelect-1);
                        list.positionViewAtRow(indexSelect-1,ListView.Beginning);
                    }
                    onReleased:{
                        imgPageUp.source= "../Images/scroll_pageup_off.png"
                    }
                    onCanceled: {
                        imgPageUp.source= "../Images/scroll_pageup_off.png"
                    }
                }

            }

            ToolButton {
                x: sizeWidth-68
                y: 126
                width: 68
                height: 60
                Image {
                    id: imgLineUp
                    anchors.fill: parent
                    source: "../Images/scroll_lineup_off.png"
                }
                MouseArea {
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 1
                    anchors.leftMargin: 0
                    anchors.topMargin: -1
                    anchors.fill: parent
                    onPressed: {
                        imgLineUp.source= "../Images/scroll_lineup_on.png"
                        if(indexSelect>1)
                        {
                            txtSelectIndex.text=(--indexSelect).toString();
                            list.selection.clear();
                            list.selection.select(indexSelect-1);
                            list.positionViewAtRow(indexSelect-1,ListView.Beginning);
                        }
                    }
                    onReleased:{
                        imgLineUp.source= "../Images/scroll_lineup_off.png"
                    }
                    onCanceled: {
                        imgLineUp.source= "../Images/scroll_lineup_off.png"
                    }
                }
            }

            ToolButton {
                x: sizeWidth-68
                y: 336
                width: 68
                height: 60
                Image {
                    id: imgPageDown
                    anchors.fill: parent
                    source: "../Images/scroll_pagedown_off.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        imgPageDown.source= "../Images/scroll_pagedown_on.png"
                        temp =((Math.floor(indexSelect/linePage))+1)*linePage ;
                        if(temp <list.rowCount){
                            indexSelect = temp;
                        }
                        else{
                            indexSelect= list.rowCount;
                        }
                        txtSelectIndex.text=indexSelect;
                        list.selection.clear();
                        list.selection.select(indexSelect-1);
                        list.positionViewAtRow(indexSelect-1,ListView.End )
                    }
                    onReleased:{
                        imgPageDown.source= "../Images/scroll_pagedown_off.png"
                    }
                    onCanceled: {
                        imgPageDown.source= "../Images/scroll_pagedown_off.png"
                    }
                }
            }

            ToolButton {
                x: sizeWidth-68
                y: 273
                width: 68
                height: 60
                Image {
                    id: imgLineDown
                    anchors.fill: parent
                    source: "../Images/scroll_linedown_off.png"
                }
                MouseArea {
                    id: mouseArea1
                    anchors.fill: parent
                    onPressed: {
                        imgLineDown.source= "../Images/scroll_linedown_on.png"
                        if(indexSelect<list.rowCount)
                        {
                            txtSelectIndex.text=(++indexSelect).toString();
                            list.selection.clear();
                            list.selection.select(indexSelect-1);
                            list.positionViewAtRow(indexSelect-1,ListView.End);
                        }
                    }

                    onReleased:{
                        imgLineDown.source= "../Images/scroll_linedown_off.png"
                    }
                    onCanceled: {
                        imgLineDown.source= "../Images/scroll_linedown_off.png"
                    }
                }
            }

            ToolButton {
                x: sizeWidth-68
                y: 188
                width: 68
                height: 82
                Image {
                    id:imgCenterKey
                    anchors.fill: parent
                    source: "../Images/scroll_centerkey.png"
                    Text {
                        id: txtListViewCount
                        text: "40"
                        font.bold: true
                        anchors.verticalCenterOffset: 15
                        anchors.horizontalCenterOffset: 0
                        anchors.bottomMargin: -13
                        font.pixelSize:18
                        color: "#000000"
                        anchors.bottom: parent.bottom
                        anchors.centerIn: parent
                    }
                    Rectangle{
                        x: 0
                        width:30
                        height: 3
                        color:"black"
                        anchors.centerIn: parent
                    }
                    Text {
                        id: txtSelectIndex
                        text: "20"
                        font.bold: true
                        anchors.verticalCenterOffset: -17
                        anchors.horizontalCenterOffset: 0
                        anchors.bottomMargin: 15
                        font.pixelSize:18
                        color: "#000000"
                        anchors.bottom: parent.bottom
                        anchors.centerIn: parent
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        imgCenterKey.source= "../Images/scroll_centerkey_p.png"
                    }
                    onReleased:{
                        imgCenterKey.source= "../Images/scroll_centerkey.png"
                    }
                    onCanceled: {
                        imgCenterKey.source= "../Images/scroll_centerkey.png"
                    }
                }
            }
        }
        function pressBtnOK(){
            if(list.model.get(list.currentRow)!== -1){
                value = list.model.get(list.currentRow).title
                gridview.send()
            }
        }
        function getCurrentIndex()
        {
            return list.currentRow+1
        }

        Rectangle{
            x: 2
            y: 398
            width: 313
            height: 80
            color: "#393839"
            visible: false
            ToolButton {
                id: btnOK
                x: 18
                y: 8
                width: 144
                height: 66
                Image {
                    id:imgOK
                    source: "../Images/keyboard_btn_okcancel.png"
                    anchors.fill: parent
                    Text {
                        text: strOKCancel
                        font.pixelSize:24
                        color: "white"
                        anchors.centerIn: parent
                        anchors.horizontalCenter: Text.horizontalCenter
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: {
                            imgOK.source = "../Images/keyboard_btn_touched_okcancel.png"
                        }
                        onReleased:{
                            imgOK.source = "../Images/keyboard_btn_okcancel.png";
                            if(list.model.get(list.currentRow)!== -1){
                                value = list.model.get(list.currentRow).title
                                gridview.send()
                                settingDialog.visible = false;
                            }
                        }
                        onCanceled:
                        {
                            imgOK.source = "../Images/keyboard_btn_okcancel.png";
                        }
                    }
                }
            }
            ToolButton {
                x: 459
                y: 8
                id: btnCancle
                width: 144
                height: 66
                visible: false
                Image {
                    id:imgCancel
                    source: "../Images/keyboard_btn_okcancel.png"
                    anchors.fill: parent
                    Text {
                        text: "Cancle"
                        font.pixelSize:24
                        color: "white"
                        anchors.bottom: parent.bottom
                        anchors.centerIn: parent
                        anchors.horizontalCenter: Text.horizontalCenter
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: {
                            imgCancel.source = "../Images/keyboard_btn_touched_okcancel.png"
                        }
                        onReleased:{
                            imgCancel.source = "../Images/keyboard_btn_okcancel.png"
                            settingDialog.visible= false;
                        }
                        onCanceled: {
                            imgCancel.source = "../Images/keyboard_btn_okcancel.png"
                        }
                    }
                }
            }
        }
        function getIndexByValue(resource,value){
            for (var i = 0; i< resource.count();i++){
                if(resource.get(i).title === value){
                    return i;
                }
            }
        }
    }



