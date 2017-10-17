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
    case ScreenId::MenuV1:
      ret = PageId::MenuV1;
      break;
    case ScreenId::SettingParamV1:
      ret = PageId::SettingParamV1;
      break;
    case ScreenId::SettingParamV2:
      ret = PageId::SettingParamV2;
      break;
    case ScreenId::EvalRJStart:
      ret = PageId::EvalRJStart;
      break;
    case ScreenId::EvalRJ:
      ret = PageId::EvalRJ;
      break;
    case ScreenId::EvalRJEnd:
      ret = PageId::EvalRJEnd;
      break;
    case ScreenId::TestFramework:
        ret = PageId::TestFramework;
        break;
    case ScreenId::IntegrationV4:
        ret = PageId::IntegrationV4;
        break;
    case ScreenId::IntegrationV3:
      ret = PageId::IntegrationV3;
      break;
    case ScreenId::IntegrationV2:
      ret = PageId::IntegrationV2;
      break;
    case ScreenId::Integration:
      ret = PageId::Integration;
      break;
    case ScreenId::ZoomLine4V:
      ret = PageId::ZoomLine4V;
      break;
    case ScreenId::ZoomLine3V:
      ret = PageId::ZoomLine3V;
      break;
    case ScreenId::ZoomLine2V:
      ret = PageId::ZoomLine2V;
      break;
    case ScreenId::ZoomLine:
      ret = PageId::ZoomLine;
      break;
    case ScreenId::MenuList3V:
      ret = PageId::MenuList3V;
      break;
    case ScreenId::MenuListNew:
      ret = PageId::MenuListNew;
      break;
    case ScreenId::MenuList:
      ret = PageId::MenuList;
      break;
    case ScreenId::XRayQImage:
      ret = PageId::XRayQImage;
      break;
    case ScreenId::XRay:
      ret = PageId::XRay;
      break;
    case ScreenId::AccordionList2:
      ret = PageId::AccordionList2;
      break;
    case ScreenId::ScreenTestControl:
      ret = PageId::ScreenTestControl;
      break;
    case ScreenId::TestAccordionList:
      ret = PageId::TestAccordionList;
      break;
    case ScreenId::TestSliderControl:
      ret = PageId::TestSliderControl;
      break;
    case ScreenId::TestWheelControl:
      ret = PageId::TestWheelControl;
      break;
    case ScreenId::CW:
      ret = PageId::CW;
      break;
    case ScreenId::ParameterSetting:
      ret = PageId::ParameterSetting;
      break;
    case ScreenId::ParameterSettingV2:
      ret = PageId::ParameterSettingV2;
      break;
    case ScreenId::XbarRS_NewChart:
        ret = PageId::XbarRS_NewChart;
        break;
    case ScreenId::XbarRSV4:
        ret = PageId::XbarRSV4;
        break;
    case ScreenId::XbarRSV3:
        ret = PageId::XbarRSV3;
        break;
    case ScreenId::XbarRSV2:
        ret = PageId::XbarRSV2;
        break;
    case ScreenId::XbarRS:
        ret = PageId::XbarRS;
        break;
    case ScreenId::InternalStatusMonitor:
        ret = PageId::InternalStatusMonitor;
        break;

    case ScreenId::InvalidLine:
        ret = PageId::InvalidLine;
        break;
    case ScreenId::InvalidLineV2:
        ret = PageId::InvalidLineV2;
        break;
    case ScreenId::GPnlMainAdjustTimingTbl:
        ret = PageId::GPnlMainAdjustTimingTbl;
        break;
    case ScreenId::GPnlMainAdjustTimingTblV2:
        ret = PageId::GPnlMainAdjustTimingTblV2;
        break;
    case ScreenId::SensCorrStart:
        ret = PageId::SensCorrStart;
        break;
    case ScreenId::SensCorrStep:
        ret = PageId::SensCorrStep;
        break;
    case ScreenId::SensCorrInputWeight:
        ret = PageId::SensCorrInputWeight;
        break;

    case ScreenId::DynamicCorrection:
        ret = PageId::DynamicCorrection;
        break;
    case ScreenId::InputMasterWork:
        ret = PageId::InputMasterWork;
        break;
    case ScreenId::FillingAmount:
        ret = PageId::FillingAmount;
        break;
    case ScreenId::DateTimeChange:
        ret = PageId::DateTimeChange;
        break;
    case ScreenId::TestTheme:
        ret = PageId::TestTheme;
        break;
    case ScreenId::GetPathReplace:
        ret = PageId::GetPathReplace;
        break;
    case ScreenId::Oee:
        ret = PageId::Oee;
        break;

    case ScreenId::ErrorAlarm:
        ret=PageId::ErrorAlarm;
        break;
    default:
        ret = PageId::ProductionV1;
        break;
    }
  return ret;
}

int ScreenMng::GetSourcePage(PageId id, QString& screenSource) {
  switch (id) {
    case PageId::Production:
        screenSource = "qrc:/Production/Production.qml";
        break;
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
    case PageId::MenuV1:
      screenSource = "qrc:/MenuScreen/Menu.qml";
      break;
    case PageId::SettingParamV1:
      screenSource = "qrc:/ParameterSetting/ParameterSetting.qml";
      break;
    case PageId::SettingParamV2:
      screenSource = "qrc:/ParameterSetting/ParameterSettingv2.qml";
      break;
    case PageId::EvalRJStart:
      screenSource = "qrc:/EvalRJ/EvalRJStart.qml";
      break;
    case PageId::EvalRJ:
      screenSource = "qrc:/EvalRJ/EvalRJ.qml";
      break;
    case PageId::EvalRJEnd:
      screenSource = "qrc:/EvalRJ/EvalRJEnd.qml";
      break;
    case PageId::TestFramework:
        screenSource = "qrc:/TestFramework/TestFramework.qml";
        break;
    case PageId::IntegrationV4:
        screenSource = "qrc:/Integration/Integration_ver4.qml";
        break;
    case PageId::IntegrationV3:
        screenSource = "qrc:/Integration/Integration_ver3.qml";
        break;
    case PageId::IntegrationV2:
        screenSource = "qrc:/Integration/Integration_ver2.qml";
        break;
    case PageId::Integration:
        screenSource = "qrc:/Integration/Integration.qml";
        break;
    case PageId::ZoomLine4V:
        screenSource = "qrc:/ZoomLine/ZoomLine4V.qml";
        break;
    case PageId::ZoomLine3V:
        screenSource = "qrc:/ZoomLine/ZoomLine3V.qml";
        break;
    case PageId::ZoomLine2V:
        screenSource = "qrc:/ZoomLine/ZoomLine2V.qml";
        break;
    case PageId::ZoomLine:
        screenSource = "qrc:/ZoomLine/ZoomLine.qml";
        break;

    case PageId::XbarRS_NewChart:
        screenSource = "qrc:/XBarRS/XbarRS_NewChart.qml";
        break;
    case PageId::XbarRSV4:
        screenSource = "qrc:/XBarRS/XBarRS_ver4.qml";
        break;
    case PageId::XbarRSV3:
        screenSource = "qrc:/XBarRS/XBarRS_ver3.qml";
        break;
    case PageId::XbarRSV2:
        screenSource = "qrc:/XBarRS/XBarRS_ver2.qml";
        break;
    case PageId::XbarRS:
        screenSource = "qrc:/XBarRS/XBarRS.qml";
        break;

    case PageId::MenuList:
        screenSource = "qrc:/MenuScreen/MenuList.qml";
        break;
    case PageId::MenuList3V:
        screenSource = "qrc:/MenuScreen/MenuList3V.qml";
        break;
    case PageId::MenuListNew:
        screenSource = "qrc:/MenuScreen/MenuListNew.qml";
        break;
    case PageId::XRayQImage:
        screenSource = "qrc:/XRay/XRayQImage.qml";
        break;
    case PageId::XRay:
        screenSource = "qrc:/XRay/XRay.qml";
        break;

    case PageId::AccordionList2:
        screenSource = "qrc:/Test/AccordionList2.qml";
        break;
    case PageId::ScreenTestControl:
        screenSource = "qrc:/Test/ScreenTestControl.qml";
        break;
    case PageId::TestAccordionList:
        screenSource = "qrc:/Test/TestAccordionList.qml";
        break;
    case PageId::TestSliderControl:
        screenSource = "qrc:/Test/TestSliderControl.qml";
        break;
    case PageId::TestWheelControl:
        screenSource = "qrc:/Test/TestWheelControl.qml";
        break;

    case PageId::CW:
        screenSource = "qrc:/CW/CW.qml";
        break;
    case PageId::ParameterSetting:
        screenSource = "qrc:/ParameterSetting/ParameterSetting.qml";
        break;
    case PageId::ParameterSettingV2:
        screenSource = "qrc:/ParameterSetting/ParameterSettingv2.qml";
        break;
    case PageId::InternalStatusMonitor:
        screenSource = "qrc:/StatusMonitor/InternalStatusMonitor.qml";
        break;
    case PageId::InvalidLine:
        screenSource = "qrc:/InvalidLine/InvalidLine.qml";
        break;
    case PageId::InvalidLineV2:
        screenSource = "qrc:/InvalidLine/InvalidLine_ver2.qml";
        break;
    case PageId::GPnlMainAdjustTimingTbl:
      screenSource = "qrc:/AdjustTiming/GPnlMaintAdjustTimingTbl.qml";
      break;
    case PageId::GPnlMainAdjustTimingTblV2:
      screenSource = "qrc:/AdjustTiming/GPnlMainAdjustTimingTbl_v2.qml";
      break;
    case PageId::SensCorrStart:
        screenSource = "qrc:/SensitiveCorrection/SensCorrStart.qml";
        break;
    case PageId::SensCorrStep:
        screenSource = "qrc:/SensitiveCorrection/SensCorrStep.qml";
        break;
    case PageId::SensCorrInputWeight:
      screenSource = "qrc:/SensitiveCorrection/SensCorrInputWeight.qml";
      break;
    case PageId::DynamicCorrection:
        screenSource = "qrc:/DynamicCorrection/DynamicCorrection.qml";
        break;
    case PageId::InputMasterWork:
      screenSource = "qrc:/DynamicCorrection/InputMasterWork.qml";
      break;
    case PageId::FillingAmount:
      screenSource = "qrc:/FillingAmount/FillingAmount.qml";
      break;
    case PageId::DateTimeChange:
      screenSource = "qrc:/Control/dateTime/DateTimeChange.qml";
      break;
    case PageId::TestTheme:
        screenSource = "qrc:/AppTheme/TestTheme.qml";
        break;
    case PageId::GetPathReplace:
      screenSource = "qrc:/SetReplacePathScreen/GetPathReplace.qml";
      break;
    case PageId::Oee:
        screenSource = "qrc:/Oee/Oee.qml";
        break;
    case PageId::ErrorAlarm:
        screenSource="qrc:/ErrorAlarm/ErrorAlarm.qml";
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
    case BottomBarId::BottomBarParamSettingV2:
      bottomBarSource = "qrc:/BottomBar/BottomBarParameterSettingv2.qml";
      break;
    case BottomBarId::BottomBarIOMonitor:
      bottomBarSource = "qrc:/BottomBar/BottomBarIOMonitor.qml";
      break;
    case BottomBarId::BottomBarAdjustTiming:
      bottomBarSource = "qrc:/BottomBar/BottomBarAdjustTimingVer4.qml";
      break;
    case BottomBarId::BottomBarWizard:
        bottomBarSource = "qrc:/BottomBar/BottomBarWizard.qml";
        break;

    case BottomBarId::TestBottomBar:
        bottomBarSource = "qrc:/BottomBar/testBottomBar.qml";
        break;
    case BottomBarId::BottomBarInternalStatusMonitor:
        bottomBarSource = "qrc:/BottomBar/BottomBarInternalStatusMonitor.qml";
        break;

    case BottomBarId::BottomBarInvalid:
        bottomBarSource = "qrc:/BottomBar/BottomBarInvalid.qml";
        break;

    case BottomBarId::BottomBarSensCorr:
        bottomBarSource = "qrc:/BottomBar/BottomBarSensCorr.qml";
        break;
    case BottomBarId::BottomBarBase:
        bottomBarSource = "qrc:/BottomBar/BottomBarBase.qml";
        break;
    case BottomBarId::BottomBarMenuList:
        bottomBarSource = "qrc:/BottomBar/BottomBarMenuList.qml";
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
      statusBarSource = "qrc:/StatusBar/ErrorAlarmStatusBar.qml";
      break;
    case StatusBarId::IOMonitorStatusBar:
      statusBarSource = "qrc:/StatusBar/IOMonitorStatusBar.qml";
      break;
    case StatusBarId::AdjustTimingStatusBar:
        statusBarSource = "qrc:/StatusBar/StatusBarAdjustTimingVer4.qml";
        break;

    case StatusBarId::StatusBarV2:
        statusBarSource = "qrc:/StatusBar/StatusBar_ver2.qml";
        break;
    case StatusBarId::testStatusBar:
        statusBarSource = "qrc:/StatusBar/testStatusBar.qml";
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
int ScreenMng::TrackBackScreen(int numberBackScreen) {
    int currentIndex = screenTrack.count() - 1;
    if(currentIndex < numberBackScreen) {
        return 1;
    }
    for (int i = 0; i < numberBackScreen; i++) {
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
    MainWindow* mainWindow = MainWindow::GetInstance();
    if (id == currentStatusBar || mainWindow->getErrorAlarmMode()) {
      return 0;
    }
    currentStatusBar = id;
    QString statusbarSource;
    GetSourceStatusBar(id, statusbarSource);
    mainWindow->onChangeStatusBar(statusbarSource);
    return 0;
}

int ScreenMng::RefreshScreen() {
  //get source screen
  PageId pageId = GetPage(currentScreen);
  qDebug() << "change pageId : " << pageId;
  QString screenSource;
  GetSourcePage(pageId, screenSource);
  MainWindow* mainWindow = MainWindow::GetInstance();
  mainWindow->onChangeScreen(screenSource);
  return 0;
}



