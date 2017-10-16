/****************************************************************************
** Meta object code from reading C++ file 'switchcontrolver5.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../Control/switchControl/switchcontrolver5.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'switchcontrolver5.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_SwitchControlVer5_t {
    QByteArrayData data[5];
    char stringdata0[50];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_SwitchControlVer5_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_SwitchControlVer5_t qt_meta_stringdata_SwitchControlVer5 = {
    {
QT_MOC_LITERAL(0, 0, 17), // "SwitchControlVer5"
QT_MOC_LITERAL(1, 18, 16), // "OnChangeLanguage"
QT_MOC_LITERAL(2, 35, 0), // ""
QT_MOC_LITERAL(3, 36, 6), // "isProd"
QT_MOC_LITERAL(4, 43, 6) // "isXbar"

    },
    "SwitchControlVer5\0OnChangeLanguage\0\0"
    "isProd\0isXbar"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_SwitchControlVer5[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       1,   14, // methods
       2,   20, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    0,   19,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Int,

 // properties: name, type, flags
       3, QMetaType::QString, 0x00095401,
       4, QMetaType::QString, 0x00095401,

       0        // eod
};

void SwitchControlVer5::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        SwitchControlVer5 *_t = static_cast<SwitchControlVer5 *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: { int _r = _t->OnChangeLanguage();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        default: ;
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        SwitchControlVer5 *_t = static_cast<SwitchControlVer5 *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->isProd(); break;
        case 1: *reinterpret_cast< QString*>(_v) = _t->isXbar(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

const QMetaObject SwitchControlVer5::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_SwitchControlVer5.data,
      qt_meta_data_SwitchControlVer5,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *SwitchControlVer5::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *SwitchControlVer5::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_SwitchControlVer5.stringdata0))
        return static_cast<void*>(const_cast< SwitchControlVer5*>(this));
    return QObject::qt_metacast(_clname);
}

int SwitchControlVer5::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 1)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 1)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 1;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 2;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}
QT_END_MOC_NAMESPACE
