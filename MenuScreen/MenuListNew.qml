import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.2
import "qrc:/Control/VirtualKey.js" as Ops
import "qrc:/Control/switchControl"
import "qrc:/Control/switchLineUC"

Item{
    property int indexSelect:1;
    property int linePage:10;
    property int temp;
    property  bool isForLine
    property  int  _currentLineNo: 1

    Label{
        id:lblValNumber
        visible: false
        text:"0"
        onTextChanged: libraryModel.set(indexSelect-1, {"author": lblValNumber.text})
    }
    Rectangle{
        width: 1024
        height: 640
        color: "#EEEEE0"
        opacity: 0.9

        Rectangle{
            id: _menubarLayer
            x: 0
            y:0
            width: 1024
            height: 40
            color: "#EEEEE0"

            Rectangle{
                id: btnAddress1
                x: 0
                y: 0
                width: 189
                height: parent.height
                radius: 10
                color: "#66CDAA"
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectSelect.x=parent.x
                        rectSelect.visible=true
                    }
                    onExited: {
                        rectSelect.visible=false

                    }

                    onClicked: {
                        loaderContent.source ="qrc:/MenuList/Menu.qml"
                    }

                }
                Text {
                    id: _txtbtnAddress1
                    text: qsTr("Menu")
                    font.family: "MS Gothic"
                    font.pixelSize: 20
                    anchors.centerIn: parent
                    font.bold: true

                }

            }
            Rectangle{
                id: btnAddress2
                x: 190
                y: 0
                width: 189
                height: 40
                radius: 10
                color: "#66CDAA"
                visible: true

                Text {
                    id: _txtbtnAddress2
                    text: qsTr("History")
                    font.family: "MS Gothic"
                    font.pixelSize: 20
                    anchors.centerIn: parent
                    font.bold: true

                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                }
            }
            Rectangle{
                id: btnAddress3
                x: 380
                y: 0
                width: 189
                height: 40
                radius: 10
                color: "#66CDAA"
                visible: false

                Text {
                    id: _txtbtnAddress3
                    text: qsTr("Address3")
                    font.family: "MS Gothic"
                    font.pixelSize: 20
                    anchors.centerIn: parent
                    font.bold: true

                }
            }
            Rectangle{
                id: btnAddress4
                x: 380
                y: 0
                width: 189
                height: 40
                radius: 10
                color: "#66CDAA"
                visible: false

                Text {
                    id: _txtbtnAddress4
                    text: qsTr("Address4")
                    font.family: "MS Gothic"
                    font.pixelSize: 20
                    anchors.centerIn: parent
                    font.bold: true

                }
            }
            Rectangle
            {
                id:rectSelect
                width: 189
                height: parent.height
                radius: 10
                color:"black"
                visible: false
                opacity:0.1
            }
        }

        Rectangle{
            x: 0
            y: 40
            width: 228
            height: 588
            Image{
                anchors.fill: parent
                source: "qrc:/Images/menulist_image_MultiLane.png"
            }
            StartSwitchControl{
                id: switchControl
                x: 0
                y: 81
                width: 228
                height: 37
                isLeft:!isForLine
                onSwitchControl: {
                    switchLine.visible =!switchControl.isLeft

                }

            }

            SwitchLineUc{
                id:switchLine
                x: 31
                y: 205
                width: 166
                height: 74
                visible: !switchControl.isLeft

            }
        }

        Rectangle {
            id: rectcontentMenuList
            x: 228
            y: 40
            width: 706
            height: 588
            color: "#FDF5E6"
            radius: 20
            ListModel {
                id: libraryModel
                ListElement {
                    stt:1
                    title: "Demo1"
                    author: "Yes"
                    ColorAnimation: "#CCFFFF"
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
                width: 706
                height: 590
                anchors.rightMargin: 0
                highlightOnFocus: true
                anchors.topMargin: 0
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.left: parent.left
                model: libraryModel
                verticalScrollBarPolicy :Qt.ScrollBarAlwaysOn
                horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff
                z: 0
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
                            font.family: "MS Gothic"
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
                            font.family: "MS Gothic"
                            font.pixelSize: 27

                        }
                    }
                    width:(list.width - col1.width -col2.width - 15)
                }
                TableViewColumn
                {
                    id: col4
                    movable : false
                    role: "type"
                    title: "Type"
                    visible: false
                }

                style: TableViewStyle {
                    headerDelegate: Rectangle {
                        id: headerDelegateView
                        height: textItem.implicitHeight *2
                        width: textItem.implicitWidth
                        Image{
                            anchors.fill : parent
                            source: "qrc:/Images/TabMenu.png"
                        }
                        color: "lightsteelblue"
                        Text {
                            id: textItem
                            text: styleData.value
                            font.family: "MS Gothic"
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
                    itemDelegate:
                        Text {
                        id: iContent
                        color: styleData.pressed ? "black" : "black"
                        text: styleData.value
                        font.family: "MS Gothic"
                        font.pixelSize: 27
                        verticalAlignment: Text.AlignVCenter
                    }
                    rowDelegate: Rectangle {
                        id: curItem
                        width: list.width
                        height: (list.height- 55)/linePage
                        radius: 10
                        border.color: "#6495ED"
                        border.width:1
                        color: styleData.selected ? "#FFF68F" :"#FDF5E6"
                    }
                    frame: Rectangle {
                        border{
                            color: "#FFF68F"
                        }
                    }
                    handle: Rectangle {
                        implicitWidth: 14
                        implicitHeight: 0

                        Rectangle {
                            color: "#CFCFCF"
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
        Rectangle{
            id: _buttonNavigator
            x: 934
            y: 40
            width: 86
            height: 588
            opacity: 0.9
            color: "#B9D3EE"

            ToolButton {
                id: toolButton1
                x: 9
                y: 83
                width: 68
                height: 68

                Image {
                    id: imgPageUp
                    anchors.fill: parent
                    source: "qrc:/Images/skip_forward.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        imgPageUp.source= "qrc:/Images/skip_forward_on.png"
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
                        imgPageUp.source= "qrc:/Images/skip_forward.png"
                    }
                }
            }
            ToolButton {
                id: toolButton2
                x: 9
                y: 156
                width: 68
                height: 68
                property bool isPressAndHoldUp: false
                Image {
                    id: imgLineUp
                    anchors.fill: parent
                    source: "qrc:/Images/next_step.png"
                }
                MouseArea {
                    id: pressBtn2
                    anchors.fill: parent

                    onPressedChanged: {
                        if(!pressBtn2.pressed && !toolButton2.isPressAndHoldUp)
                        {
                            if(indexSelect<1)
                            {
                                indexSelect=1;
                            }
                            else if(indexSelect<=list.rowCount && indexSelect>1)
                            {
                                txtSelectIndex.text=(--indexSelect).toString();
                                list.selection.clear();
                                list.selection.select(indexSelect-1);
                                list.positionViewAtRow(indexSelect-1,ListView.Beginning);
                            }
                        }
                        imgLineUp.source= "qrc:/Images/next_step_on.png"
                        toolButton2.isPressAndHoldUp=false;
                    }
                    onExited: {
                        imgLineUp.source= "qrc:/Images/next_step.png"
                    }
                    onPressAndHold: {
                        toolButton2.isPressAndHoldUp=true;
                        while(indexSelect<=list.rowCount && indexSelect>1){
                            txtSelectIndex.text=(--indexSelect).toString();
                            list.selection.clear();
                            list.selection.select(indexSelect-1);
                            list.positionViewAtRow(indexSelect-1,ListView.Beginning);
                        }
                    }
                    onReleased:{
                        imgLineUp.source= "qrc:/Images/next_step.png"
                    }
                }
            }
            ToolButton {
                id: toolButton3
                x: 9
                y: 437
                width: 68
                height: 68

                Image {
                    id: imgPageDown
                    anchors.fill: parent
                    source: "qrc:/Images/skip_forward_down.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        imgPageDown.source= "qrc:/Images/skip_forward_down_on.png"
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
                        imgPageDown.source= "qrc:/Images/skip_forward_down.png"
                    }
                }
            }
            ToolButton {
                id: toolButton4
                x: 9
                y: 364
                width: 68
                height: 68

                property bool isPressAndHold: false

                Image {
                    id: imgLineDown
                    anchors.fill: parent
                    source: "qrc:/Images/down_step.png"
                }

                MouseArea {
                    id: pressBtn4
                    anchors.fill: parent

                    onPressedChanged: {
                        if(!pressBtn4.pressed && !toolButton4.isPressAndHold)
                        {
                            if(indexSelect<list.rowCount)
                            {
                                txtSelectIndex.text=(++indexSelect).toString();
                                list.selection.clear();
                                list.selection.select(indexSelect-1);
                                list.positionViewAtRow(indexSelect-1,ListView.End);
                            }
                        }
                        imgLineDown.source= "qrc:/Images/down_step_on.png"
                        toolButton4.isPressAndHold=false;
                    }
                    onExited: {
                        imgLineDown.source= "qrc:/Images/down_step.png"
                    }

                    onPressAndHold: {
                        toolButton4.isPressAndHold=true;
                        while(indexSelect<list.rowCount){
                            txtSelectIndex.text=(++indexSelect).toString();
                            list.selection.clear();
                            list.selection.select(indexSelect-1);
                            list.positionViewAtRow(indexSelect-1,ListView.End);
                        }
                    }
                    onReleased:{
                        imgLineDown.source= "qrc:/Images/down_step.png"

                    }
                }
            }

            ToolButton {
                id: toolButton5
                x: 9
                y: 254
                width: 68
                height: 81
                property string strVal: ""

                Image {
                    id:imgCenterKey
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                    anchors.fill: parent
                    source: "qrc:/Images/scroll_centerButton_off.png"
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
                        onTextChanged:
                        {
                            indexSelect=parseInt(txtSelectIndex.text)

                            if(indexSelect<list.rowCount)
                            {
                                txtSelectIndex.text=indexSelect
                                list.selection.clear();
                                list.selection.select(indexSelect-1);
                                list.positionViewAtRow(indexSelect-1,ListView.End);
                            }
                        }

                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        imgCenterKey.source= "qrc:/Images/scroll_centerButton_on.png"
                        Ops.showCalculator(txtSelectIndex,"0",list.rowCount.toString());

                    }
                    onReleased:{
                        imgCenterKey.source= "qrc:/Images/scroll_centerButton_off.png"
                    }
                }
            }
        }
    }


}

