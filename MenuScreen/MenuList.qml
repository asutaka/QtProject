import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.2
import "../Control/VirtualKey.js" as Ops
import ControlApp 1.0
Item{
    property int indexSelect:1;
    property int startPage: 1;
    property int endPage: 10;
    property int linePage:10;
    property int temp;
    property alias objMenuListV1VM: menuListV1VM

    MenuListVM {
        id:menuListV1VM
    }

    Component.onCompleted: {
        menuListV1VM.onLoad();
    }


    Label{
        id:lblValNumber
        visible: false
        text:"0"
        onTextChanged: libraryModel.set(indexSelect-1, {"author": lblValNumber.text})
    }


    Rectangle {
        id: rectcontentMenuList
        width: 1024
        height: 640
        color: "#eff3e7"

        ListModel {
            id: libraryModel
            ListElement {
                stt:1
                title: "Demo1"
                author: "Yes"
                type: 1
            }
            ListElement {
                stt:2
                title: "Demo2"
                author: "Yes"
                type: 1
            }
            ListElement {
                stt:3
                title: "Demo3"
                author: "Yes"
                type: 1
            }
            ListElement {
                stt:4
                title: "Demo4"
                author: "Yes"
                type: 1
            }
            ListElement {
                stt:5
                title: "Demo5"
                author: "Yes"
                type: 1
            }
            ListElement {
                stt:6
                title: "Demo6"
                author: "Yes"
                type: 1
            }
            ListElement {
                stt:7
                title: "Demo7"
                author: "Yes"
                type: 1
            }
            ListElement {
                stt:8
                title: "Demo8"
                author: "12"
                type: 2
            }
            ListElement {
                stt:9
                title: "Demo9"
                author: "Yes"
                type: 1
            }
            ListElement {
                stt:10
                title: "Demo10"
                author: "20"
                type: 2
            }
            ListElement {
                stt:11
                title: "Demo11"
                author: "Yes"
                type: 1
            }
            ListElement {
                stt:12
                title: "Demo12"
                author: "No"
                type: 1
            }
            ListElement {
                stt:13
                title: "Demo13"
                author: "No"
                type: 1
            }
            ListElement {
                stt:14
                title: "Demo14"
                author: "Yes"
                type: 1
            }
            ListElement {
                stt:15
                title: "Demo15"
                author: "No"
                type: 1
            }
            ListElement {
                stt:16
                title: "Demo16"
                author: "No"
                type: 1
            }
            ListElement {
                stt:17
                title: "Demo17"
                author: "Yes"
                type: 1
            }
            ListElement {
                stt:18
                title: "Demo18"
                author: "No"
                type: 1
            }
            ListElement {
                stt:19
                title: "Demo19"
                author: "No"
                type: 1
            }
            ListElement {
                stt:20
                title: "Demo20"
                author: "Yes"
                type: 1
            }
            ListElement {
                stt:21
                title: "Demo21"
                author: "No"
                type: 1
            }
            ListElement {
                stt:22
                title: "Demo22"
                author: "No"
                type: 1
            }
            ListElement {
                stt:23
                title: "Demo23"
                author: "Yes"
                type: 1
            }
            ListElement {
                stt:24
                title: "Demo24"
                author: "No"
                type: 1
            }
            ListElement {
                stt:25
                title: "Demo25"
                author: "No"
                type: 1
            }
            ListElement {
                stt:26
                title: "Demo26"
                author: "Yes"
                type: 1
            }
            ListElement {
                stt:27
                title: "Demo27"
                author: "No"
                type: 1
            }
        }

        TableView {
            id: list
            x: 0
            y: 0
            width: 910
            height: 590
            anchors.rightMargin: 102
            highlightOnFocus: true
            anchors.topMargin: 34
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.left: parent.left
            model: libraryModel
            verticalScrollBarPolicy :Qt.ScrollBarAlwaysOn
            horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff
            z: 1


            //this Mousearea to prevent tableView scroll
            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.MidButton
                onWheel: {}
            }
            TableViewColumn {
                id:col1
                movable : false
                role: "stt"
                title: "No."
                width: 100
                delegate: Component {
                    Text {
                        text: styleData.value
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Noto Sans CJK JP DemiLight"
                        font.pixelSize: 27
                    }
                }
            }
            TableViewColumn {
                id:col2
                movable : false
                role: "title"
                title: "Title"
                width: 400
            }
            TableViewColumn {
                id:col3
                movable : false
                role: "author"
                title: "Author"
                delegate: Component {
                    Text {
                        text: styleData.value
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Noto Sans CJK JP DemiLight"
                        font.pixelSize: 27

                    }
                }
                width:(list.width - col1.width -col2.width - 15)
            }
            TableViewColumn {
                id: col4
                movable : false
                role: "type"
                title: "Type"
                visible: false
            }

            style: TableViewStyle {
                scrollBarBackground: Rectangle{
                    implicitHeight: 16
                    implicitWidth: 14
                }
                headerDelegate: Rectangle {
                    id: headerDelegateView
                    height: textItem.implicitHeight * 1.3
                    width: textItem.implicitWidth
                    Image{
                        anchors.fill : parent
                        source: "qrc:/Images/TabMenu.png"
                    }
                    color: "lightsteelblue"
                    Text {
                        id: textItem
                        text: styleData.value
                        font.family: "Noto Sans CJK JP DemiLight"
                        font.pixelSize: 27
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
                itemDelegate:Text {
                    id: iContent
                    color: styleData.pressed ? "black" : "black"
                    text: styleData.value
                    font.family: "Noto Sans CJK JP DemiLight"
                    font.pixelSize: 27
                    verticalAlignment: Text.AlignVCenter
                }
                rowDelegate: Rectangle {
                    id: curItem
                    width: list.width
                    height: (list.height- 55)/linePage
                    border.color: "#9cb65a"
                    border.width:1
                    color: styleData.selected ? "#f79642" :"#eff3e7"
                }
                frame: Rectangle {
                    border{
                        color: "#c6c3c6"
                    }
                }
                transientScrollBars: true
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
                if(event.key===Qt.Key_Down)
                {
                    if(indexSelect == endPage) {
                        if(indexSelect < list.rowCount) {
                            startPage++;
                            endPage++;
                        }
                    }

                    if(indexSelect<list.rowCount){
                        txtSelectIndex.text=(++indexSelect).toString();
                    }
                }
                else if(event.key===Qt.Key_Up)
                {
                    if(indexSelect == startPage) {
                        if(indexSelect > 1) {
                            startPage--;
                            endPage--;
                        }
                    }

                    if(indexSelect>1){
                        txtSelectIndex.text=(--indexSelect).toString();
                    }
                }
                event.accepted = true;

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
                onClicked: {

                }
                onPressed: {
                    imgPageUp.source= "qrc:/Images/scroll_pageup_on.png"

                    if(indexSelect > startPage) {
                        indexSelect = startPage;
                    }else if(indexSelect == startPage) {
                        if(startPage -  10 < 1) {
                            startPage = 1;
                            endPage = startPage + linePage - 1;
                        }
                        else {
                            endPage -= 10;
                            startPage -= 10;
                        }
                        indexSelect = startPage;
                    }
                    txtSelectIndex.text=indexSelect;
                    list.selection.clear();
                    list.selection.select(indexSelect-1);
                    list.positionViewAtRow(indexSelect-1,ListView.Beginning);
                }

                onReleased: imgPageUp.source= "qrc:/Images/scroll_pageup_off.png"
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
                onClicked: {

                }
                onPressed: {
                    if(indexSelect < 1) {
                        indexSelect = 1;
                        startPage = 1;
                        endPage = 10;
                    }else if(indexSelect <= list.rowCount && indexSelect > 1){
                        if(indexSelect == startPage) {
                            startPage--;
                            endPage--;
                        }

                        txtSelectIndex.text=(--indexSelect).toString();
                        list.selection.clear();
                        list.selection.select(indexSelect-1);
                        list.positionViewAtRow(indexSelect-1,ListView.Contain);
                    }
                    imgLineUp.source= "qrc:/Images/scroll_lineup_on.png"

                }
                onReleased: imgLineUp.source= "qrc:/Images/scroll_lineup_off.png"
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
                onClicked: {

                }
                onPressed: {
                    if(indexSelect < endPage) {
                        indexSelect = endPage;
                    }else if(indexSelect == endPage) {
                        if(endPage + 10 > list.rowCount) {
                            endPage = list.rowCount;
                            startPage = endPage - linePage + 1;
                        }
                        else {
                            endPage += 10;
                            startPage += 10;
                        }
                        indexSelect = endPage;
                    }

                    txtSelectIndex.text=indexSelect;
                    list.selection.clear();
                    list.selection.select(indexSelect-1);
                    list.positionViewAtRow(indexSelect-1,ListView.End );
                    imgPageDown.source= "qrc:/Images/scroll_pagedown_on.png"

                }
                onReleased: imgPageDown.source= "qrc:/Images/scroll_pagedown_off.png"
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
                onClicked: {
                }
                onPressed: {
                    if(indexSelect<list.rowCount)
                    {
                        if(endPage == indexSelect) {
                            startPage++;
                            endPage++
                        }
                        txtSelectIndex.text=(++indexSelect).toString();
                        list.selection.clear();
                        list.selection.select(indexSelect-1);
                        list.positionViewAtRow(indexSelect-1,ListView.Contain);
                    }
                    imgLineDown.source= "qrc:/Images/scroll_linedown_on.png"
                }
                onReleased: imgLineDown.source= "qrc:/Images/scroll_linedown_off.png"
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
                    font.family: "Noto Sans CJK JP DemiLight"
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
                    font.family: "Noto Sans CJK JP DemiLight"
                    font.pixelSize: 27
                    color: "#000000"
                    anchors.bottom: parent.bottom
                    anchors.centerIn: parent

                    onTextChanged:
                    {
                        indexSelect=parseInt(txtSelectIndex.text)
                        if(indexSelect == startPage) {
                            txtSelectIndex.text=indexSelect
                            list.selection.clear();
                            list.selection.select(indexSelect-1);
                            list.positionViewAtRow(indexSelect-1,ListView.Beginning);
                        }

                        else if(indexSelect == endPage) {
                            txtSelectIndex.text=indexSelect
                            list.selection.clear();
                            list.selection.select(indexSelect-1);
                            list.positionViewAtRow(indexSelect-1,ListView.End);
                        }

                        else if(indexSelect<=list.rowCount)
                        {
                            txtSelectIndex.text=indexSelect
                            list.selection.clear();
                            list.selection.select(indexSelect-1);
                            list.positionViewAtRow(indexSelect-1,ListView.Contain);
                        }
                    }
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

}

