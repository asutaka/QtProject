#ifndef SCREENMNG_H
#define SCREENMNG_H
#include <QObject>

class ScreenMng : public QObject
{
  Q_OBJECT
  Q_PROPERTY(ScreenId currentScreen READ CurrentScreen)

public:
    enum class ScreenId
    {
        None = 0,
        Production,
        ProductionV1,
        ProductionV2,
        IOMonitor,
        AdjustTimingV1,
        AdjustTimingV2,
        SettingParamV1,
        SettingParamV2,
        EvalRJStart,
        EvalRJ,
        EvalRJEnd,
        TestFramework,
        IntegrationV4,
        IntegrationV3,
        IntegrationV2,
        Integration,
        ZoomLine4V,
        ZoomLine3V,
        ZoomLine2V,
        ZoomLine,
        XbarRS_NewChart,
        XbarRS,
        XbarRSV2,
        XbarRSV3,
        XbarRSV4,
        MenuV1,
        MenuList,
        MenuList3V,
        MenuListNew,
        XRayQImage,
        XRay,
        AccordionList2,
        ScreenTestControl,
        TestAccordionList,
        TestSliderControl,
        TestWheelControl,
        CW,
        ParameterSetting,
        ParameterSettingV2,
        InternalStatusMonitor,
        InvalidLine,
        InvalidLineV2,
        GPnlMainAdjustTimingTbl,
        GPnlMainAdjustTimingTblV2,
        SensCorrStart,
        SensCorrStep,
        SensCorrInputWeight,
        DynamicCorrection,
        InputMasterWork,
        FillingAmount,
        DateTimeChange,
        TestTheme,
        GetPathReplace,
        Oee,
        ErrorAlarm,
    };
    Q_ENUM(ScreenId)

    enum class PageId
    {
        None = 0,
        Production,
        ProductionV1,
        ProductionV2,
        IOMonitor,
        AdjustTimingV1,
        AdjustTimingV2,
        SettingParamV1,
        SettingParamV2,
        EvalRJStart,
        EvalRJ,
        EvalRJEnd,
        TestFramework,
        IntegrationV4,
        IntegrationV3,
        IntegrationV2,
        Integration,
        ZoomLine4V,
        ZoomLine3V,
        ZoomLine2V,
        ZoomLine,
        XbarRS_NewChart,
        XbarRS,
        XbarRSV2,
        XbarRSV3,
        XbarRSV4,
        MenuV1,
        MenuList,
        MenuList3V,
        MenuListNew,
        XRayQImage,
        XRay,
        AccordionList2,
        ScreenTestControl,
        TestAccordionList,
        TestSliderControl,
        TestWheelControl,
        CW,
        ParameterSetting,
        ParameterSettingV2,
        InternalStatusMonitor,
        InvalidLine,
        InvalidLineV2,
        GPnlMainAdjustTimingTbl,
        GPnlMainAdjustTimingTblV2,
        SensCorrStart,
        SensCorrStep,
        SensCorrInputWeight,
        DynamicCorrection,
        InputMasterWork,
        FillingAmount,
        DateTimeChange,
        TestTheme,
        GetPathReplace,
        Oee,
        ErrorAlarm,
    };
    Q_ENUM(PageId)

    enum class BottomBarId
    {
        None = 0,
        BottomBarMainPage,
        BottomBarBackNextCancel,
        BottomBarMenu,
        BottomBarParamSetting,
        BottomBarParamSettingV2,
        BottomBarIOMonitor,
        BottomBarAdjustTiming,
        BottomBarWizard,
        TestBottomBar,
        BottomBarInternalStatusMonitor,
        BottomBarInvalid,
        BottomBarSensCorr,
        BottomBarBase,
        BottomBarMenuList,
    };
    Q_ENUM(BottomBarId)

    enum class StatusBarId
    {
        None = 0,
        NormalStatusBar,
        ErrorStatusBar,
        IOMonitorStatusBar,
        AdjustTimingStatusBar,
        StatusBarV2,
        testStatusBar
    };
    Q_ENUM(StatusBarId)

private:
    static ScreenMng* instance;
    ScreenId currentScreen;
    BottomBarId currentBottomBar;
    StatusBarId currentStatusBar;
    QList<ScreenId> screenTrack;
public:

    static ScreenMng* GetInstance();
    ScreenId CurrentScreen();
    //    void setCurrentScreen(ScreenId id);
    PageId GetPage(ScreenId id);
    int GetSourcePage(PageId id, QString& screenSource);
    int GetSourceBottomBar(BottomBarId id, QString& bottomBarSource);
    int GetSourceStatusBar(StatusBarId id, QString& statusBarSource);
    //    int GetScreenTrackIndex(ScreenId id, int& numberBack);
    //    int GetCurrentScreen(ScreenId &currentScreen);

    int TrackBackScreen(int numberBackScreen);
    int ChangeScreen(ScreenId id);
    int ChangeBottomBar(BottomBarId id);
    int ChangeStatusBar(StatusBarId id);
    int RefreshScreen();

private:
  ScreenMng();

};

#endif // SCREENMNG_H
