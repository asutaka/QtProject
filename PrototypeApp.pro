TEMPLATE = app

QT += qml quick widgets
QT += network
QT += sql

SOURCES += main.cpp \
    startwindow.cpp \
    StatusBar/statusbar.cpp \
    mainwindow.cpp \
    AdjustTiming/gpnlmaintadjusttimingtbl.cpp \
    AdjustTiming/resultimportline.cpp \
    AdjustTiming/resultimportlinecolor.cpp \
    Control/drawControlBase/drawcontrolbase.cpp \
    Control/drawControlBase/drawcontrolbase_ver2.cpp \
    Control/drawControlBase/drawcontrolbase_ver3.cpp \
    Control/lineImage/lineimage.cpp \
    DynamicCorrection/dynamiccorrection.cpp \
    DynamicCorrection/inputmasterwork.cpp \
    InvalidLine/invalidline.cpp \
    MenuScreen/menu.cpp \
    MenuScreen/menulist.cpp \
    MenuScreen/menulistnew.cpp \
    Production/production.cpp \
    SensitiveCorrection/senscorrstep.cpp \
    TableAdjustLineUC/adjustline.cpp \
    TableAdjustLineUC/tableadjustline.cpp \
    XBarRS/xbarrs.cpp \
    XBarRS/xbarrs_ver2.cpp \
    XBarRS/xbarrs_ver3.cpp \
    XBarRS/xbarrs_ver4.cpp \
    ZoomLine/zoomline.cpp \
    ZoomLine/zoomline2v.cpp \
    ZoomLine/zoomline3v.cpp \
    ZoomLine/zoomline4v.cpp \
    Integration/integration.cpp \
    XRay/xray.cpp \
    Integration/integration_ver2.cpp \
    Control/drawControlBase/drawcontrolbase_ver4.cpp \
    Control/drawControlBase/drawcontrolbase_ver5.cpp \
    Integration/integration_ver3.cpp \
    MenuScreen/menulist3v.cpp \
    Control/drawControlBase/drawcontrolbase_ver6.cpp \
    CW/cw.cpp \
    TableAdjustLineUC/tableadjustline_ver2.cpp \
    TableAdjustLineUC/adjustline_ver2.cpp \
    InvalidLine/invalidline_ver2.cpp \
    StatusBar/statusbar_ver2.cpp \
    TestFramework/testframework.cpp \
    FillingAmount/fillingamount.cpp \
    Control/drawControlBase/drawcontrolbase_ver7.cpp \
    Integration/integartion_ver4.cpp \
    Control/bufferedGraphicsPanel/bufferedgraphicspanel.cpp \
    imgprovider.cpp\
    AppTheme/appthememanager.cpp \
    AppTheme/themescreen.cpp \
    XBarRS/xbarrs_newchart.cpp \
    AdjustTiming/adjusttimingver3.cpp \
    SetReplacePathScreen/getpathreplace.cpp \
    AdjustTiming/adjusttimingver4.cpp \
    globals.cpp \
    ProdScreenBase/productscreenbasevm.cpp \
    Production/productionscreencontrol_ver3.cpp \
    Production/productionscreenvm_ver3.cpp \
    ParameterSetting/parametersetting_listmodel.cpp \
    ParameterSetting/parametersettingmodel.cpp \
    ParameterSetting/parametersettingvm.cpp \
    Production/mainproductionver2vm.cpp \
    Production/productver2screen.cpp \
    IOMonitor/iomonitorscreenvm.cpp \
    Control/switchControl/switchcontrolver5.cpp \
    screenmng.cpp \
    ParameterSetting/bottombarparamsettingvm.cpp \
    ParameterSetting/menubarsubcontrolvm.cpp \
    AdjustTiming/adjusttimingver4_vm.cpp \
    IOMonitor/iomonitor.cpp \
    directconnection.cpp \
    directconnectionfactory.cpp \
    Integration/integartionvm.cpp \
    FillingAmount/fillingamountvm.cpp \
    ZoomLine/zoomlinevm.cpp \
    XBarRS/xbar_newchartvm.cpp \
    XRay/xrayvm.cpp \
    Oee/oeevm.cpp \
    EvalRJ/evalrjvm.cpp \
    StatusMonitor/internalstatusmonitorvm.cpp \
    InvalidLine/invalidlinevm.cpp \
    AppTheme/appthemevm.cpp \
    SetReplacePathScreen/setreplacepathscreenvm.cpp \
    ErrorAlarm/erroralarmvm.cpp \
    Control/dateTime/datetimevm.cpp \
    Test/testvm.cpp \
    MenuScreen/menulistvm.cpp \
    fontfactory.cpp \
    BottomBar/bottombariomonitorvm.cpp \
    StatusBar/iomonitorstatusbarvm.cpp \
    Control/model/treeviewmodel.cpp \
    guiresinfomng.cpp \
    Screen/screeninfo.cpp \
    Screen/iscreeninfo_listmodel.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
deployment.files += Data/NewMasterSql.sqlite
deployment.files += Data/byteArray2.data
deployment.path =/assets
INSTALLS += deployment

HEADERS += \
    startwindow.h \
    StatusBar/statusbar.h \
    mainwindow.h \
    AdjustTiming/gpnlmaintadjusttimingtbl.h \
    AdjustTiming/resultimportline.h \
    AdjustTiming/resultimportlinecolor.h \
    Control/drawControlBase/drawcontrolbase.h \
    Control/drawControlBase/drawcontrolbase_ver2.h \
    Control/drawControlBase/drawcontrolbase_ver3.h \
    Control/lineImage/lineimage.h \
    DynamicCorrection/dynamiccorrection.h \
    DynamicCorrection/inputmasterwork.h \
    Integration/integration.h \
    InvalidLine/invalidline.h \
    MenuScreen/menu.h \
    MenuScreen/menulist.h \
    MenuScreen/menulistnew.h \
    Production/production.h \
    SensitiveCorrection/senscorrstep.h \
    TableAdjustLineUC/adjustline.h \
    TableAdjustLineUC/tableadjustline.h \
    XBarRS/xbarrs.h \
    XBarRS/xbarrs_ver2.h \
    XBarRS/xbarrs_ver3.h \
    XBarRS/xbarrs_ver4.h \
    ZoomLine/zoomline.h \
    ZoomLine/zoomline2v.h \
    ZoomLine/zoomline3v.h \
    ZoomLine/zoomline4v.h \
    XRay/xray.h \
    Integration/integration_ver2.h \
    Control/drawControlBase/drawcontrolbase_ver4.h \
    Control/drawControlBase/drawcontrolbase_ver5.h \
    Integration/integration_ver3.h \
    MenuScreen/menulist3v.h \
    Control/drawControlBase/drawcontrolbase_ver6.h \
    CW/cw.h \
    TableAdjustLineUC/tableadjustline_ver2.h \
    TableAdjustLineUC/adjustline_ver2.h \
    InvalidLine/invalidline_ver2.h \
    StatusBar/statusbar_ver2.h \
    TestFramework/testframework.h \
    FillingAmount/fillingamount.h \
    Control/drawControlBase/drawcontrolbase_ver7.h \
    Integration/integartion_ver4.h \
    Control/bufferedGraphicsPanel/bufferedgraphicspanel.h \
    IOMonitor/iomonitor.h \
    imgprovider.h\
    AppTheme/apptheme.h \
    AppTheme/appthemeblack.h \
    AppTheme/appthemebluecerulean.h \
    AppTheme/appthemeblueicy.h \
    AppTheme/appthemebluencs.h \
    AppTheme/appthemebrownsand.h \
    AppTheme/appthemedark.h \
    AppTheme/appthemehighcontrast.h \
    AppTheme/appthememanager.h \
    AppTheme/appthemeqt.h \
    AppTheme/appthemesystem.h \
    AppTheme/themescreen.h \
    XBarRS/xbarrs_newchart.h \
    AdjustTiming/adjusttimingver3.h \
    SetReplacePathScreen/getpathreplace.h \
    AdjustTiming/adjusttimingver4.h \
    globals.h \
    ProdScreenBase/productscreenbasevm.h \
    Production/productionscreencontrol_ver3.h \
    Production/productionscreenvm_ver3.h \
    ParameterSetting/parametersetting_listmodel.h \
    ParameterSetting/parametersettingmodel.h \
    ParameterSetting/parametersettingvm.h \
    Production/mainproductionver2vm.h \
    Production/productver2screen.h \
    IOMonitor/iomonitorscreenvm.h \
    Control/switchControl/switchcontrolver5.h \
    screenmng.h\
    Control/enumcontrol.h \
    ParameterSetting/bottombarparamsettingvm.h \
    ParameterSetting/menubarsubcontrolvm.h \
    AdjustTiming/adjusttimingver4_vm.h \
    directconnection.h \
    directconnectionfactory.h \
    Integration/integartionvm.h \
    FillingAmount/fillingamountvm.h \
    ZoomLine/zoomlinevm.h \
    XBarRS/xbar_newchartvm.h \
    XRay/xrayvm.h \
    Oee/oeevm.h \
    EvalRJ/evalrjvm.h \
    StatusMonitor/internalstatusmonitorvm.h \
    InvalidLine/invalidlinevm.h \
    AppTheme/appthemevm.h \
    SetReplacePathScreen/setreplacepathscreenvm.h \
    ErrorAlarm/erroralarmvm.h \
    Control/dateTime/datetimevm.h \
    Test/testvm.h \
    MenuScreen/menulistvm.h \
    fontfactory.h \
    BottomBar/bottombariomonitorvm.h \
    StatusBar/iomonitorstatusbarvm.h \
    Control/model/treeviewmodel.h \
    guiresinfomng.h \
    Screen/screeninfo.h \
    Screen/iscreeninfo_listmodel.h

SUBDIRS += \
    SimulatorServer/MultiServer.pro \
    windeployqt_QtTool/windeployqt.pro \
    Lang/Lang.pro \
    LangGenerator_QtTool/LangGeneratorQt.pro \
    SimulatorServer/MultiServer.pro \
    windeployqt_QtTool/windeployqt.pro

DISTFILES += \
    Images/MS Gothic.ttf \
    RunAppOnLinux/run_PrototypeApp.sh \
    CW/CW.qml \
    AppTheme/TestTheme.qml \
    ParameterSetting/ParameterSetting.qml \
    StatusMonitor/InternalStatusMonitor.qml \
    BottomBar/BottomBarInternalStatusMonitor.qml

CONFIG += resources_big

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_EXTRA_LIBS = \
        $$PWD/Build/Android/BuildLang/android-build/libs/armeabi-v7a/libLang.so

    unix:!macx: LIBS += -L$$PWD/Build/Android/BuildLang/android-build/libs/armeabi-v7a/ -lLang
}




win32 {

    ## Windows common build here

    !contains(QMAKE_TARGET.arch, x86_64) {
        message("x86 build")
        win32:CONFIG(release, debug|release): LIBS += -L$$PWD/Build/Windows/release/ -lLang
        else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/Build/Windows/debug/ -lLang
    } else {
        message("x86_64 build")
        win32:CONFIG(release, debug|release): LIBS += -L$$PWD/Build/Windows64/release/ -lLang
        else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/Build/Windows64/debug/ -lLang
    }
}

#win32:CONFIG(release, debug|release): LIBS += -L$$PWD/Build/Windows/release/ -lLang
#else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/Build/Windows/debug/ -lLang
#else:win64:CONFIG(release, debug|release): LIBS += -L$$PWD/Build/Windows64/release/ -lLang
#else:win64:CONFIG(debug, debug|release): LIBS += -L$$PWD/Build/Windows64/debug/ -lLang
unix:!macx: LIBS += -L$$PWD/Build/Linux/ -lLang

INCLUDEPATH += $$PWD/Lang
DEPENDPATH += $$PWD/Lang

DEFINES += STUP_DISPLAY_DATA
