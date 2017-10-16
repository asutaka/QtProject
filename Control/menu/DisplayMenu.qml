import QtQuick 2.0
import QtQuick.Controls 1.4
import "qrc:/Control/VirtualKey.js" as Ops

Item {
    id: displayMenu
    anchors.fill: parent

    width: parent.width
    height: parent.height

    property int heightItem: 40
    property int widthItem: parent.width
    property string strDisplay: "Display"
    property var lstScreen: new Array()
    property var lstScreenVer: new Array()

    Rectangle {
        id: idParent
        anchors.fill: parent
        width: widthItem
        height: parent.height
        color: "#eff3e7"
        opacity: 0.8

        MouseArea {
            anchors.fill: parent
        }

        Rectangle {
            id: rectTop
            width: widthItem
            height: heightItem
            anchors.top: parent.top
            color:"#3CB371"
        }

        Rectangle {
            id: autoHide
            y: rectTop.height
            width: widthItem
            height: heightItem
            color: "transparent"

            Image {
                anchors.top: parent.top
                anchors.topMargin: 15
                anchors.left: parent.left
                anchors.leftMargin: 15
                width:20
                height:22
                source:"qrc:/Images/Flag.png"
            }

            Label {
                text:"Autohide Bar"
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 40
                font.bold: true
                font.pixelSize: 18
            }

            Rectangle {
                id:btnSwitch
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.right: parent.right
                anchors.rightMargin: 15
                width: 55
                height: 30
                color:"transparent"
                property bool isOn: false
                property string strBackground: "#b0afaf"
                property string strButton: "#FF9BAD"
                property int xButton: 0
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        btnSwitch.isOn=!btnSwitch.isOn;
                        if(btnSwitch.isOn) {
                            btnSwitch.state="on";
                        } else {
                            btnSwitch.state="off";
                        }
                        Ops.autohideBar();

                    }
                }

                Rectangle {
                    id: rectSwitchBackground
                    width: 55
                    height:20
                    radius:20
                    color:btnSwitch.strBackground
                    y:5
                }

                Rectangle {
                    id:rectSwitchButton
                    x:btnSwitch.xButton
                    width:30
                    height:30
                    radius:30
                    color:btnSwitch.strButton

                }

                states: [
                    State {
                        name: "on"
                        PropertyChanges { target: btnSwitch; xButton: 25;strBackground:"#77c2bb";strButton: "#009688"; }
                    },
                    State {
                        name: "off"
                        PropertyChanges { target: btnSwitch; xButton: 0;strBackground:"#b0afaf";strButton: "#FF9BAD"; }
                    }
                ]

                transitions: Transition {
                    NumberAnimation {
                        target: btnSwitch
                        property: "xButton"
                        easing.type: "OutQuad"
                        duration: 250
                    }
                }

            }
        }

        Rectangle {
            id: rectLine
            width: widthItem
            height: 2
            color: "gray"
            y: autoHide.y + heightItem
        }

        Rectangle{
            id: rectBottom
            width: widthItem
            height: heightItem
            anchors.bottom: parent.bottom
            color:"#3CB371"

            Label {
                id: lblDisplay
                text: strDisplay
                font.pixelSize: 20
                font.bold: true
                color: "#eff3e7"
                anchors.centerIn: parent
            }
        }

        Rectangle {
            id: integration
            width: widthItem
            height: heightItem
            color: "transparent"
            y: rectLine.y + rectLine.height

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: {
                    rectSelect.y=parent.y
                    rectSelect.visible=true;
                    lblDisplay.text=lblIntegration.text;
                }
                onExited: {
                    rectSelect.visible=false;
                    lblDisplay.text=strDisplay;
                }
                onClicked: {
                    if(menuIntegrationVer.state == "hide") {
                        showScreenVer(menuIntegrationVer)
                    } else {
                        hideScreenVer(menuIntegrationVer)
                    }
                }
            }

            Image {
                id: imgIntegration
                x:15
                y:10
                width:20
                height:22
                source:"qrc:/Images/Play.png"
            }

            Label {
                id: lblIntegration
                x:40
                y:10
                text:"Integration"
                font.bold: true
                font.pixelSize: 18
            }

            Component.onCompleted: {
                integration.state = "normal"
                lstScreen.push(integration)
            }
        }

        Rectangle {
            id: zoomLine
            width: widthItem
            height: heightItem
            color: "transparent"
            y: integration.y + heightItem

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: {
                    rectSelect.y=parent.y
                    rectSelect.visible=true;
                    lblDisplay.text=lblZoomLine.text;
                }
                onExited: {
                    rectSelect.visible=false;
                    lblDisplay.text=strDisplay;
                }
                onClicked: {
                    if(menuZoomLineVer.state == "hide") {
                        showScreenVer(menuZoomLineVer)
                    } else {
                        hideScreenVer(menuZoomLineVer)
                    }
                }
            }

            Image {
                id: imgZoomLine
                x:15
                y:10
                width:20
                height:22
                source:"qrc:/Images/Play.png"
            }

            Label {
                id: lblZoomLine
                //anchors.centerIn: parent
                x:40
                y:10
                text:"Zoom for each line"
                font.bold: true
                font.pixelSize: 18
            }

            Component.onCompleted: {
                zoomLine.state = "normal"
                lstScreen.push(zoomLine)
            }
        }

        Rectangle {
            id: production
            width: widthItem
            height: heightItem
            color: "transparent"
            y: zoomLine.y + heightItem

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: {
                    rectSelect.y=parent.y
                    rectSelect.visible=true;
                    lblDisplay.text=lblProduction.text;
                }
                onExited: {
                    rectSelect.visible=false;
                    lblDisplay.text=strDisplay;
                }

                onClicked: {
                    if(menuProductionVer.state == "hide") {
                        showScreenVer(menuProductionVer)
                    } else {
                        hideScreenVer(menuProductionVer)
                    }
                }
            }

            Image {
                id: imgProduction
                x:15
                y:10
                width:20
                height:22
                source:"qrc:/Images/Play.png"
            }

            Label {
                id:lblProduction
                x:40
                y:10
                text:"Production"
                font.bold: true
                font.pixelSize: 18
            }

            Component.onCompleted: {
                production.state = "normal"
                lstScreen.push(production)
            }

        }

        Rectangle {
            id: xBarRs
            width: widthItem
            height: heightItem
            color: "transparent"
            y: production.y + heightItem

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: {
                    rectSelect.y=parent.y
                    rectSelect.visible=true;
                    lblDisplay.text=lblxBarRs.text;
                }
                onExited: {
                    rectSelect.visible=false;
                    lblDisplay.text=strDisplay;
                }
                onClicked: {
                    if(menuXBarVer.state == "hide") {
                        showScreenVer(menuXBarVer)
                    } else {
                        hideScreenVer(menuXBarVer)
                    }
                }
            }

            Component.onCompleted: {
                xBarRs.state = "normal"
                lstScreen.push(xBarRs)
            }

            Image {
                id: imgXBarRs
                x:15
                y:10
                width:20
                height:22
                source:"qrc:/Images/Play.png"
            }

            Label {
                id:lblxBarRs
                x:40
                y:10
                text:"X-Bar R/S"
                font.bold: true
                font.pixelSize: 18
            }

        }

        Rectangle {
            id: menuList
            width: widthItem
            height: heightItem
            color:"transparent"
            y: xBarRs.y + heightItem

            Image {
                id: imgMenuList
                x: 15
                y: 10
                width: 20
                height: 22
                source:"qrc:/Images/Play.png"
            }

            Label {
                id: lblmenuList
                x:40
                y:10
                text:"Menu List"
                font.bold: true
                font.pixelSize: 18
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: {
                    rectSelect.y=parent.y;
                    rectSelect.visible=true;
                    lblDisplay.text=lblmenuList.text;
                }
                onExited: {
                    rectSelect.visible=false;
                    lblDisplay.text=strDisplay;
                }
                onClicked: {
                    if(menuListVer.state == "hide") {
                        showScreenVer(menuListVer)
                    } else {
                        hideScreenVer(menuListVer)
                    }
                }
            }

            Component.onCompleted: {
                menuList.state = "normal"
                lstScreen.push(menuList)
            }
        }

        Rectangle {
            id: xRay
            width: widthItem
            height: heightItem
            color:"transparent"
            y: menuList.y + heightItem

            Image {
                id: imgXray
                x: 15
                y: 10
                width: 20
                height: 22
                source:"qrc:/Images/Play.png"
            }

            Label {
                id: lblXray
                x:40
                y:10
                text:"X-ray"
                font.bold: true
                font.pixelSize: 18
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: {
                    rectSelect.y=parent.y;
                    rectSelect.visible=true;
                    lblDisplay.text=lblXray.text;
                }
                onExited: {
                    rectSelect.visible=false;
                    lblDisplay.text=strDisplay;
                }
                onClicked: {
                    if(menuXrayver.state == "hide") {
                        showScreenVer(menuXrayver)
                    } else {
                        hideScreenVer(menuXrayver)
                    }
                }
            }

            Component.onCompleted: {
                xRay.state = "normal"
                lstScreen.push(xRay)
            }
        }

        Rectangle {
            id: testControl
            width: widthItem
            height: heightItem
            color:"transparent"
            y: xRay.y + heightItem

            Image {
                id: imgTestControl
                x: 15
                y: 10
                width: 20
                height: 22
                source:"qrc:/Images/Play.png"
            }

            Label {
                id: lblTestControl
                x:40
                y:10
                text:"Screen for test control"
                font.bold: true
                font.pixelSize: 18
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: {
                    rectSelect.y=parent.y;
                    rectSelect.visible=true;
                    lblDisplay.text=lblTestControl.text;
                }
                onExited: {
                    rectSelect.visible=false;
                    lblDisplay.text=strDisplay;
                }
                onClicked: {
                    if(menuTestControlver.state == "hide") {
                        showScreenVer(menuTestControlver)
                    } else {
                        hideScreenVer(menuTestControlver)
                    }
                }
            }

            Component.onCompleted: {
                testControl.state = "normal"
                lstScreen.push(testControl)
            }
        }

        Rectangle {
            id: paramSetting
            width: widthItem
            height: heightItem
            color: "transparent"
            y: testControl.y + heightItem

            Image {
                id: imgParamSetting
                x: 15
                y: 10
                width: 20
                height: 22
                source:"qrc:/Images/Play.png"
            }

            Label {
                id: lblParamSetting
                x: 40
                y: 10
                text: "Parameter Screen"
                font.bold: true
                font.pixelSize: 18
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: {
                    rectSelect.y = parent.y;
                    rectSelect.visible = true;
                    lblDisplay.text = lblParamSetting.text;
                }
                onExited: {
                    rectSelect.visible = false;
                    lblDisplay.text = strDisplay;
                }
                onClicked: {
                    if (menuParameterSetting.state == "hide") {
                        showScreenVer(menuParameterSetting)
                    } else {
                        hideScreenVer(menuParameterSetting)
                    }
                }
            }

            Component.onCompleted: {
                paramSetting.state = "normal"
                lstScreen.push(paramSetting)
            }
        }

        Rectangle {
            id: rectSelect
            width: widthItem
            height: heightItem
            color: "black"
            visible: false
            opacity: 0.2
        }

        Rectangle {
            id: menuIntegrationVer
            visible: false
            x: integration.x
            y: integration.y + integration.height
            width: widthItem
            height: childrenRect.height
            opacity: 0.8
            color: "transparent"
            Rectangle {
                id: integrationVer4
                width: parent.width
                height: heightItem
                color: "transparent"
                Text {
                    id: txtIntegrationVer4
                    x: 40
                    y: 10
                    text: "Integration version 4"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectIntegrationSel.y = parent.y
                        rectIntegrationSel.visible = true;
                        lblDisplay.text = txtIntegrationVer4.text;
                    }
                    onExited: {
                        rectIntegrationSel.visible=false;
                        lblDisplay.text=strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/Integration/Integration_ver4.qml"
                        if(btnSwitch.state == "on"){
                            loaderStatusBar.source = "qrc:/StatusBar/testStatusBar.qml"
                            loaderBottomBar.source = "qrc:/BottomBar/testBottomBar.qml";
                        } else {
                            setNormalBar()
                        }
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }
            Rectangle {
                id: integrationVer3
                width: parent.width
                height: heightItem
                y: integrationVer4.y +integrationVer4.height
                color: "transparent"
                Text {
                    id: txtIntegrationVer3
                    x: 40
                    y: 10
                    text: "Integration version 3"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectIntegrationSel.y = parent.y
                        rectIntegrationSel.visible = true;
                        lblDisplay.text = txtIntegrationVer3.text;
                    }
                    onExited: {
                        rectIntegrationSel.visible=false;
                        lblDisplay.text=strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/Integration/Integration_ver3.qml"
                        if(btnSwitch.state == "on"){
                            loaderStatusBar.source = "qrc:/StatusBar/testStatusBar.qml"
                            loaderBottomBar.source = "qrc:/BottomBar/testBottomBar.qml";
                        } else {
                            setNormalBar()
                        }
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: integrationVer2
                width: parent.width
                height: heightItem
                y: integrationVer3.y +integrationVer3.height
                color: "transparent"
                Text {
                    id: txtIntegrationVer2
                    x: 40
                    y: 10
                    text: "Integration version 2"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectIntegrationSel.y = parent.y
                        rectIntegrationSel.visible = true;
                        lblDisplay.text = txtIntegrationVer1.text;
                    }
                    onExited: {
                        rectIntegrationSel.visible=false;
                        lblDisplay.text=strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/Integration/Integration_ver2.qml"
                        if(btnSwitch.state == "on"){
                            loaderStatusBar.source = "qrc:/StatusBar/testStatusBar.qml"
                            loaderBottomBar.source = "qrc:/BottomBar/testBottomBar.qml";
                        } else {
                            setNormalBar()
                        }
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: integrationVer1
                width: parent.width
                height: heightItem
                y: integrationVer2.y + heightItem
                color: "transparent"

                Text {
                    id: txtIntegrationVer1
                    x: 40
                    y: 10
                    text: "Integration version 1"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectIntegrationSel.y = parent.y
                        rectIntegrationSel.visible = true;
                        lblDisplay.text = txtIntegrationVer1.text;
                    }
                    onExited: {
                        rectIntegrationSel.visible=false;
                        lblDisplay.text=strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/Integration/Integration.qml"
                        if(btnSwitch.state == "on"){
                            loaderStatusBar.source = "qrc:/StatusBar/testStatusBar.qml"
                            loaderBottomBar.source = "qrc:/BottomBar/testBottomBar.qml";
                        } else {
                            setNormalBar()
                        }
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: rectIntegrationSel
                width: widthItem
                height: heightItem
                color: "black"
                visible: false
                opacity: 0.1
            }

            states: [
                State {
                    name: "show"
                    PropertyChanges {target: menuIntegrationVer; visible: true}
                    PropertyChanges {target: imgIntegration; rotation: 90}
                    PropertyChanges {target: zoomLine; y: integration.y + heightItem + menuIntegrationVer.height}
                },
                State {
                    name: "hide"
                    PropertyChanges {target: menuIntegrationVer; visible: false}
                    PropertyChanges {target: imgIntegration; rotation: 0}
                    PropertyChanges {target: zoomLine; y: integration.y + heightItem}
                }]

            Component.onCompleted: {
                menuIntegrationVer.state = "hide"
                lstScreenVer.push(menuIntegrationVer)
            }
        }

        Rectangle {
            id: menuZoomLineVer
            x: zoomLine.x
            y: zoomLine.y + zoomLine.height
            visible: false
            width: widthItem
            height: childrenRect.height
            opacity: 0.8
            color: "transparent"

            Rectangle {
                id: zoomLineVer4
                width: parent.width
                height: heightItem
                color: "transparent"

                Text {
                    id: txtZlver4
                    x:40
                    y:10
                    text:"Zoom Line version 4"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectZlsel.y = parent.y
                        rectZlsel.visible = true;
                        lblDisplay.text = txtZlver4.text;
                    }
                    onExited: {
                        rectZlsel.visible=false;
                        lblDisplay.text=strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/ZoomLine/ZoomLine4V.qml"
                        setNormalBar()
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: zoomLineVer3
                width: parent.width
                height: heightItem
                color: "transparent"
                y: zoomLineVer4.y + zoomLineVer4.height

                Text {
                    id: txtZlver3
                    x:40
                    y:10
                    text:"Zoom Line version 3"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectZlsel.y = parent.y
                        rectZlsel.visible = true;
                        lblDisplay.text = txtZlver3.text;
                    }
                    onExited: {
                        rectZlsel.visible=false;
                        lblDisplay.text=strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/ZoomLine/ZoomLine3V.qml"
                        setNormalBar()
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: zoomLineVer2
                width: parent.width
                height: heightItem
                y: zoomLineVer3.y + zoomLineVer3.height
                color: "transparent"

                Text {
                    id: txtZlver2
                    x:40
                    y:10
                    text:"Zoom Line version 2"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectZlsel.y = parent.y
                        rectZlsel.visible = true;
                        lblDisplay.text = txtZlver2.text;
                    }
                    onExited: {
                        rectZlsel.visible=false;
                        lblDisplay.text=strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/ZoomLine/ZoomLine2V.qml"
                        if(btnSwitch.state == "on"){
                            loaderStatusBar.source = "qrc:/StatusBar/testStatusBar.qml"
                            loaderBottomBar.source = "qrc:/BottomBar/testBottomBar.qml";
                        } else {
                            setNormalBar()
                        }
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: zoomLineVer1
                width: parent.width
                height: heightItem
                y: zoomLineVer2.y + zoomLineVer2.height
                color: "transparent"

                Text {
                    id: txtZlver1
                    x:40
                    y:10
                    text:"Zoom Line version 1"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectZlsel.y = parent.y
                        rectZlsel.visible = true;
                        lblDisplay.text = txtZlver1.text;
                    }
                    onExited: {
                        rectZlsel.visible=false;
                        lblDisplay.text=strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/ZoomLine/ZoomLine.qml"
                        if(btnSwitch.state == "on"){
                            loaderStatusBar.source = "qrc:/StatusBar/testStatusBar.qml"
                            loaderBottomBar.source = "qrc:/BottomBar/testBottomBar.qml";
                        } else {
                            setNormalBar()
                        }
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: rectZlsel
                width: parent.width
                height: heightItem
                color:"black"
                visible: false
                opacity:0.1
            }

            states: [
                State {
                    name: "show"
                    PropertyChanges {target: menuZoomLineVer; visible: true}
                    PropertyChanges {target: imgZoomLine; rotation: 90}
                    PropertyChanges {target: production; y: zoomLine.y + heightItem + menuZoomLineVer.height}
                },
                State {
                    name: "hide"
                    PropertyChanges {target: menuZoomLineVer; visible: false}
                    PropertyChanges {target: imgZoomLine; rotation: 0}
                    PropertyChanges {target: production; y: zoomLine.y + heightItem}
                }]

            Component.onCompleted: {
                menuZoomLineVer.state = "hide"
                lstScreenVer.push(menuZoomLineVer)
            }
        }

        Rectangle {
            id: menuProductionVer
            visible: false
            x: production.x
            y: production.y + production.height
            width: widthItem
            height: childrenRect.height
            opacity: 0.8
            color: "transparent"

            Rectangle {
                id: productionVer1
                width: parent.width
                height: heightItem
                color: "transparent"

                Text {
                    id: txtProductionVer1
                    x:40
                    y:10
                    text: "Production version 1"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectProductionSel.y = parent.y
                        rectProductionSel.visible = true;
                        lblDisplay.text = txtProductionVer1.text;
                    }
                    onExited: {
                        rectProductionSel.visible=false;
                        lblDisplay.text=strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/Production/Production.qml"
                        if(btnSwitch.state == "on"){
                            loaderStatusBar.source = "qrc:/StatusBar/testStatusBar.qml"
                            loaderBottomBar.source = "qrc:/BottomBar/testBottomBar.qml";
                        } else {
                            setNormalBar()
                        }
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: rectProductionSel
                width: widthItem
                height: heightItem
                color:"black"
                visible: false
                opacity:0.1
            }

            states: [
                State {
                    name: "show"
                    PropertyChanges {target: menuProductionVer; visible: true}
                    PropertyChanges {target: imgProduction; rotation: 90}
                    PropertyChanges {target: xBarRs; y: production.y + heightItem + menuProductionVer.height}
                },
                State {
                    name: "hide"
                    PropertyChanges {target: menuProductionVer; visible: false}
                    PropertyChanges {target: imgProduction; rotation: 0}
                    PropertyChanges {target: xBarRs; y: production.y + heightItem}
                }]

            Component.onCompleted: {
                menuProductionVer.state = "hide"
                lstScreenVer.push(menuProductionVer)
            }
        }

        Rectangle {
            id: menuXBarVer
            visible: false
            x: xBarRs.x
            y: xBarRs.y + xBarRs.height
            width: parent.width
            height: childrenRect.height
            opacity: 0.8
            color: "transparent"

            Rectangle {
                id: xBarVer5
                width: parent.width
                height: heightItem
                color: "transparent"

                Text {
                    id: txtXBarVer5
                    x:40
                    y:10
                    text:"XBar R/S New Chart"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectXBarSel.y = parent.y
                        rectXBarSel.visible = true;
                        lblDisplay.text = txtXBarVer5.text;
                    }
                    onExited: {
                        rectXBarSel.visible=false;
                        lblDisplay.text=strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/XBarRS/XbarRS_NewChart.qml"
                        if(btnSwitch.state == "on"){
                            loaderStatusBar.source = "StatusBar/testStatusBar.qml"
                            loaderBottomBar.source = "BottomBar/testBottomBar.qml";
                        } else {
                            setNormalBar()
                        }
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }
            Rectangle {
                id: xBarVer4
                width: parent.width
                height: heightItem
                y: xBarVer5.y+heightItem
                color: "transparent"

                Text {
                    id: txtXBarVer4
                    x:40
                    y:10
                    text:"XBar R/S version 4"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectXBarSel.y = parent.y
                        rectXBarSel.visible = true;
                        lblDisplay.text = txtXBarVer4.text;
                    }
                    onExited: {
                        rectXBarSel.visible=false;
                        lblDisplay.text=strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/XBarRS/XBarRS_ver4.qml"
                        if(btnSwitch.state == "on"){
                            loaderStatusBar.source = "StatusBar/testStatusBar.qml"
                            loaderBottomBar.source = "BottomBar/testBottomBar.qml";
                        } else {
                            setNormalBar()
                        }
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: xBarVer3
                width: parent.width
                height: heightItem
                y: xBarVer4.y + xBarVer4.height
                color: "transparent"

                Text {
                    id: txtXBarVer3
                    x:40
                    y:10
                    text:"XBar R/S version 3"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectXBarSel.y = parent.y
                        rectXBarSel.visible = true;
                        lblDisplay.text = txtXBarVer3.text;
                    }
                    onExited: {
                        rectXBarSel.visible=false;
                        lblDisplay.text=strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/XBarRS/XBarRS_ver3.qml"
                        if(btnSwitch.state == "on"){
                            loaderStatusBar.source = "StatusBar/testStatusBar.qml"
                            loaderBottomBar.source = "BottomBar/testBottomBar.qml";
                        } else {
                            setNormalBar()
                        }
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: xBarVer2
                width: parent.width
                height: heightItem
                y: xBarVer3.y + xBarVer3.height
                color: "transparent"

                Text {
                    id: txtXBarVer2
                    x:40
                    y:10
                    text:"XBar R/S version 2"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectXBarSel.y = parent.y
                        rectXBarSel.visible = true;
                        lblDisplay.text = txtXBarVer2.text;
                    }
                    onExited: {
                        rectXBarSel.visible=false;
                        lblDisplay.text=strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/XBarRS/XBarRS_ver2.qml"
                        if(btnSwitch.state == "on"){
                            loaderStatusBar.source = "qrc:/StatusBar/testStatusBar.qml"
                            loaderBottomBar.source = "qrc:/BottomBar/testBottomBar.qml";
                        } else {
                            setNormalBar()
                        }
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: xBarVer1
                width: parent.width
                height: heightItem
                y: xBarVer2.y + xBarVer2.height
                color: "transparent"

                Text {
                    id: txtXBarVer1
                    x:40
                    y:10
                    text:"XBar R/S version 1"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectXBarSel.y = parent.y
                        rectXBarSel.visible = true;
                        lblDisplay.text = txtXBarVer1.text;
                    }
                    onExited: {
                        rectXBarSel.visible=false;
                        lblDisplay.text=strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/XBarRS/XBarRS.qml"
                        if(btnSwitch.state == "on"){
                            loaderStatusBar.source = "qrc:/StatusBar/testStatusBar.qml"
                            loaderBottomBar.source = "qrc:/BottomBar/testBottomBar.qml";
                        } else {
                            setNormalBar()
                        }
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: rectXBarSel
                width: widthItem
                height: heightItem
                color:"black"
                visible: false
                opacity:0.1
            }

            states: [
                State {
                    name: "show"
                    PropertyChanges {target: menuXBarVer; visible: true}
                    PropertyChanges {target: imgXBarRs; rotation: 90}
                    PropertyChanges {target: menuList; y: xBarRs.y + heightItem + menuXBarVer.height}
                },
                State {
                    name: "hide"
                    PropertyChanges {target: menuXBarVer; visible: false}
                    PropertyChanges {target: imgXBarRs; rotation: 0}
                    PropertyChanges {target: menuList; y: xBarRs.y + heightItem}
                }]

            Component.onCompleted: {
                menuXBarVer.state = "hide"
                lstScreenVer.push(menuXBarVer)
            }
        }

        Rectangle {
            id: menuListVer
            x: menuList.x
            y: menuList.y + menuList.height
            visible: false
            width: widthItem
            height: childrenRect.height
            opacity: 0.8
            color: "transparent"

            Rectangle {
                id: menuListVer3
                width: parent.width
                height: heightItem
                color: "transparent"

                Text {
                    id: txtMenuListVer3
                    x:40
                    y:10
                    text:"Menu List version 3"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectMenuListSel.y = parent.y
                        rectMenuListSel.visible = true;
                        lblDisplay.text = txtMenuListVer3.text;
                    }
                    onExited: {
                        rectMenuListSel.visible = false;
                        lblDisplay.text = strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/MenuScreen/MenuList3V.qml"
                        if(btnSwitch.state == "on"){
                            loaderStatusBar.source = "qrc:/StatusBar/testStatusBar.qml"
                            loaderBottomBar.source = "qrc:/BottomBar/testBottomBar.qml";
                        } else {
                            setNormalBar()
                        }
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: menuListVer2
                width: parent.width
                height: heightItem
                y: menuListVer3.y+menuListVer3.height
                color: "transparent"

                Text {
                    id: txtMenuListVer2
                    x:40
                    y:10
                    text:"Menu List version 2"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectMenuListSel.y = parent.y
                        rectMenuListSel.visible = true;
                        lblDisplay.text = txtMenuListVer2.text;
                    }
                    onExited: {
                        rectMenuListSel.visible = false;
                        lblDisplay.text = strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/MenuScreen/MenuListNew.qml"
                        if(btnSwitch.state == "on"){
                            loaderStatusBar.source = "qrc:/StatusBar/testStatusBar.qml"
                            loaderBottomBar.source = "qrc:/BottomBar/testBottomBar.qml";
                        } else {
                            setNormalBar()
                        }
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: menuListVer1
                width: parent.width
                height: heightItem
                y: menuListVer2.y + menuListVer2.height
                color: "transparent"

                Text {
                    id: txtMenuListVer1
                    x:40
                    y:10
                    text:"Menu List version 1"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectMenuListSel.y = parent.y
                        rectMenuListSel.visible = true;
                        lblDisplay.text = txtMenuListVer1.text;
                    }
                    onExited: {
                        rectMenuListSel.visible=false;
                        lblDisplay.text=strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/MenuScreen/MenuList.qml"
                        if(btnSwitch.state == "on"){
                            loaderStatusBar.source = "qrc:/StatusBar/testStatusBar.qml"
                            loaderBottomBar.source = "qrc:/BottomBar/testBottomBar.qml";
                        } else {
                            setNormalBar()
                        }
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: rectMenuListSel
                width: parent.width
                height: heightItem
                color:"black"
                visible: false
                opacity:0.1
            }

            states: [
                State {
                    name: "show"
                    PropertyChanges {target: menuListVer; visible: true}
                    PropertyChanges {target: imgMenuList; rotation: 90}
                    PropertyChanges {target: xRay; y: menuList.y + menuListVer.height + heightItem}
                },
                State {
                    name: "hide"
                    PropertyChanges {target: menuListVer; visible: false}
                    PropertyChanges {target: imgMenuList; rotation: 0}
                    PropertyChanges {target: xRay; y: menuList.y + heightItem}
                }]

            Component.onCompleted: {
                menuListVer.state = "hide"
                lstScreenVer.push(menuListVer)
            }
        }

        Rectangle {
            id: menuXrayver
            x: xRay.x
            y: xRay.y + xRay.height
            visible: false
            width: widthItem
            height: childrenRect.height
            opacity: 0.8
            color: "transparent"

            Rectangle {
                id: xRayVer2
                width: parent.width
                height: heightItem
                color: "transparent"

                Text {
                    id: txtXRayVer2
                    x:40
                    y:10
                    text:"X-ray use Buffer Image"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectXraySel.y = parent.y
                        rectXraySel.visible = true;
                        lblDisplay.text = txtXRayVer1.text;
                    }
                    onExited: {
                        rectXraySel.visible = false;
                        lblDisplay.text = strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/XRay/XRayQImage.qml"
                        if(btnSwitch.state == "on"){
                            loaderStatusBar.source = "qrc:/StatusBar/testStatusBar.qml"
                            loaderBottomBar.source = "qrc:/BottomBar/testBottomBar.qml";
                        } else {
                            setNormalBar()
                        }
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: xRayVer1
                width: parent.width
                height: heightItem
                y:xRayVer2.y +heightItem
                color: "transparent"

                Text {
                    id: txtXRayVer1
                    x:40
                    y:10
                    text:"X-ray Screen"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectXraySel.y = parent.y
                        rectXraySel.visible = true;
                        lblDisplay.text = txtXRayVer1.text;
                    }
                    onExited: {
                        rectXraySel.visible = false;
                        lblDisplay.text = strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/XRay/XRay.qml"
                        if(btnSwitch.state == "on"){
                            loaderStatusBar.source = "qrc:/StatusBar/testStatusBar.qml"
                            loaderBottomBar.source = "qrc:/BottomBar/testBottomBar.qml";
                        } else {
                            setNormalBar()
                        }
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: rectXraySel
                width: parent.width
                height: heightItem
                color:"black"
                visible: false
                opacity:0.1
            }

            states: [
                State {
                    name: "show"
                    PropertyChanges {target: menuXrayver; visible: true}
                    PropertyChanges {target: imgXray; rotation: 90}
                    PropertyChanges {target: testControl; y: xRay.y + menuXrayver.height + heightItem}
                },
                State {
                    name: "hide"
                    PropertyChanges {target: menuXrayver; visible: false}
                    PropertyChanges {target: imgXray; rotation: 0}
                    PropertyChanges {target: testControl; y: xRay.y + heightItem}
                }]

            Component.onCompleted: {
                menuXrayver.state = "hide"
                lstScreenVer.push(menuXrayver)
            }
        }

        Rectangle {
            id: menuTestControlver
            x: testControl.x
            y: testControl.y + testControl.height
            visible: false
            width: widthItem
            height: childrenRect.height
            opacity: 0.8
            color: "transparent"

            Rectangle {
                id: accordionList2
                width: parent.width
                height: heightItem
                color: "transparent"

                Text {
                    id: txtAccordionList2
                    x:40
                    y:10
                    text:"Test Accordion List 2"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectTestSel.y = parent.y
                        rectTestSel.visible = true;
                        lblDisplay.text = txtAccordionList2.text;
                    }
                    onExited: {
                        rectTestSel.visible=false;
                        lblDisplay.text=strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/Test/AccordionList2.qml"
                        if(btnSwitch.state == "on"){
                            loaderStatusBar.source = "qrc:/StatusBar/testStatusBar.qml"
                            loaderBottomBar.source = "qrc:/BottomBar/testBottomBar.qml";
                        } else {
                            setNormalBar()
                        }
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: testSlider
                width: parent.width
                height: heightItem
                y: accordionList2.y +accordionList2.height
                color: "transparent"

                Text {
                    id: txtTestSlider
                    x:40
                    y:10
                    text:"Test Slider Control"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectTestSel.y = parent.y
                        rectTestSel.visible = true;
                        lblDisplay.text = txtTestSlider.text;
                    }
                    onExited: {
                        rectTestSel.visible = false;
                        lblDisplay.text = strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/Test/TestSliderControl.qml"
                        if(btnSwitch.state == "on"){
                            loaderStatusBar.source = "qrc:/StatusBar/testStatusBar.qml"
                            loaderBottomBar.source = "qrc:/BottomBar/testBottomBar.qml";
                        } else {
                            setNormalBar()
                        }
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: testWheel
                width: parent.width
                height: heightItem
                y: testSlider.y + heightItem
                color: "transparent"

                Text {
                    id: txtTestWheel
                    x:40
                    y:10
                    text:"Test wheel control"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectTestSel.y = parent.y
                        rectTestSel.visible = true;
                        lblDisplay.text = txtTestWheel.text;
                    }
                    onExited: {
                        rectTestSel.visible = false;
                        lblDisplay.text = strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/Test/TestWheelControl.qml"
                        if(btnSwitch.state == "on"){
                            loaderStatusBar.source = "qrc:/StatusBar/testStatusBar.qml"
                            loaderBottomBar.source = "qrc:/BottomBar/testBottomBar.qml";
                        } else {
                            setNormalBar()
                        }
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: testAccordionList
                width: parent.width
                height: heightItem
                y: testWheel.y + testWheel.height
                color: "transparent"

                Text {
                    id: txtTestAccordionList
                    x:40
                    y:10
                    text:"Test Accordion List"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectTestSel.y = parent.y
                        rectTestSel.visible = true;
                        lblDisplay.text = txtTestAccordionList.text;
                    }
                    onExited: {
                        rectTestSel.visible=false;
                        lblDisplay.text=strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/Test/TestAccordionList.qml"
                        if(btnSwitch.state == "on"){
                            loaderStatusBar.source = "qrc:/StatusBar/testStatusBar.qml"
                            loaderBottomBar.source = "qrc:/BottomBar/testBottomBar.qml";
                        } else {
                            setNormalBar()
                        }
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: cw
                width: parent.width
                height: heightItem
                y: testAccordionList.y + testAccordionList.height
                color: "transparent"

                Text {
                    id: txtCW
                    x:40
                    y:10
                    text:"Test CW Screen"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectMenuListSel.y = parent.y
                        rectMenuListSel.visible = true;
                        lblDisplay.text = txtTestWheel.text;
                    }
                    onExited: {
                        rectMenuListSel.visible = false;
                        lblDisplay.text = strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/CW/CW.qml"
                        if(btnSwitch.state == "on"){
                            loaderStatusBar.source = "qrc:/StatusBar/testStatusBar.qml"
                            loaderBottomBar.source = "qrc:/BottomBar/testBottomBar.qml";
                        } else {
                            setNormalBar()
                        }
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: statusBarVer2
                width: parent.width
                height: heightItem
                y: cw.y + cw.height
                color: "transparent"

                Text {
                    id: txtStatusBarVer2
                    x:40
                    y:10
                    text:"StatusBar ver 2"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectMenuListSel.y = parent.y
                        rectMenuListSel.visible = true;
                        lblDisplay.text = txtTestWheel.text;
                    }
                    onExited: {
                        rectMenuListSel.visible = false;
                        lblDisplay.text = strDisplay;
                    }
                    onClicked: {
                        loaderStatusBar.source ="qrc:/StatusBar/StatusBar_ver2.qml"
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: testFW
                width: parent.width
                height: heightItem
                y: statusBarVer2.y + statusBarVer2.height
                color: "transparent"

                Text {
                    id: txtTestFramwork
                    x:40
                    y:10
                    text:"Test Framwork Screen"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectMenuListSel.y = parent.y
                        rectMenuListSel.visible = true;
                        lblDisplay.text = txtTestWheel.text;
                    }
                    onExited: {
                        rectMenuListSel.visible = false;
                        lblDisplay.text = strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/TestFramework/TestFramework.qml"
                        if(btnSwitch.state == "on"){
                            loaderStatusBar.source = "qrc:/StatusBar/testStatusBar.qml"
                            loaderBottomBar.source = "qrc:/BottomBar/testBottomBar.qml";
                        } else {
                            setNormalBar()
                        }
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: rectTestSel
                width: parent.width
                height: heightItem
                color:"black"
                visible: false
                opacity:0.1
            }

            states: [
                State {
                    name: "show"
                    PropertyChanges {target: menuTestControlver; visible: true}
                    PropertyChanges {target: imgTestControl; rotation: 90}
                    PropertyChanges {target: paramSetting; y: testControl.y + heightItem + menuTestControlver.height}
                },
                State {
                    name: "hide"
                    PropertyChanges {target: menuTestControlver; visible: false}
                    PropertyChanges {target: imgTestControl; rotation: 0}
                    PropertyChanges {target: paramSetting; y: testControl.y + heightItem}
                }]

            Component.onCompleted: {
                menuTestControlver.state = "hide"
                lstScreenVer.push(menuTestControlver)
            }
        }

        Rectangle {
            id: menuParameterSetting
            x: paramSetting.x
            y: paramSetting.y + paramSetting.height
            visible: false
            width: widthItem
            height: childrenRect.height
            opacity: 0.8
            color: "transparent"

            Rectangle {
                id: paramSettingv1
                width: parent.width
                height: heightItem
                color: "transparent"

                Text {
                    id: txtParamSettingv1
                    x:40
                    y:10
                    text:"Param Setting verison 1"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectParamSetting.y = parent.y
                        rectParamSetting.visible = true;
                        lblDisplay.text = txtParamSettingv1.text;
                    }
                    onExited: {
                        rectParamSetting.visible = false;
                        lblDisplay.text = strDisplay;
                    }
                    onClicked: {
                        loaderContent.source = "qrc:/ParameterSetting/ParameterSetting.qml"
                        loaderStatusBar.source = "qrc:/StatusBar/StatusBar.qml"
                        loaderBottomBar.source = "qrc:/BottomBar/BottomBarParameterSetting.qml";
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: paramSettingv2
                width: parent.width
                height: heightItem
                y: paramSettingv1.y + heightItem
                color: "transparent"

                Text {
                    id: txtParamSettingv2
                    x: 40
                    y: 10
                    text:"Param Setting verison 2"
                    font.bold: true
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        rectParamSetting.y = parent.y
                        rectParamSetting.visible = true;
                        lblDisplay.text = txtParamSettingv2.text;
                    }
                    onExited: {
                        rectParamSetting.visible = false;
                        lblDisplay.text = strDisplay;
                    }
                    onClicked: {
                        loaderContent.source ="qrc:/ParameterSetting/ParameterSettingv2.qml"
                        loaderStatusBar.source = "qrc:/StatusBar/StatusBar.qml"
                        loaderBottomBar.source = "qrc:/BottomBar/BottomBarParameterSettingv2.qml";
                        hideAllmenuVer()
                        Ops.hideDisplayMenu();
                    }
                }
            }

            Rectangle {
                id: rectParamSetting
                width: parent.width
                height: heightItem
                color:"black"
                visible: false
                opacity:0.1
            }

            states: [
                State {
                    name: "show"
                    PropertyChanges {target: menuParameterSetting; visible: true}
                    PropertyChanges {target: imgParamSetting; rotation: 90}
                },
                State {
                    name: "hide"
                    PropertyChanges {target: menuParameterSetting; visible: false}
                    PropertyChanges {target: imgParamSetting; rotation: 0}
                }]

            Component.onCompleted: {
                menuParameterSetting.state = "hide"
                lstScreenVer.push(menuParameterSetting)
            }
        }
    }

    function hideAllmenuVer() {
        for(var i = 0 ; i < lstScreenVer.length; i++) {
            lstScreenVer[i].state = "hide"
        }
    }

    function showScreenVer(screenVer) {
        for(var i = 0 ; i < lstScreenVer.length; i++) {
            if(lstScreenVer[i] === screenVer) {
                lstScreenVer[i].state = "show"
            } else {
                lstScreenVer[i].state = "hide"
            }
        }
    }

    function hideScreenVer(screenVer) {
        for(var i = 0 ; i < lstScreenVer.length; i++) {
            if(lstScreenVer[i] === screenVer) {
                lstScreenVer[i].state = "hide"
            }
        }
    }

    function setNormalBar() {
        loaderStatusBar.source = "qrc:/StatusBar/StatusBar.qml"
        loaderBottomBar.source ="qrc:/BottomBar/BottomBarMainPage.qml"
    }
}
