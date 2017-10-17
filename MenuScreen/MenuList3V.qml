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
import ControlApp 1.0

Item{
    property int indexSelect:1;
    property int startPage: 1;
    property int endPage: 10;
    property int linePage:10;
    property int temp;
    property  bool isForLine
    property  int  _currentLineNo: 1
    property alias objMenuListV3VM: menuListV3VM

    MenuListVM {
        id:menuListV3VM
    }
    Label{
        id:lblValNumber
        visible: false
        text:"0"
        onTextChanged: libraryModel.set(indexSelect-1, {"author": lblValNumber.text})
    }

    Rectangle{
        width: 1024
        height: 640
        color: "#788287"
        opacity: 0.9

        Rectangle{
            id: _menubarLayer
            x: 0
            y:0
            width: 1024
            height: 40
            color: "#788287"
            Rectangle{
                id: btnAddress1
                x: 0
                y: 0
                width: 189
                height: parent.height
                radius: 5
                color: "#29313c"
                border.color: "#E8E8E8"
                border.width: 1
                opacity: 0.9
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
                        mainModel.InnerChangeScreen(ScreenMng.MenuV1)
                    }
                }
                Text {
                    id: _txtbtnAddress1
                    text: qsTr("Menu")
                    font.family: "Noto Sans CJK JP DemiLight"
                    font.pixelSize: 20
                    color: "white"
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
                radius: 5
                color: "#29313c"
                border.color: "#E8E8E8"
                border.width: 1
                opacity: 0.9
                visible: true

                Text {
                    id: _txtbtnAddress2
                    text: qsTr("History")
                    font.family: "Noto Sans CJK JP DemiLight"
                    font.pixelSize: 20
                    color: "white"
                    anchors.centerIn: parent
                    font.bold: true

                }
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
                }
            }
            Rectangle{
                id: btnAddress3
                x: 380
                y: 0
                width: 189
                height: 40
                radius: 5
                color: "#29313c"
                border.color: "#E8E8E8"
                border.width: 1
                opacity: 0.9
                visible: false

                Text {
                    id: _txtbtnAddress3
                    text: qsTr("Address3")
                    font.family: "Noto Sans CJK JP DemiLight"
                    font.pixelSize: 20
                    color:"white"
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
                radius: 5
                color: "#29313c"
                border.color: "#E8E8E8"
                border.width: 1
                opacity: 0.9
                visible: false

                Text {
                    id: _txtbtnAddress4
                    text: qsTr("Address4")
                    font.family: "Noto Sans CJK JP DemiLight"
                    font.pixelSize: 20
                    color:"white"
                    anchors.centerIn: parent
                    font.bold: true

                }
            }
            Rectangle{
                id:rectSelect
                width: 189
                height: parent.height
                radius: 10
                color:"white"
                visible: false
                opacity:0.4
            }
        }

        Rectangle {
            id: rectcontentMenuList
            x: 0
            y: 40
            width: 706
            height: 588
            color: "transparent"
            border.color: "#5a6469"
            border.width: 1
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


                //this Mousearea to prevent tableView scroll
                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.MidButton
                    onWheel: { }
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
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
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
                    scrollBarBackground: Rectangle{
                        implicitHeight: 16
                        implicitWidth: 14
                    }
                    headerDelegate: Rectangle {
                        id: headerDelegateView
                        height: textItem.implicitHeight * 1.3
                        width: textItem.implicitWidth
                        color: "#80858b"
                        border.color: "#4A708B"
                        border.width: 1
                        Image{
                            anchors.fill : parent
                            source: "qrc:/Images/TabMenu.png"
                        }
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
                    itemDelegate:
                        Text {
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
                        border.color: "#104E8B"
                        border.width:1
                        color: styleData.selected ? "#FFF68F" :"#7A8B8B"
                        opacity: 0.5
                    }
                    frame: Rectangle {
                        radius: 5
                        border{
                            color: "#38414a"
                        }
                    }
                    transientScrollBars: true

                    handle: Rectangle {
                        implicitWidth: 14
                        implicitHeight: 0
                        color: "transparent"

                        Rectangle {
                            color: "#FFE4B5"
                            anchors.fill: parent
                            border.color: "#104E8B"
                            border.width: 1
                            radius: 10
                            opacity: 0.8
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
            }

            Component.onCompleted: {
                txtSelectIndex.text=1;
                txtListViewCount.text = list.rowCount.toString()
                list.selection.select(indexSelect-1);

            }
        }
        Rectangle{
            id: switchLineArea
            x: 707
            y:40
            width: 316
            height: 200
            color: "#29313c"
            border.color: "#CD853F"
            radius: 5
            border.width: 2

            SwitchControl_ver2
            {
                id:switchControl
                x:77
                y:20
                textLeft: "All"
                textRight: "Forline"
                rectSelected: "#26a821"
                rectUnSelected: "#CD853F"
                boderRect: "#FFFAF0"
                textSelect: "#FAFAD2"
                textUnSelect: "#CDC9C9"
                onSwitchButton: {
                    swLineUC.visible=!switchControl.isLeft
                }
            }
            SwitchLine3v{
                id: swLineUC
                x: 48
                y: switchControl.y+ switchControl.height + 20
                visible: !switchControl.isLeft
            }
        }

        Rectangle{
            id: navigationArea
            x: 707
            y: switchLineArea.y +switchLineArea.height+1
            width: switchLineArea.width
            height: 388
            color: "#29313c"
            //            color: "transparent"
            border.color: "#CD853F"
            radius: 5
            border.width: 2
            ToolButton {
                id: btnCenter
                x: 124
                y: 70
                width: 68
                height: 100
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
                        imgCenterKey.source= "qrc:/Images/scroll_centerButton_on.png"
                        Ops.showCalculator(txtSelectIndex,"0",list.rowCount.toString());

                    }
                    onReleased:{
                        imgCenterKey.source= "qrc:/Images/scroll_centerButton_off.png"
                    }
                }
            }

            Rectangle {
                id: btnUpStep
                x: ((navigationArea.width-btnCenter.width)/2-btnUpStep.width)/2
                y: btnCenter.y+(btnCenter.height -btnUpStep.height)/2
                width: 68
                height: 68
                radius: width/2
                property bool isPressAndHoldUp: false
                Image {
                    id: imgLineUp
                    anchors.fill: parent
                    source: "qrc:/Images/next_step.png"
                    rotation: -90
                }
                MouseArea {
                    id: pressBtnUpStep
                    anchors.fill: parent

                    onPressedChanged: {
                        if(!pressBtnUpStep.pressed && !btnUpStep.isPressAndHoldUp)
                        {
                            if(indexSelect<1)
                            {
                                indexSelect = 1;
                                startPage = 1;
                                endPage = 10;
                            }
                            else if(indexSelect<=list.rowCount && indexSelect>1)
                            {
                                if(indexSelect == startPage) {
                                    startPage--;
                                    endPage--;
                                }

                                txtSelectIndex.text=(--indexSelect).toString();
                                list.selection.clear();
                                list.selection.select(indexSelect-1);
                                list.positionViewAtRow(indexSelect-1,ListView.Contain);
                            }
                        }
                        imgLineUp.source= "qrc:/Images/next_step_on.png"
                        btnUpStep.isPressAndHoldUp=false;
                    }
                    onExited: {
                        imgLineUp.source= "qrc:/Images/next_step.png"
                    }
                    onPressAndHold: {
                        btnUpStep.isPressAndHoldUp=true;
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
            Rectangle {
                id: btnDownStep
                x: btnCenter.x +btnCenter.width +((navigationArea.width-btnCenter.width)/2-btnUpStep.width)/2
                y: btnCenter.y+(btnCenter.height -btnUpStep.height)/2
                width: 68
                height: 68
                radius: width/2

                property bool isPressAndHold: false
                Image {
                    id: imgLineDown
                    anchors.fill: parent
                    source: "qrc:/Images/down_step.png"
                    rotation: -90
                }

                MouseArea {
                    id: pressBtnDownStep
                    anchors.fill: parent

                    onPressedChanged: {
                        if(!pressBtnDownStep.pressed && !btnDownStep.isPressAndHold)
                        {
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
                        }
                        imgLineDown.source= "qrc:/Images/down_step_on.png"
                        btnDownStep.isPressAndHold=false;
                    }
                    onExited: {
                        imgLineDown.source= "qrc:/Images/down_step.png"
                    }

                    onPressAndHold: {
                        btnDownStep.isPressAndHold=true;
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
            Rectangle {
                id: btnGoBottomPage
                x: 168
                y: 220
                width: 120
                height: 68
                radius: 10
                color: "#6b6c6e"
                border.color: "#DCDCDC"
                border.width: 3
                Text {
                    anchors.centerIn: parent
                    id: txtGoBottomPage
                    text: qsTr("Bottom Page")
                    font.pixelSize: 15
                    font.bold: true
                    color: "#DCDCDC"
                }
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        btnGoBottomPage.border.color ="#31f7bc";
                        txtGoBottomPage.color="#31f7bc";
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
                        list.positionViewAtRow(indexSelect-1,ListView.End )
                    }
                    onReleased: {
                        btnGoBottomPage.border.color ="#DCDCDC";
                        txtGoBottomPage.color="#DCDCDC";
                    }
                }
            }
            Rectangle {
                id: btnGoTopPage
                x: 28
                y: 220
                width: 120
                height: 68
                radius: 10
                color: "#6b6c6e"
                border.color: "#DCDCDC"
                border.width: 3
                Text {
                    anchors.centerIn: parent
                    id: txtGoTopPage
                    text: qsTr("Top Page")
                    font.pixelSize: 15
                    font.bold: true
                    color: "#DCDCDC"
                }

                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        btnGoTopPage.border.color ="#31f7bc";
                        txtGoTopPage.color="#31f7bc";

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
                    onReleased: {
                        btnGoTopPage.border.color ="#DCDCDC";
                        txtGoTopPage.color="#DCDCDC";
                    }
                }
            }
        }
    }
    Component.onCompleted: {
        menuListV3VM.onLoad();
    }
}

