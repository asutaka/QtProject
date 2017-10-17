/****************************************************************************
** Meta object code from reading C++ file 'bottombariomonitorvm.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../BottomBar/bottombariomonitorvm.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'bottombariomonitorvm.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_BottomBarIOMonitorVM_t {
    QByteArrayData data[10];
    char stringdata0[130];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_BottomBarIOMonitorVM_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_BottomBarIOMonitorVM_t qt_meta_stringdata_BottomBarIOMonitorVM = {
    {
QT_MOC_LITERAL(0, 0, 20), // "BottomBarIOMonitorVM"
QT_MOC_LITERAL(1, 21, 6), // "onLoad"
QT_MOC_LITERAL(2, 28, 0), // ""
QT_MOC_LITERAL(3, 29, 16), // "onChangeLanguage"
QT_MOC_LITERAL(4, 46, 8), // "txtClear"
QT_MOC_LITERAL(5, 55, 14), // "txtStartImport"
QT_MOC_LITERAL(6, 70, 13), // "txtStopImport"
QT_MOC_LITERAL(7, 84, 18), // "txtSignalSelection"
QT_MOC_LITERAL(8, 103, 18), // "txtSignalCondition"
QT_MOC_LITERAL(9, 122, 7) // "txtBack"

    },
    "BottomBarIOMonitorVM\0onLoad\0\0"
    "onChangeLanguage\0txtClear\0txtStartImport\0"
    "txtStopImport\0txtSignalSelection\0"
    "txtSignalCondition\0txtBack"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_BottomBarIOMonitorVM[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       6,   26, // properties
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

       0        // eod
};

void BottomBarIOMonitorVM::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        BottomBarIOMonitorVM *_t = static_cast<BottomBarIOMonitorVM *>(_o);
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
        BottomBarIOMonitorVM *_t = static_cast<BottomBarIOMonitorVM *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->txtClear(); break;
        case 1: *reinterpret_cast< QString*>(_v) = _t->txtStartImport(); break;
        case 2: *reinterpret_cast< QString*>(_v) = _t->txtStopImport(); break;
        case 3: *reinterpret_cast< QString*>(_v) = _t->txtSignalSelection(); break;
        case 4: *reinterpret_cast< QString*>(_v) = _t->txtSignalCondition(); break;
        case 5: *reinterpret_cast< QString*>(_v) = _t->txtBack(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

const QMetaObject BottomBarIOMonitorVM::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_BottomBarIOMonitorVM.data,
      qt_meta_data_BottomBarIOMonitorVM,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *BottomBarIOMonitorVM::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *BottomBarIOMonitorVM::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_BottomBarIOMonitorVM.stringdata0))
        return static_cast<void*>(const_cast< BottomBarIOMonitorVM*>(this));
    return QObject::qt_metacast(_clname);
}

int BottomBarIOMonitorVM::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 6;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}
QT_END_MOC_NAMESPACE
