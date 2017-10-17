/****************************************************************************
** Meta object code from reading C++ file 'iomonitorstatusbarvm.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../StatusBar/iomonitorstatusbarvm.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'iomonitorstatusbarvm.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_IOMonitorStatusBarVM_t {
    QByteArrayData data[16];
    char stringdata0[232];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_IOMonitorStatusBarVM_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_IOMonitorStatusBarVM_t qt_meta_stringdata_IOMonitorStatusBarVM = {
    {
QT_MOC_LITERAL(0, 0, 20), // "IOMonitorStatusBarVM"
QT_MOC_LITERAL(1, 21, 6), // "onLoad"
QT_MOC_LITERAL(2, 28, 0), // ""
QT_MOC_LITERAL(3, 29, 16), // "onChangeLanguage"
QT_MOC_LITERAL(4, 46, 23), // "txtTrigerConditionTitle"
QT_MOC_LITERAL(5, 70, 16), // "txtTrigerNoTitle"
QT_MOC_LITERAL(6, 87, 18), // "txtSignalTypeTitle"
QT_MOC_LITERAL(7, 106, 15), // "txtDisplayTitle"
QT_MOC_LITERAL(8, 122, 14), // "txtScreenName2"
QT_MOC_LITERAL(9, 137, 13), // "txtScreenName"
QT_MOC_LITERAL(10, 151, 8), // "txtStart"
QT_MOC_LITERAL(11, 160, 7), // "txtStop"
QT_MOC_LITERAL(12, 168, 12), // "valueDisplay"
QT_MOC_LITERAL(13, 181, 20), // "valueTrigerCondition"
QT_MOC_LITERAL(14, 202, 13), // "valueTrigerNo"
QT_MOC_LITERAL(15, 216, 15) // "valueSignalType"

    },
    "IOMonitorStatusBarVM\0onLoad\0\0"
    "onChangeLanguage\0txtTrigerConditionTitle\0"
    "txtTrigerNoTitle\0txtSignalTypeTitle\0"
    "txtDisplayTitle\0txtScreenName2\0"
    "txtScreenName\0txtStart\0txtStop\0"
    "valueDisplay\0valueTrigerCondition\0"
    "valueTrigerNo\0valueSignalType"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_IOMonitorStatusBarVM[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
      12,   26, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    0,   24,    2, 0x02 /* Public */,
       3,    0,   25,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void,
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
      14, QMetaType::QString, 0x00095401,
      15, QMetaType::QString, 0x00095401,

       0        // eod
};

void IOMonitorStatusBarVM::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        IOMonitorStatusBarVM *_t = static_cast<IOMonitorStatusBarVM *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->onLoad(); break;
        case 1: { int _r = _t->onChangeLanguage();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        default: ;
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        IOMonitorStatusBarVM *_t = static_cast<IOMonitorStatusBarVM *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->txtTrigerConditionTitle(); break;
        case 1: *reinterpret_cast< QString*>(_v) = _t->txtTrigerNoTitle(); break;
        case 2: *reinterpret_cast< QString*>(_v) = _t->txtSignalTypeTitle(); break;
        case 3: *reinterpret_cast< QString*>(_v) = _t->txtDisplayTitle(); break;
        case 4: *reinterpret_cast< QString*>(_v) = _t->txtScreenName2(); break;
        case 5: *reinterpret_cast< QString*>(_v) = _t->txtScreenName(); break;
        case 6: *reinterpret_cast< QString*>(_v) = _t->txtStart(); break;
        case 7: *reinterpret_cast< QString*>(_v) = _t->txtStop(); break;
        case 8: *reinterpret_cast< QString*>(_v) = _t->valueDisplay(); break;
        case 9: *reinterpret_cast< QString*>(_v) = _t->valueTrigerCondition(); break;
        case 10: *reinterpret_cast< QString*>(_v) = _t->valueTrigerNo(); break;
        case 11: *reinterpret_cast< QString*>(_v) = _t->valueSignalType(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

const QMetaObject IOMonitorStatusBarVM::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_IOMonitorStatusBarVM.data,
      qt_meta_data_IOMonitorStatusBarVM,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *IOMonitorStatusBarVM::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *IOMonitorStatusBarVM::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_IOMonitorStatusBarVM.stringdata0))
        return static_cast<void*>(const_cast< IOMonitorStatusBarVM*>(this));
    return QObject::qt_metacast(_clname);
}

int IOMonitorStatusBarVM::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
        _id -= 12;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 12;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 12;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 12;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 12;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 12;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}
QT_END_MOC_NAMESPACE
