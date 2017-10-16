#include "screenmng.h"
#include "mainwindow.h"
ScreenMng* ScreenMng::instance = 0;

ScreenMng::ScreenMng()
{
    currentScreen = ScreenId::None;
    currentBottomBar = BottomBarId::None;
    currentStatusBar = StatusBarId::None;
}

ScreenMng* ScreenMng::GetInstance(){
    if (!instance) {
        instance = new ScreenMng();
    }
    return instance;
}

ScreenMng::ScreenId ScreenMng::CurrentScreen() {
    return currentScreen;
}

//void ScreenMng::setCurrentScreen(ScreenId id) {
//    _currentScreen = (int)id;
//}

ScreenMng::PageId ScreenMng::GetPage(ScreenId id) {
    PageId ret = PageId::None;
    switch (id) {
    case ScreenId::ProductionV1:
        ret = PageId::ProductionV1;
        break;
    case ScreenId::ProductionV2:
        ret = PageId::ProductionV2;
        break;
    case ScreenId::IOMonitor:
        ret = PageId::IOMonitor;
        break;
    case ScreenId::AdjustTimingV1:
        ret = PageId::AdjustTimingV1;
        break;
    case ScreenId::AdjustTimingV2:
        ret = PageId::AdjustTimingV2;
        break;
    case ScreenId::Menu:
        ret = PageId::Menu;
        break;
    case ScreenId::SettingParamV1:
        ret = PageId::SettingParamV1;
        break;
    case ScreenId::SettingParamV2:
        ret = PageId::SettingParamV2;
        break;
    default:
        ret = PageId::ProductionV1;
        break;
    }
    return ret;
}

int ScreenMng::GetSourcePage(PageId id, QString& screenSource) {
    switch (id) {
    case PageId::ProductionV1:
        screenSource = "qrc:/Production/ProductionScreen_ver3.qml";
        break;
    case PageId::ProductionV2:
        screenSource = "qrc:/Production/ProductVer2Screen.qml";
        break;
    case PageId::IOMonitor:
        screenSource = "qrc:/IOMonitor/IOMonitor.qml";
        break;
    case PageId::AdjustTimingV1:
        screenSource = "qrc:/AdjustTiming/AdjustTimingVer3.qml";
        break;
    case PageId::AdjustTimingV2:
        screenSource = "qrc:/AdjustTiming/AdjustTimingVer4.qml";
        break;
    case PageId::Menu:
        screenSource = "qrc:/MenuScreen/Menu.qml";
        break;
    case PageId::SettingParamV1:
        screenSource = "qrc:/ParameterSetting/ParameterSetting.qml";
        break;
    case PageId::SettingParamV2:
        screenSource = "qrc:/ParameterSetting/ParameterSettingv2.qml";
        break;
    default:
        screenSource = "qrc:/Production/ProductVer2Screen.qml";
        break;
    }
    return 0;
}

int ScreenMng::GetSourceBottomBar(BottomBarId id, QString& bottomBarSource){
    switch (id) {
    case BottomBarId::BottomBarMainPage:
        bottomBarSource = "qrc:/BottomBar/BottomBarMainPage.qml";
        break;
    case BottomBarId::BottomBarBackNextCancel:
        bottomBarSource = "qrc:/BottomBar/BottomBarCancelBackNext.qml";
        break;
    case BottomBarId::BottomBarMenu:
        bottomBarSource = "qrc:/BottomBar/BottomBarMenu.qml";
        break;
    case BottomBarId::BottomBarParamSetting:
        bottomBarSource = "qrc:/BottomBar/BottomBarParameterSetting.qml";
        break;
    case BottomBarId::BottomBarIOMonitor:
        bottomBarSource = "qrc:/BottomBar/BottomBarIOMonitor.qml";
        break;
    case BottomBarId::BottomBarAdjustTiming:
        bottomBarSource = "qrc:/BottomBar/BottomBarAdjustTimingVer4.qml";
        break;
    default:
        bottomBarSource = "qrc:/BottomBar/BottomBarMainPage.qml";
        break;
    }
    return 0;
}

int ScreenMng::GetSourceStatusBar(StatusBarId id, QString& statusBarSource){
    switch (id) {
    case StatusBarId::NormalStatusBar:
        statusBarSource = "qrc:/StatusBar/StatusBar.qml";
        break;
    case StatusBarId::ErrorStatusBar:
        statusBarSource = "qrc:/StatusBar/StatusBar_ver2.qml";
        break;
    case StatusBarId::IOMonitorStatusBar:
        statusBarSource = "qrc:/StatusBar/IOMonitorStatusBar.qml";
        break;
    case StatusBarId::AdjustTimingStatusBar:
        statusBarSource = "qrc:/StatusBar/StatusBarAdjustTimingVer4.qml";
        break;
    default:
        statusBarSource = "qrc:/StatusBar/StatusBar.qml";
        break;
    }
    return 0;
}

//    int ScreenMng::GetScreenTrackIndex(ScreenId id, int& numberBack);
//int ScreenMng::GetCurrentScreen(ScreenId &currentScreen) {
//    currentScreen = _currentScreen;
//    return 0;
//}

int ScreenMng::TrackBackScreen(int numberBack) {
    int currentIndex = screenTrack.count() - 1;
    if(currentIndex < numberBack) {
        return 1;
    }
    for (int i = 0; i < numberBack; i++) {
        screenTrack.removeLast();
    }
    ScreenId desScreen = screenTrack.back();
    currentScreen = desScreen;
    //get source screen
    PageId pageId = GetPage(desScreen);
    qDebug() << "change pageId : " << pageId;
    QString screenSource;
    GetSourcePage(pageId, screenSource);
    MainWindow* mainWindow = MainWindow::GetInstance();
    mainWindow->onChangeScreen(screenSource);
    return 0;
}

int ScreenMng::ChangeScreen(ScreenId id) {
    //check id
    if (id == currentScreen) {
        return 0;
    }
    currentScreen = id;
    //save track
    screenTrack.append(id);

    //get source screen
    PageId pageId = GetPage(id);
    qDebug() << "change pageId : " << pageId;
    QString screenSource;
    GetSourcePage(pageId, screenSource);
    MainWindow* mainWindow = MainWindow::GetInstance();
    mainWindow->onChangeScreen(screenSource);
    return 0;
}

int ScreenMng::ChangeBottomBar(BottomBarId id){
    //check id
    if (id == currentBottomBar) {
        return 0;
    }
    currentBottomBar = id;

    qDebug() << "ScreenMng - ChangeBottomBar id: " << id;
    MainWindow* mainWindow = MainWindow::GetInstance();
    QString bottomBarSource;
    GetSourceBottomBar(id, bottomBarSource);
    qDebug() << "bottomBarSource: " << bottomBarSource ;
    mainWindow->onChangeBottomBar(bottomBarSource);
    return 0;
}

int ScreenMng::ChangeStatusBar(StatusBarId id){
    //check id
    if (id == currentStatusBar) {
        return 0;
    }
    currentStatusBar = id;

    MainWindow* mainWindow = MainWindow::GetInstance();
    QString statusbarSource;
    GetSourceStatusBar(id, statusbarSource);
    mainWindow->onChangeStatusBar(statusbarSource);
    return 0;
}


