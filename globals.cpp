#include "globals.h"

globals::globals()
{

}
QSettings* globals::settingsApp = new QSettings("General","PrototypeApp");
