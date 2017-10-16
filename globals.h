#ifndef GLOBALS_H
#define GLOBALS_H
#include <QSettings>

//Method
#define PRINTER(name) #name

//constant value
#define REPLACE_PATH_TAG "ReplacePath"
#define LANGUAGE_ID_TAG "Language"
#define GENERAL_TAG "General"
#define CONFIG_PATH "./config.ini"

// Parameter setting column name
#define SERIAL_COLUMN_NAME  "serial"
#define PARAM_COLUMN_NAME   "param"
#define VALUE_COLUMN_NAME   "value"
#define TYPE_COLUMN_NAME    "type"
#define INFO_COLUMN_NAME    "info"

//enum class ReturnCode {
//    SUCCESS = 0,
//    ERROR,
//};


class globals
{
public:
    globals();
    static QSettings* settingsApp;
};

#endif // GLOBALS_H
