#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QDebug>
#include <QQmlEngine>
#include <QQmlComponent>
#include <QQmlProperty>
#include "Integration/integration.h"
#include "Integration/integration_ver2.h"
#include "Integration/integration_ver3.h"
#include "StatusBar/statusbar.h"
#include "Production/production.h"
#include "Production/productionscreenvm_ver3.h"
#include "Production/productionscreencontrol_ver3.h"
#include "Production/productver2screen.h"
#include "Production/mainproductionver2vm.h"
#include "InvalidLine/invalidline.h"
#include "DynamicCorrection/inputmasterwork.h"
#include "DynamicCorrection/dynamiccorrection.h"
#include "ZoomLine/zoomline.h"
#include "XBarRS/xbarrs.h"
#include "XBarRS/xbarrs_ver2.h"
#include "XBarRS/xbarrs_ver3.h"
#include "XBarRS/xbarrs_ver4.h"
#include "XBarRS/xbarrs_newchart.h"
#include <QGuiApplication>
#include <QtQml/qqml.h>
#include <QQmlContext>
#include <QSettings>
#include <QDir>
#include "AdjustTiming/gpnlmaintadjusttimingtbl.h"
#include "AdjustTiming/adjusttimingver3.h"
#include "AdjustTiming/adjusttimingver4.h"
#include "AdjustTiming/adjusttimingver4_vm.h"
#include "SensitiveCorrection/senscorrstep.h"
#include "MenuScreen/menu.h"
#include "ZoomLine/zoomline2v.h"
#include "ZoomLine/zoomline3v.h"
#include "ZoomLine/zoomline4v.h"
#include "XRay/xray.h"
#include "XRay/xray_qimage.h"
#include "CW/cw.h"
#include "InvalidLine/invalidline_ver2.h"
#include "TestFramework/testframework.h"
#include "FillingAmount/fillingamount.h"
#include "Integration/integartion_ver4.h"
#include "Control/bufferedGraphicsPanel/bufferedgraphicspanel.h"
#include "IOMonitor/iomonitorscreenvm.h"
#include "IOMonitor/iomonitor.h"
#include "AppTheme/themescreen.h"
#include "imgprovider.h"
#include "SetReplacePathScreen/getpathreplace.h"
#include "globals.h"
#include "mainwindow.h"
#include "ParameterSetting/parametersettingvm.h"
#include "ParameterSetting/parametersetting_listmodel.h"
#include "Control/switchControl/switchcontrolver5.h"
#include "screenmng.h"
#include "AppTheme/appthememanager.h"
#include "Control/enumcontrol.h"
#include "ParameterSetting/parametersetting_listmodel.h"
#include "ParameterSetting/menubarsubcontrolvm.h"
#include "ParameterSetting/bottombarparamsettingvm.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QQmlContext* context = engine.rootContext();
    //Load config here
    QString configPath = QDir::toNativeSeparators(CONFIG_PATH);
    globals::settingsApp = new QSettings(configPath, QSettings::IniFormat);

    MainWindow* mainModel = MainWindow::GetInstance();
    ScreenMng* screenMng = ScreenMng::GetInstance();
    AppThemeManager* themeMng = AppThemeManager::GetInstance();

    context->setContextProperty("screenMng",screenMng);
    context->setContextProperty("themeMng",themeMng);
    context->setContextProperty("mainModel",mainModel);

    QString uriStr = "ControlApp";
    QByteArray ba = uriStr.toLatin1();
    const char* uri = ba.data();
    qmlRegisterType<MainWindow>(uri, 1, 0, "MainWindow");
    qmlRegisterType<StatusBar>(uri, 1, 0, "StatusBar");
    qmlRegisterType<Menu>(uri, 1, 0, "Menu");
    qmlRegisterType<Integration>(uri, 1, 0, "Integration");
    qmlRegisterType<Integration_ver2>(uri, 1, 0, "Integration_ver2");
    qmlRegisterType<Integration_ver3>(uri, 1, 0, "Integration_ver3");
    qmlRegisterType<Production>(uri, 1, 0, "Production");
    qmlRegisterType<ProductionScreenVM_ver3>(uri, 1, 0, "ProductionScreenVM_ver3");
    qmlRegisterType<ProductionScreenControl_ver3>(uri, 1, 0, "ProductionScreenControl_ver3");
//    qmlRegisterType<SubProdVer2Control>(uri, 1, 0, "SubProdVer2Control");
//    qmlRegisterType<SubProdXbarControl>(uri, 1, 0, "SubProdXbarControl");
    qmlRegisterType<MainProductionVer2VM>(uri, 1, 0, "MainProductionVer2VM");
    qmlRegisterType<ProductVer2Screen>(uri, 1, 0, "ProductVer2Screen");
    qmlRegisterType<GPnlMaintAdjustTimingTbl>(uri, 1, 0, "GPnlMaintAdjustTimingTbl");
    qmlRegisterType<AdjustTimingVer3>(uri, 1, 0, "AdjustTimingVer3");
    qmlRegisterType<AdjustTimingVer4>(uri, 1, 0, "AdjustTimingVer4");
    qmlRegisterType<AdjustTimingVer4_VM>(uri, 1, 0, "AdjustTimingVer4_VM");
    qmlRegisterType<InvalidLine>(uri, 1, 0, "InvalidLine");
    qmlRegisterType<InputMasterWork>(uri, 1, 0, "InputMasterWork");
    qmlRegisterType<DynamicCorrection>(uri, 1, 0, "DynamicCorrection");
    qmlRegisterType<ZoomLine>(uri, 1, 0, "ZoomLine");
    qmlRegisterType<ZoomLine2V>(uri, 1, 0, "ZoomLine2V");
    qmlRegisterType<ZoomLine3V>(uri, 1, 0, "ZoomLine3V");
    qmlRegisterType<ZoomLine4V>(uri, 1, 0, "ZoomLine4V");
    qmlRegisterType<XBarRS>(uri, 1, 0, "XBarRS");
    qmlRegisterType<XBarRS_ver2>(uri, 1, 0, "XBarRS_ver2");
    qmlRegisterType<XBarRS_ver3>(uri, 1, 0, "XBarRS_ver3");
    qmlRegisterType<XBarRS_ver4>(uri, 1, 0, "XBarRS_ver4");
    qmlRegisterType<SensCorrStep>(uri, 1, 0, "SensCorrStep");
    qmlRegisterType<XRay>(uri, 1 ,0, "XRay");
    qmlRegisterType<XRay_qimage>(uri, 1 ,0, "XRay_qimage");
    qmlRegisterType<CW>(uri, 1 ,0, "CW");
    qmlRegisterType<InvalidLine_ver2>(uri, 1 ,0, "InvalidLine_ver2");
    qmlRegisterType<TestFramework>(uri, 1 ,0, "TestFramework");
    qmlRegisterType<FillingAmount>(uri, 1 ,0, "FillingAmount");
    qmlRegisterType<Integartion_ver4>(uri, 1 ,0, "Integartion_ver4");
    qmlRegisterType<BufferedGraphicsPanel>(uri, 1 ,0, "BufferedGraphicsPanel");
    qmlRegisterType<IOMonitor>(uri, 1 ,0, "IOMonitor");
    qmlRegisterType<IOMonitorScreenVM>(uri, 1 ,0, "IOMonitorScreenVM");
    qmlRegisterType<ThemeScreen>(uri, 1 ,0, "ThemeScreen");
    qmlRegisterType<XbarRS_NewChart>(uri, 1, 0, "XbarRS_NewChart");
    qmlRegisterType<GetPathReplace>(uri, 1, 0, "GetPathReplace");
    qmlRegisterType<ParameterSettingVM>(uri, 1, 0, "ParameterSettingVM");
    qmlRegisterType<SwitchControlVer5>(uri, 1, 0, "SwitchControlVer5");
    qmlRegisterUncreatableType<EnumControl>(uri, 1, 0, "EnumControl", "");
    qmlRegisterUncreatableType<ScreenMng>(uri, 1, 0, "ScreenMng", "enum screen");
    qmlRegisterType<ParameterSettingListModel>(uri, 1, 0, "ParameterSettingListModel");
    qmlRegisterType<MenuBarSubControlVM>(uri, 1, 0, "MenuBarSubControlVM");
    qmlRegisterType<BottomBarParamSettingVM>(uri, 1, 0, "BottomBarParamSettingVM");

    ImgProvider *imageProvider = ImgProvider::GetInstance();
    engine.addImageProvider(QString("MyProvider"), imageProvider);
    engine.load(QUrl(QStringLiteral("qrc:/MainWindow.qml")));

    mainModel->InnerChangeScreen((int)ScreenMng::ScreenId::ProductionV1);
    return app.exec();

}

