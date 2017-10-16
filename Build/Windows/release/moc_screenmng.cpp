/****************************************************************************
** Meta object code from reading C++ file 'screenmng.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../screenmng.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'screenmng.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_ScreenMng_t {
    QByteArrayData data[25];
    char stringdata0[361];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_ScreenMng_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_ScreenMng_t qt_meta_stringdata_ScreenMng = {
    {
QT_MOC_LITERAL(0, 0, 9), // "ScreenMng"
QT_MOC_LITERAL(1, 10, 13), // "currentScreen"
QT_MOC_LITERAL(2, 24, 8), // "ScreenId"
QT_MOC_LITERAL(3, 33, 4), // "None"
QT_MOC_LITERAL(4, 38, 12), // "ProductionV1"
QT_MOC_LITERAL(5, 51, 12), // "ProductionV2"
QT_MOC_LITERAL(6, 64, 9), // "IOMonitor"
QT_MOC_LITERAL(7, 74, 14), // "AdjustTimingV1"
QT_MOC_LITERAL(8, 89, 14), // "AdjustTimingV2"
QT_MOC_LITERAL(9, 104, 4), // "Menu"
QT_MOC_LITERAL(10, 109, 14), // "SettingParamV1"
QT_MOC_LITERAL(11, 124, 14), // "SettingParamV2"
QT_MOC_LITERAL(12, 139, 6), // "PageId"
QT_MOC_LITERAL(13, 146, 11), // "BottomBarId"
QT_MOC_LITERAL(14, 158, 17), // "BottomBarMainPage"
QT_MOC_LITERAL(15, 176, 23), // "BottomBarBackNextCancel"
QT_MOC_LITERAL(16, 200, 13), // "BottomBarMenu"
QT_MOC_LITERAL(17, 214, 21), // "BottomBarParamSetting"
QT_MOC_LITERAL(18, 236, 18), // "BottomBarIOMonitor"
QT_MOC_LITERAL(19, 255, 21), // "BottomBarAdjustTiming"
QT_MOC_LITERAL(20, 277, 11), // "StatusBarId"
QT_MOC_LITERAL(21, 289, 15), // "NormalStatusBar"
QT_MOC_LITERAL(22, 305, 14), // "ErrorStatusBar"
QT_MOC_LITERAL(23, 320, 18), // "IOMonitorStatusBar"
QT_MOC_LITERAL(24, 339, 21) // "AdjustTimingStatusBar"

    },
    "ScreenMng\0currentScreen\0ScreenId\0None\0"
    "ProductionV1\0ProductionV2\0IOMonitor\0"
    "AdjustTimingV1\0AdjustTimingV2\0Menu\0"
    "SettingParamV1\0SettingParamV2\0PageId\0"
    "BottomBarId\0BottomBarMainPage\0"
    "BottomBarBackNextCancel\0BottomBarMenu\0"
    "BottomBarParamSetting\0BottomBarIOMonitor\0"
    "BottomBarAdjustTiming\0StatusBarId\0"
    "NormalStatusBar\0ErrorStatusBar\0"
    "IOMonitorStatusBar\0AdjustTimingStatusBar"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ScreenMng[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       1,   14, // properties
       4,   17, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // properties: name, type, flags
       1, 0x80000000 | 2, 0x00095009,

 // enums: name, flags, count, data
       2, 0x0,    9,   33,
      12, 0x0,    9,   51,
      13, 0x0,    7,   69,
      20, 0x0,    5,   83,

 // enum data: key, value
       3, uint(ScreenMng::ScreenId::None),
       4, uint(ScreenMng::ScreenId::ProductionV1),
       5, uint(ScreenMng::ScreenId::ProductionV2),
       6, uint(ScreenMng::ScreenId::IOMonitor),
       7, uint(ScreenMng::ScreenId::AdjustTimingV1),
       8, uint(ScreenMng::ScreenId::AdjustTimingV2),
       9, uint(ScreenMng::ScreenId::Menu),
      10, uint(ScreenMng::ScreenId::SettingParamV1),
      11, uint(ScreenMng::ScreenId::SettingParamV2),
       3, uint(ScreenMng::PageId::None),
       4, uint(ScreenMng::PageId::ProductionV1),
       5, uint(ScreenMng::PageId::ProductionV2),
       6, uint(ScreenMng::PageId::IOMonitor),
       7, uint(ScreenMng::PageId::AdjustTimingV1),
       8, uint(ScreenMng::PageId::AdjustTimingV2),
       9, uint(ScreenMng::PageId::Menu),
      10, uint(ScreenMng::PageId::SettingParamV1),
      11, uint(ScreenMng::PageId::SettingParamV2),
       3, uint(ScreenMng::BottomBarId::None),
      14, uint(ScreenMng::BottomBarId::BottomBarMainPage),
      15, uint(ScreenMng::BottomBarId::BottomBarBackNextCancel),
      16, uint(ScreenMng::BottomBarId::BottomBarMenu),
      17, uint(ScreenMng::BottomBarId::BottomBarParamSetting),
      18, uint(ScreenMng::BottomBarId::BottomBarIOMonitor),
      19, uint(ScreenMng::BottomBarId::BottomBarAdjustTiming),
       3, uint(ScreenMng::StatusBarId::None),
      21, uint(ScreenMng::StatusBarId::NormalStatusBar),
      22, uint(ScreenMng::StatusBarId::ErrorStatusBar),
      23, uint(ScreenMng::StatusBarId::IOMonitorStatusBar),
      24, uint(ScreenMng::StatusBarId::AdjustTimingStatusBar),

       0        // eod
};

void ScreenMng::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{

#ifndef QT_NO_PROPERTIES
    if (_c == QMetaObject::ReadProperty) {
        ScreenMng *_t = static_cast<ScreenMng *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< ScreenId*>(_v) = _t->CurrentScreen(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObject ScreenMng::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_ScreenMng.data,
      qt_meta_data_ScreenMng,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *ScreenMng::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ScreenMng::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_ScreenMng.stringdata0))
        return static_cast<void*>(const_cast< ScreenMng*>(this));
    return QObject::qt_metacast(_clname);
}

int ScreenMng::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    
#ifndef QT_NO_PROPERTIES
   if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 1;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}
QT_END_MOC_NAMESPACE
