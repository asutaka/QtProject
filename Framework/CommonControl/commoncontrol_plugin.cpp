#include "commoncontrol_plugin.h"
#include "myitem.h"

#include <qqml.h>
#include "ProductionInfo/productioninfo_com1.h"
#include "ProductionInfo/productioninfo_com2.h"
#include "ProductionInfo/productioninfo_com3.h"

void CommonControlPlugin::registerTypes(const char *uri)
{
    qmlRegisterType<MyItem>(uri, 1, 0, "MyItem");
    qmlRegisterType<ProductionInfo_com1>(uri, 1, 0, "ProductionInfo_com1");
    qmlRegisterType<ProductionInfo_com2>(uri, 1, 0, "ProductionInfo_com2");
    qmlRegisterType<ProductionInfo_com3>(uri, 1, 0, "ProductionInfo_com3");
}

