#include "commoncontrol_plugin.h"
#include <qqml.h>
#include "ProductionInfo/productioninfo_com1.h"
#include "ProductionInfo/productioninfo_com2.h"
#include "ProductionInfo/productioninfo_com3.h"
#include "drawablecontrol.h"
#include "handlemanager.h"
#include "tkchartview.h"
#include "tk_column.h"
#include "tk_line.h"

void CommonControlPlugin::registerTypes(const char *uri)
{
    qmlRegisterType<ProductionInfo_com1>(uri, 1, 0, "ProductionInfo_com1");
    qmlRegisterType<ProductionInfo_com2>(uri, 1, 0, "ProductionInfo_com2");
    qmlRegisterType<ProductionInfo_com3>(uri, 1, 0, "ProductionInfo_com3");
    qmlRegisterType<DrawableControl>(uri, 1, 0, "DrawableControl");
    qmlRegisterType<HandleManager>(uri, 1, 0, "HandleManager");
    qmlRegisterType<TKChartView>(uri, 1, 0, "TK_ChartView");
    qmlRegisterType<TK_Column>(uri, 1, 0, "TK_Column");
    qmlRegisterType<TK_Line>(uri, 1, 0, "TK_Line");
}

