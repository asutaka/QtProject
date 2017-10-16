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
        ProductionV1,
        ProductionV2,
        IOMonitor,
        AdjustTimingV1,
        AdjustTimingV2,
        Menu,
        SettingParamV1,
        SettingParamV2,
    };
    Q_ENUM(ScreenId)

    enum class PageId
    {
        None = 0,
        ProductionV1,
        ProductionV2,
        IOMonitor,
        AdjustTimingV1,
        AdjustTimingV2,
        Menu,
        SettingParamV1,
        SettingParamV2,
    };
    Q_ENUM(PageId)

    enum class BottomBarId
    {
        None = 0,
        BottomBarMainPage,
        BottomBarBackNextCancel,
        BottomBarMenu,
        BottomBarParamSetting,
        BottomBarIOMonitor,
        BottomBarAdjustTiming,
    };

    Q_ENUM(BottomBarId)

    enum class StatusBarId
    {
        None = 0,
        NormalStatusBar,
        ErrorStatusBar,
        IOMonitorStatusBar,
        AdjustTimingStatusBar,
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

    int TrackBackScreen(int numberBack);
    int ChangeScreen(ScreenId id);
    int ChangeBottomBar(BottomBarId id);
    int ChangeStatusBar(StatusBarId id);

private:
    ScreenMng();

};

#endif // SCREENMNG_H
