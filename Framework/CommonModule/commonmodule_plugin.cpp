#include "commonmodule_plugin.h"
#include "myitem.h"
#include "datacolumnchart.h"

#include <qqml.h>

void CommonModulePlugin::registerTypes(const char *uri)
{
    // @uri com.mycompany.qmlcomponents
    qmlRegisterType<MyItem>(uri, 1, 0, "MyItem");
    qmlRegisterType<DataColumnChart>(uri, 1, 0, "DataColumnChart");
}

