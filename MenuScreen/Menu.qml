import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import ControlApp 1.0

Item{
    id: menuScreen

    property  alias menuScreenVM: menuScreenModel
    Menu{
        id: menuScreenModel
    }

    Rectangle {
        id: rectContent
        width: 1024
        height: 640

        Image {
            anchors.fill: parent
            id: rectContentBkgnd
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            source: "image://MyProvider/Menu_Back.png"

            ToolButton {
                id: btnRegisterNewProduct
                x: 54
                y: 128
                width: 450
                height: 75
                Image {
                    id: imgRegisterNewProduct
                    source: "image://MyProvider/Key_W380.png"
                    anchors.fill: parent
                    Image {
                        x: 8
                        y: 8
                        width: 60
                        height: 60
                        source: "image://MyProvider/MenuButton_Icon_64_01.png"
                                            }
                    Text {
                        id: txtRegisterNewProduct
                        text: menuScreenVM.txtRegisterNewProduct
                        anchors.verticalCenterOffset: 0
                        anchors.horizontalCenterOffset: 8
                        anchors.bottomMargin: 0
                        font.family: "MS Gothic"
                        font.pixelSize:24
                        color: "#000000"
                        anchors.bottom: parent.bottom
                        anchors.centerIn: parent
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            loaderContent.source ="MenuList.qml"
                            loaderBottomBar.source ="qrc:/BottomBar/BottomBarMenuList.qml"
                        }
                        onPressed: imgRegisterNewProduct.source= "image://MyProvider/Key_W380_push.png"
                        onReleased:imgRegisterNewProduct.source= "image://MyProvider/Key_W380.png"
                        onCanceled: imgRegisterNewProduct.source= "image://MyProvider/Key_W380.png"
                    }
                }
            }

            ToolButton {
                id: btnDisplayProductList
                x: 54
                y: 229
                width: 450
                height: 75
                Image {
                    id: imgDisplayProductList
                    source: "image://MyProvider/Key_W380.png"
                    anchors.fill: parent
                    Text {
                        id: txtDisplayProductList
                        text: menuScreenVM.txtDisplayProductList
                        anchors.verticalCenterOffset: 0
                        anchors.horizontalCenterOffset: 10
                        anchors.bottomMargin: 2
                        font.family: "MS Gothic"
                        font.pixelSize:24
                        color: "#000000"
                        anchors.bottom: parent.bottom
                        anchors.centerIn: parent
                    }

                    Image {
                        x: 8
                        y: 8
                        width: 60
                        height: 60
                        source: "image://MyProvider/MenuButton_Icon_64_03.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            loaderContent.source ="MenuList.qml"
                            loaderBottomBar.source ="qrc:/BottomBar/BottomBarMenuList.qml"
                        }
                        onPressed: imgDisplayProductList.source= "image://MyProvider/Key_W380_push.png"
                        onReleased:imgDisplayProductList.source= "image://MyProvider/Key_W380.png"
                        onCanceled: imgDisplayProductList.source= "image://MyProvider/Key_W380.png"
                    }
                }
            }

            ToolButton {
                id: btnAdjustRegisteredProduct
                x: 536
                y: 128
                width: 450
                height: 75
                Image {
                    id: imgAdjustRegisteredProduct
                    source: "image://MyProvider/Key_W380.png"
                    anchors.fill: parent
                    Text {
                        id: txtAdjustRegisteredProduct
                        text: menuScreenVM.txtAdjustRegisteredProduct
                        anchors.verticalCenterOffset: 0
                        anchors.horizontalCenterOffset: 40
                        anchors.bottomMargin: 0
                        font.family: "MS Gothic"
                        font.pixelSize:24
                        color: "#000000"
                        anchors.bottom: parent.bottom
                        anchors.centerIn: parent
                    }

                    Image {
                        x: 8
                        y: 8
                        width: 60
                        height: 60
                        source: "image://MyProvider/MenuButton_Icon_64_02.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            mainModel.InnerChangeScreen(ScreenMng.SettingParamV1)
                        }
                        onPressed: imgAdjustRegisteredProduct.source= "image://MyProvider/Key_W380_push.png"
                        onReleased:imgAdjustRegisteredProduct.source= "image://MyProvider/Key_W380.png"
                        onCanceled: imgAdjustRegisteredProduct.source= "image://MyProvider/Key_W380.png"
                    }
                }
            }

            ToolButton {
                id: btnControlPanel
                x: 536
                y: 229
                width: 450
                height: 75
                Image {
                    id:imgControlPanel
                    source: "image://MyProvider/Key_W380.png"
                    anchors.fill: parent
                    Text {
                        id: txtControlPanel
                        text: menuScreenVM.txtControlPanel
                        anchors.verticalCenterOffset: 0
                        anchors.horizontalCenterOffset: -41
                        anchors.bottomMargin: 1
                        font.family: "MS Gothic"
                        font.pixelSize:24
                        color: "#000000"
                        anchors.bottom: parent.bottom
                        anchors.centerIn: parent
                    }

                    Image {
                        x: 8
                        y: 8
                        width: 60
                        height: 60
                        source: "image://MyProvider/MenuButton_Icon_64_04.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            mainModel.InnerChangeScreen(ScreenMng.SettingParamV2)
                        }
                        onPressed: imgControlPanel.source= "image://MyProvider/Key_W380_push.png"
                        onReleased:imgControlPanel.source= "image://MyProvider/Key_W380.png"
                        onCanceled: imgControlPanel.source= "image://MyProvider/Key_W380.png"
                    }
                }
            }

            ToolButton {
                id: btnStatsControl
                x: 370
                y: 334
                width: 300
                height: 75
                Image {
                    id: imgStatsControl
                    source: "image://MyProvider/Key_W255.png"
                    anchors.fill: parent
                    Text {
                        id: txtStatsControl
                        x: 100
                        text: menuScreenVM.txtStatsControl
                        anchors.verticalCenterOffset: 0
                        anchors.horizontalCenterOffset: 6
                        anchors.bottomMargin: 1
                        font.family: "MS Gothic"
                        font.pixelSize:24
                        color: "#000000"
                        anchors.bottom: parent.bottom
                        anchors.centerIn: parent
                    }

                    Image {
                        x: 20
                        y: 15
                        width: 40
                        height: 40
                        source: "image://MyProvider/MenuButton_Icon_32_02.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            loaderContent.source ="MenuList.qml"
                            loaderBottomBar.source ="qrc:/BottomBar/BottomBarMenuList.qml"
                        }
                        onPressed: imgStatsControl.source= "image://MyProvider/Key_W380_push.png"
                        onReleased:imgStatsControl.source= "image://MyProvider/Key_W380.png"
                        onCanceled: imgStatsControl.source= "image://MyProvider/Key_W380.png"
                    }
                }
            }

            ToolButton {
                id: btnOpeCheck
                x: 50
                y: 335
                width: 300
                height: 75
                Image {
                    id:imgOpeCheck
                    source: "image://MyProvider/Key_W255.png"
                    anchors.fill: parent
                    Text {
                        id: txtOpeCheck
                        x: 100
                        text: menuScreenVM.txtOpeCheck
                        anchors.verticalCenterOffset: 0
                        anchors.horizontalCenterOffset: -19
                        anchors.bottomMargin: 0
                        font.family: "MS Gothic"
                        font.pixelSize:24
                        color: "#000000"
                        anchors.bottom: parent.bottom
                        anchors.centerIn: parent
                    }

                    Image {
                        x: 20
                        y: 15
                        width: 40
                        height: 40
                        source: "image://MyProvider/MenuButton_Icon_32_01.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            loaderContent.source ="MenuList.qml"
                            loaderBottomBar.source ="qrc:/BottomBar/BottomBarMenuList.qml"
                        }
                        onPressed: imgOpeCheck.source= "image://MyProvider/Key_W380_push.png"
                        onReleased:imgOpeCheck.source= "image://MyProvider/Key_W380.png"
                        onCanceled: imgOpeCheck.source= "image://MyProvider/Key_W380.png"
                    }
                }
            }

            ToolButton {
                id: btnUsbMemory
                x: 50
                y: 438
                width: 300
                height: 75
                Image {
                    id: imgUsbMemory
                    source: "image://MyProvider/Key_W255.png"
                    anchors.fill: parent
                    Text {
                        id: txtUsbMemory
                        x: 100
                        width: 140
                        text: menuScreenVM.txtUsbMemory
                        anchors.verticalCenterOffset: 0
                        anchors.horizontalCenterOffset: 0
                        anchors.bottomMargin: 0
                        font.family: "MS Gothic"
                        font.pixelSize:24
                        color: "#000000"
                        anchors.bottom: parent.bottom
                        anchors.centerIn: parent
                    }

                    Image {
                        x: 20
                        y: 15
                        width: 40
                        height: 40
                        source: "image://MyProvider/MenuButton_Icon_32_04.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            loaderContent.source ="MenuList.qml"
                            loaderBottomBar.source ="qrc:/BottomBar/BottomBarMenuList.qml"
                        }
                        onPressed: imgUsbMemory.source= "image://MyProvider/Key_W380_push.png"
                        onReleased:imgUsbMemory.source= "image://MyProvider/Key_W380.png"
                        onCanceled: imgUsbMemory.source= "image://MyProvider/Key_W380.png"
                    }
                }
            }

            ToolButton {
                id: btnLanguage
                x: 370
                y: 438
                width: 300
                height: 75
                Image {
                    id:imgLanguage
                    source: "image://MyProvider/Key_W255.png"
                    anchors.fill: parent
                    Text {
                        id: txtLanguage
                        text: menuScreenVM.txtLanguage
                        anchors.verticalCenterOffset: 0
                        anchors.horizontalCenterOffset: -25
                        anchors.bottomMargin: 0
                        font.family: "MS Gothic"
                        font.pixelSize:24
                        color: "#000000"
                        anchors.bottom: parent.bottom
                        anchors.centerIn: parent
                    }

                    Image {
                        x: 20
                        y: 15
                        width: 40
                        height: 40
                        source: "image://MyProvider/MenuButton_Icon_32_05.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            loaderContent.source ="MenuList.qml"
                            loaderBottomBar.source ="qrc:/BottomBar/BottomBarMenuList.qml"
                        }
                        onPressed: imgLanguage.source= "image://MyProvider/Key_W380_push.png"
                        onReleased:imgLanguage.source= "image://MyProvider/Key_W380.png"
                        onCanceled: imgLanguage.source= "image://MyProvider/Key_W380.png"
                    }
                }
            }

            ToolButton {
                id: btnHistory
                x: 686
                y: 334
                width: 300
                height: 75
                Image {
                    id:imgHistory
                    source: "image://MyProvider/Key_W255.png"
                    anchors.fill: parent
                    Text {
                        id: txtHistory
                        text: menuScreenVM.txtHistory
                        anchors.verticalCenterOffset: 0
                        anchors.horizontalCenterOffset: -32
                        anchors.bottomMargin: 0
                        font.family: "MS Gothic"
                        font.pixelSize:24
                        color: "#000000"
                        anchors.bottom: parent.bottom
                        anchors.centerIn: parent
                    }

                    Image {
                        x: 20
                        y: 15
                        width: 40
                        height: 40
                        source: "image://MyProvider/MenuButton_Icon_32_031.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            loaderContent.source ="MenuList.qml"
                            loaderBottomBar.source ="qrc:/BottomBar/BottomBarMenuList.qml"
                        }
                        onPressed: imgHistory.source= "image://MyProvider/Key_W380_push.png"
                        onReleased:imgHistory.source= "image://MyProvider/Key_W380.png"
                        onCanceled: imgHistory.source= "image://MyProvider/Key_W380.png"
                    }
                }
            }

            ToolButton {
                id: btnMaintAndSetting
                x: 686
                y: 438
                width: 300
                height: 75
                Image {
                    id:imgMaintAndSetting
                    source: "image://MyProvider/Key_W255.png"
                    anchors.fill: parent
                    Text {
                        id: txtMaintAndSetting
                        text: menuScreenVM.txtMaintAndSetting
                        anchors.verticalCenterOffset: 0
                        anchors.horizontalCenterOffset: 33
                        anchors.bottomMargin: 0
                        font.family: "MS Gothic"
                        font.pixelSize:24
                        color: "#000000"
                        anchors.bottom: parent.bottom
                        anchors.centerIn: parent
                    }

                    Image {
                        x: 19
                        y: 15
                        width: 40
                        height: 40
                        source: "image://MyProvider/MenuButton_Icon_32_06.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            loaderContent.source ="MenuList.qml"
                            loaderBottomBar.source ="qrc:/BottomBar/BottomBarMenuList.qml"
                        }
                        onPressed: imgMaintAndSetting.source= "image://MyProvider/Key_W380_push.png"
                        onReleased:imgMaintAndSetting.source= "image://MyProvider/Key_W380.png"
                        onCanceled: imgMaintAndSetting.source= "image://MyProvider/Key_W380.png"
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        menuScreenVM.OnLoad();
        mainModel.onChangeLanguage.connect(updateText);
        console.log("scale_factor: " + appWindow.scale_factor);
        console.log("width: " + appWindow.width);
        console.log("height: " + appWindow.height);
        updateText();
    }

    function updateText() {
        console.log("update text on Menu screen");
        menuScreenVM.OnChangeLanguage();
        txtAdjustRegisteredProduct.text = menuScreenVM.txtAdjustRegisteredProduct
        txtControlPanel.text = menuScreenVM.txtControlPanel
        txtDisplayProductList.text = menuScreenVM.txtDisplayProductList
        txtHistory.text = menuScreenVM.txtHistory
        txtLanguage.text = menuScreenVM.txtLanguage
        txtMaintAndSetting.text = menuScreenVM.txtMaintAndSetting
        txtOpeCheck.text = menuScreenVM.txtOpeCheck
        txtStatsControl.text = menuScreenVM.txtStatsControl
        txtRegisterNewProduct.text = menuScreenVM.txtRegisterNewProduct
        txtUsbMemory.text = menuScreenVM.txtUsbMemory
    }
}
