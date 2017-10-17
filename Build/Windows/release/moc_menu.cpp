/****************************************************************************
** Meta object code from reading C++ file 'menu.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../MenuScreen/menu.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'menu.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_MenuV1_t {
    QByteArrayData data[14];
    char stringdata0[202];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_MenuV1_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_MenuV1_t qt_meta_stringdata_MenuV1 = {
    {
QT_MOC_LITERAL(0, 0, 6), // "MenuV1"
QT_MOC_LITERAL(1, 7, 6), // "OnLoad"
QT_MOC_LITERAL(2, 14, 0), // ""
QT_MOC_LITERAL(3, 15, 16), // "OnChangeLanguage"
QT_MOC_LITERAL(4, 32, 26), // "txtAdjustRegisteredProduct"
QT_MOC_LITERAL(5, 59, 15), // "txtControlPanel"
QT_MOC_LITERAL(6, 75, 21), // "txtDisplayProductList"
QT_MOC_LITERAL(7, 97, 10), // "txtHistory"
QT_MOC_LITERAL(8, 108, 11), // "txtLanguage"
QT_MOC_LITERAL(9, 120, 18), // "txtMaintAndSetting"
QT_MOC_LITERAL(10, 139, 11), // "txtOpeCheck"
QT_MOC_LITERAL(11, 151, 15), // "txtStatsControl"
QT_MOC_LITERAL(12, 167, 21), // "txtRegisterNewProduct"
QT_MOC_LITERAL(13, 189, 12) // "txtUsbMemory"

    },
    "MenuV1\0OnLoad\0\0OnChangeLanguage\0"
    "txtAdjustRegisteredProduct\0txtControlPanel\0"
    "txtDisplayProductList\0txtHistory\0"
    "txtLanguage\0txtMaintAndSetting\0"
    "txtOpeCheck\0txtStatsControl\0"
    "txtRegisterNewProduct\0txtUsbMemory"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_MenuV1[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
      10,   26, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    0,   24,    2, 0x02 /* Public */,
       3,    0,   25,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Int,
    QMetaType::Int,

 // properties: name, type, flags
       4, QMetaType::QString, 0x00095401,
       5, QMetaType::QString, 0x00095401,
       6, QMetaType::QString, 0x00095401,
       7, QMetaType::QString, 0x00095401,
       8, QMetaType::QString, 0x00095401,
       9, QMetaType::QString, 0x00095401,
      10, QMetaType::QString, 0x00095401,
      11, QMetaType::QString, 0x00095401,
      12, QMetaType::QString, 0x00095401,
      13, QMetaType::QString, 0x00095401,

       0        // eod
};

void MenuV1::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        MenuV1 *_t = static_cast<MenuV1 *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: { int _r = _t->OnLoad();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 1: { int _r = _t->OnChangeLanguage();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        default: ;
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        MenuV1 *_t = static_cast<MenuV1 *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->txtAdjustRegisteredProduct(); break;
        case 1: *reinterpret_cast< QString*>(_v) = _t->txtControlPanel(); break;
        case 2: *reinterpret_cast< QString*>(_v) = _t->txtDisplayProductList(); break;
        case 3: *reinterpret_cast< QString*>(_v) = _t->txtHistory(); break;
        case 4: *reinterpret_cast< QString*>(_v) = _t->txtLanguage(); break;
        case 5: *reinterpret_cast< QString*>(_v) = _t->txtMaintAndSetting(); break;
        case 6: *reinterpret_cast< QString*>(_v) = _t->txtOpeCheck(); break;
        case 7: *reinterpret_cast< QString*>(_v) = _t->txtStatsControl(); break;
        case 8: *reinterpret_cast< QString*>(_v) = _t->txtRegisterNewProduct(); break;
        case 9: *reinterpret_cast< QString*>(_v) = _t->txtUsbMemory(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

const QMetaObject MenuV1::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_MenuV1.data,
      qt_meta_data_MenuV1,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *MenuV1::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *MenuV1::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_MenuV1.stringdata0))
        return static_cast<void*>(const_cast< MenuV1*>(this));
    return QObject::qt_metacast(_clname);
}

int MenuV1::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 2)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 2;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 10;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 10;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 10;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 10;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 10;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 10;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}
QT_END_MOC_NAMESPACE
