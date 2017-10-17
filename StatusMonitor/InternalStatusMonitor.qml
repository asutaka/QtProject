import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.2
import "../StatusMonitor"
import "../Control/VirtualKey.js" as Ops
import "../Dialog"
import CommonControl 1.0
import ControlApp 1.0


Item{
    id: item1
    property alias objInternalStatusMonitorVM: internalStatusMonitorVM
    property int indexSelect:1;
    property int linePage:10;
    property int temp;
    property CateListDialog objSettingComparison: comparisonSelect
    property CateListDialog objClearBacckup: clearBackup
    InternalStatusMonitorVM {
        id:internalStatusMonitorVM
    }

    Rectangle {
        id: rectcontentMenuList
        x: 0
        y: 0
        width: 1024
        height: 640
        color: "#eff3e7"
        anchors.top: parent.top
        anchors.left: parent.left

        Rectangle{
            x: 0
            y: 0
            width: 228
            height: 640
            Image{
                anchors.fill: parent
                source: "qrc:/Images/menulist_image_MultiLane.png"

                Text {
                    id: comparison
                    x: 10
                    y: 70
                    text: qsTr("比較対象")
                    font.pixelSize: 22
                }

                Rectangle {
                    id: textField
                    x: 10
                    y: 95
                    width: 200
                    height: 40
                    color: "#ffffff"
                    radius: 3
                    border.color: "#000000"
                    border.width: 2
                    anchors.topMargin: 6
                    anchors.top: comparison.bottom

                    Text{
                        id: selectedComparison
                        y: 9
                        text:"工場出荷時"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenterOffset: 0
                        font.pixelSize: 17
                        anchors.left: parent.left
                        anchors.leftMargin: 8
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    MouseArea {
                        id: mouseArea1
                        anchors.fill: parent
                        onReleased: {
                            showDialogComparisonSelect();
                        }
                    }
                }

                TK_Button {
                    id: buttonJump
                    x: 10
                    y: 159
                    width: 200
                    height: 40
                    mText: qsTr("次の値変更/範囲外を選択する")
                    mFont.pixelSize: 15
                    mBackgroundImage: "qrc:/Images/btn_180_40.png"
                    mForeColor: "white"
//                    mTextAlignH: Text.AlignHCenter
//                    mTextAlignV: Text.AlignVCenter
                    mTextAlign: 4
                    MouseArea {
                        id: mouseArea2
                        anchors.fill: parent
                        onPressed: buttonJump.mBackgroundImage = "qrc:/Images/btn_touched_180_40.png"
                        onReleased: {
                            searchRedRow();
                            buttonJump.mBackgroundImage = "qrc:/Images/btn_180_40.png"
                        }
                        onCanceled: buttonJump.mBackgroundImage = "qrc:/Images/btn_180_40.png"
                    }
                }
            }
        }

        Label{
            id:lblValNumber
            visible: false
            text:"0"
            onTextChanged: libraryModel.set(indexSelect-1, {"author": lblValNumber.text})
        }

        ListModel {
            id: libraryModel
            ListElement {
                stt:" A トップ"
                title: ""
                author: ""
                type: ""
                range: ""
            }
            ListElement {
                stt:"1"
                title: "形名"
                author: "KW6401AF01"
                type: "KW6401AF01"
                range: ""
            }
            ListElement {
                stt:"2"
                title: "シリアルNo."
                author: "12345678"
                type: "12345678"
                range: ""
            }
            ListElement {
                stt:"3"
                title: "秤ﾊﾞｰｼﾞｮﾝ(FB)"
                author: "V1.00.0000(ABCD)"
                type: "V1.05.0000(ABCD)"
                range: ""
            }
            ListElement {
                stt:"4"
                title: "CW-TCP/BCD UNIT-L1"
                author: "V1.00.0000"
                type: "V1.00.0000"
                range: "1～2"
            }
            ListElement {
                stt:" B 電源電圧"
                title: ""
                author: ""
                type: ""
                range: ""
            }
            ListElement {
                stt:"5"
                title: "電源電圧+24V"
                author: "22.0V"
                type: "27.0V"
                range: "21.6～26.4V"
            }
            ListElement {
                stt:"6"
                title: "動作確認入力(RJ4)"
                author: "ON"
                type: "ON"
                range: ""
            }
            ListElement {
                stt:"7"
                title: "選別確認PHOTO(RJ4)"
                author: "OFF"
                type: "OFF"
                range: ""
            }
            ListElement {
                stt:"8"
                title: "CFカード残量"
                author: "50.0MB"
                type: "50.0MB"
                range: "0～512MB"
            }
            ListElement {
                stt:"9"
                title: "Demo9"
                author: "2"
                type: "2"
                range: "1～2"
            }
            ListElement {
                stt:"10"
                title: "Demo10"
                author: "2"
                type: "2"
                range: "1～2"
            }
            ListElement {
                stt:"11"
                title: "Demo11"
                author: "2"
                type: "2"
                range: "1～2"
            }
            ListElement {
                stt:"12"
                title: "Demo12"
                author: "2"
                type: "2"
                range: "1～2"
            }
            ListElement {
                stt:"13"
                title: "Demo13"
                author: "2"
                type: "2"
                range: "1～2"
            }
            ListElement {
                stt:"14"
                title: "Demo14"
                author: "2"
                type: "2"
                range: "1～2"
            }
            ListElement {
                stt:"15"
                title: "Demo15"
                author: "1"
                type: "2"
                range: "1～2"
            }
        }

        TableView {
            id: list
            x: 228
            y: 0
            width: 682
            height: 640
            anchors.rightMargin: 0
            highlightOnFocus: true
            anchors.topMargin: 0
            anchors.leftMargin: 0
            model: libraryModel
            verticalScrollBarPolicy :Qt.ScrollBarAlwaysOn
            horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff
            z: 1

            TableViewColumn {
                id: col1
                movable : false
                role: "stt"
                title: "No."
                width: 50
                delegate: Component {
                    Text {
                        text: styleData.value
                        horizontalAlignment: if((isNaN(styleData.value)) && (styleData.column == 0)){
                                                 Text.AlignLeft
                                             }else{
                                                 Text.AlignHCenter
                                             }
                        verticalAlignment: Text.AlignVCenter
                        font.family: "MS Gothic"
                        font.pixelSize: 17
                    }
                }
            }
            TableViewColumn {
                id: col2
                movable : false
                role: "title"
                title: "パラメータ"
                width: 180
                delegate: Component {
                    Text {
                        text: styleData.value
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.family: "MS Gothic"
                        font.pixelSize: 17
                    }
                }
            }

            TableViewColumn {
                id: col3
                movable : false
                role: "author"
                title: "現在値"
                width: 160
                delegate: Component {
                    Text {
                        text: styleData.value
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        font.family: "MS Gothic"
                        font.pixelSize: 17

                    }
                }
            }
            TableViewColumn {
                id: col4
                movable : false
                role: "type"
                title: "工場出荷時"
                width: 160
                delegate: Component {
                    Text {
                        text: styleData.value
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        font.family: "MS Gothic"
                        font.pixelSize: 17

                    }
                }
            }
            TableViewColumn {
                id: col5
                movable : false
                role: "range"
                title: "範囲"
                width:(list.width - col1.width -　col2.width　-　col3.width　-　col4.width - 15)
                delegate: Component {
                    Text {
                        text: styleData.value
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "MS Gothic"
                        font.pixelSize: 17
                    }
                }
            }

            style: TableViewStyle {
                headerDelegate: Rectangle {
                    id: headerDelegateView
                    height: textItem.implicitHeight *2
                    Image{
                        anchors.fill : parent
                        source: "qrc:/Images/TabMenu.png"
                    }
                    color: "lightsteelblue"
                    Text {
                        id: textItem
                        text: styleData.value
                        font.family: "MS Gothic"
                        font.pixelSize: 17
                        horizontalAlignment: Text.AlignVCenter
                        verticalAlignment: Text.AlignBottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    Rectangle {
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 1
                        anchors.topMargin: 1
                        width: 1
                        color: "#ccc"
                    }
                }
                itemDelegate:
                    Text {
                    id: iContent
                    color: styleData.pressed ? "black" : "black"
                    text: styleData.value
                    font.family: "MS Gothic"
                    font.pixelSize: 17
                    verticalAlignment: Text.AlignVCenter
                }
                rowDelegate: Rectangle {
                    id: curItem
                    width: list.width
                    height: (list.height- 55)/linePage
                    border.color: "#9cb65a"
                    border.width:1
                    color: if((styleData.row == 0) || (styleData.row == 5)){
                               "dodgerblue"
                           }else if(styleData.selected){
                               "#f79642"
                           }else if((libraryModel.get(styleData.row).type) != (libraryModel.get(styleData.row).author)){
                               "red"
                           }else{
                               "#eff3e7"
                           }
                }
                frame: Rectangle {
                    border{
                        color: "#c6c3c6"
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
            onClicked: {
                indexSelect=list.currentRow+1;
                txtSelectIndex.text=indexSelect.toString();
                switch(libraryModel.get(indexSelect-1).type)
                {
                case 1:break;
                case 2:
                    Ops.showCalculator(lblValNumber,"0","1000");
                }
            }

            Keys.onPressed:
            {
                if(event.key==Qt.Key_Down)
                {
                    if(indexSelect<list.rowCount){
                        txtSelectIndex.text=(++indexSelect).toString();
                    }
                }
                else if(event.key==Qt.Key_Up)
                {
                    if(indexSelect>1){
                        txtSelectIndex.text=(--indexSelect).toString();
                    }
                }

            }
            Component.onCompleted: {
                txtSelectIndex.text=1;
                txtListViewCount.text = list.rowCount.toString()
                list.selection.select(indexSelect-1);
            }
        }

        ToolButton {
            id: btnPageUp
            x: 926
            y: 32
            width: 90
            height: 90

            Image {
                id: imgPageUp
                anchors.fill: parent
                source: "qrc:/Images/scroll_pageup_off.png"
            }
            MouseArea {
                anchors.fill: parent
                onPressed: imgPageUp.source= "qrc:/Images/scroll_pageup_on.png"
                onReleased: {
                    temp =((Math.floor(indexSelect/linePage))-1)*linePage ;
                    if(temp < 1){
                        indexSelect = 1;
                    }
                    else{ indexSelect = temp;}
                    txtSelectIndex.text=indexSelect;
                    list.selection.clear();
                    list.selection.select(indexSelect-1);
                    list.positionViewAtRow(indexSelect-1,ListView.Beginning);
                    imgPageUp.source= "qrc:/Images/scroll_pageup_off.png"
                }
                onCanceled: imgPageUp.source= "qrc:/Images/scroll_pageup_off.png"
            }

        }

        ToolButton {
            id: btnLineUp
            x: 926
            y: 128
            width: 90
            height: 90
            Image {
                id: imgLineUp
                anchors.fill: parent
                source: "qrc:/Images/scroll_lineup_off.png"
            }
            MouseArea {
                anchors.fill: parent
                onPressed: imgLineUp.source= "qrc:/Images/scroll_lineup_on.png"
                onReleased: {
                    if(indexSelect>1)
                    {
                        txtSelectIndex.text=(--indexSelect).toString();
                        list.selection.clear();
                        list.selection.select(indexSelect-1);
                        list.positionViewAtRow(indexSelect-1,ListView.Beginning);
                    }
                    imgLineUp.source= "qrc:/Images/scroll_lineup_off.png"
                }
                onCanceled: imgLineUp.source= "qrc:/Images/scroll_lineup_off.png"
            }
        }

        ToolButton {
            id: btnPageDown
            x: 924
            y: 533
            width: 90
            height: 90

            Image {
                id: imgPageDown
                anchors.fill: parent
                source: "qrc:/Images/scroll_pagedown_off.png"
            }
            MouseArea {
                anchors.fill: parent
                onPressed: imgPageDown.source= "qrc:/Images/scroll_pagedown_on.png"
                onReleased: {
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
                    imgPageDown.source= "qrc:/Images/scroll_pagedown_off.png"
                }
                onCanceled: imgPageDown.source= "qrc:/Images/scroll_pagedown_off.png"
            }
        }

        ToolButton {
            id: btnLineDown
            x: 924
            y: 436
            width: 90
            height: 90
            Image {
                id: imgLineDown
                anchors.fill: parent
                source: "qrc:/Images/scroll_linedown_off.png"
            }
            MouseArea {
                anchors.fill: parent
                onPressed: imgLineDown.source= "qrc:/Images/scroll_linedown_on.png"
                onReleased:{
                    if(indexSelect<list.rowCount)
                    {
                        txtSelectIndex.text=(++indexSelect).toString();
                        list.selection.clear();
                        list.selection.select(indexSelect-1);
                        list.positionViewAtRow(indexSelect-1,ListView.End);
                    }
                    imgLineDown.source= "qrc:/Images/scroll_linedown_off.png"
                }
                onCanceled: imgLineDown.source= "qrc:/Images/scroll_linedown_off.png"
            }
        }

        ToolButton {
            id: btnCenterKey
            x: 926
            y: 260
            width: 90
            height: 135

            Image {
                id:imgCenterKey
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                anchors.fill: parent
                source: "qrc:/Images/scroll_centerkey.png"
                Text {
                    id: txtListViewCount
                    text: "40"
                    anchors.verticalCenterOffset: 24
                    anchors.horizontalCenterOffset: 0
                    anchors.bottomMargin: -24
                    font.family: "MS Gothic"
                    font.pixelSize: 27
                    color: "#000000"
                    anchors.bottom: parent.bottom
                    anchors.centerIn: parent
                }
                Rectangle{
                    width:56
                    height: 3
                    color:"black"
                    anchors.centerIn: parent
                }
                Text {
                    id: txtSelectIndex
                    text: "20"
                    anchors.verticalCenterOffset: -21
                    anchors.horizontalCenterOffset: 0
                    anchors.bottomMargin: 21
                    font.family: "MS Gothic"
                    font.pixelSize: 27
                    color: "#000000"
                    anchors.bottom: parent.bottom
                    anchors.centerIn: parent
                }
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    imgCenterKey.source= "qrc:/Images/scroll_centerkey_p.png"
                }
                onReleased:{
                    imgCenterKey.source= "qrc:/Images/scroll_centerkey.png"
                }
                onCanceled: imgCenterKey.source= "qrc:/Images/scroll_centerkey.png"
            }
        }
    }

    Component.onCompleted: {
        objInternalStatusMonitorVM.onLoad();
    }
    function showDialogComparisonSelect(){
        comparisonSelect.source = listcomparison;
        comparisonSelect.visible = true;
    }

    function showDialogClearBackup(){
        clearBackup.source = listcomparison;
        clearBackup.visible = true;
    }

    function searchRedRow(){
        var tempCurrentRow = list.currentRow;
        for(var i=tempCurrentRow+1;i<libraryModel.count;i++){
            if(libraryModel.get(i).author != libraryModel.get(i).type){
                list.currentRow = i;
                list.selection.clear();
                list.selection.select(list.currentRow);
                txtSelectIndex.text=list.currentRow + 1;
                break;
            }
        }
        if (list.currentRow == tempCurrentRow){
            for(var j=0;j<tempCurrentRow;j++){
                if(libraryModel.get(j).author != libraryModel.get(j).type){
                    list.currentRow = j;
                    list.selection.clear();
                    list.selection.select(list.currentRow);
                    txtSelectIndex.text=list.currentRow + 1;
                    break;
                }
            }
        }
    }

    CateListDialog{
        id: comparisonSelect
        x: 397
        y: 100
        title: "比較対象"
        visible: false
        source: listcomparison
        indexSelect: 0
        onSend: {
            selectedComparison.text = value;
            col4.title = value;
        }
    }

    CateListDialog{
        id: clearBackup
        x: 397
        y: 100
        title: "保存と削除"
        visible: false
        source: listcomparison
        indexSelect: 0
    }

    ListModel {
        id: listcomparison
        ListElement {
            title: "工場出荷時"
        }
        ListElement {
            title: "設置時"
        }
        ListElement {
            title: "任意1"
        }
        ListElement {
            title: "任意2"
        }
        ListElement {
            title: "任意3"
        }
    }
}

