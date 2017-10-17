/****************************************************************************
** Meta object code from reading C++ file 'iomonitorscreenvm.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../IOMonitor/iomonitorscreenvm.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'iomonitorscreenvm.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_IOMonitorScreenVM_t {
    QByteArrayData data[25];
    char stringdata0[363];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_IOMonitorScreenVM_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_IOMonitorScreenVM_t qt_meta_stringdata_IOMonitorScreenVM = {
    {
QT_MOC_LITERAL(0, 0, 17), // "IOMonitorScreenVM"
QT_MOC_LITERAL(1, 18, 6), // "onLoad"
QT_MOC_LITERAL(2, 25, 0), // ""
QT_MOC_LITERAL(3, 26, 16), // "onChangeLanguage"
QT_MOC_LITERAL(4, 43, 17), // "txtSampCycleTitle"
QT_MOC_LITERAL(5, 61, 16), // "txtSampCycleUnit"
QT_MOC_LITERAL(6, 78, 8), // "txtStart"
QT_MOC_LITERAL(7, 87, 7), // "txtStop"
QT_MOC_LITERAL(8, 95, 14), // "txtSMPCYCTitle"
QT_MOC_LITERAL(9, 110, 18), // "txtSignalTypeTitle"
QT_MOC_LITERAL(10, 129, 23), // "txtTrigerConditionTitle"
QT_MOC_LITERAL(11, 153, 16), // "txtTrigerNoTitle"
QT_MOC_LITERAL(12, 170, 15), // "txtDisplayTitle"
QT_MOC_LITERAL(13, 186, 20), // "txtSignalSelectTitle"
QT_MOC_LITERAL(14, 207, 12), // "txtInputName"
QT_MOC_LITERAL(15, 220, 13), // "txtOutputName"
QT_MOC_LITERAL(16, 234, 15), // "txtInternalName"
QT_MOC_LITERAL(17, 250, 11), // "txtNoneName"
QT_MOC_LITERAL(18, 262, 12), // "txtBtnOKName"
QT_MOC_LITERAL(19, 275, 16), // "txtBtnCancelName"
QT_MOC_LITERAL(20, 292, 10), // "listSMPCYC"
QT_MOC_LITERAL(21, 303, 11), // "listDisplay"
QT_MOC_LITERAL(22, 315, 19), // "listTrigerCondition"
QT_MOC_LITERAL(23, 335, 12), // "listTrigerNo"
QT_MOC_LITERAL(24, 348, 14) // "listSignalType"

    },
    "IOMonitorScreenVM\0onLoad\0\0onChangeLanguage\0"
    "txtSampCycleTitle\0txtSampCycleUnit\0"
    "txtStart\0txtStop\0txtSMPCYCTitle\0"
    "txtSignalTypeTitle\0txtTrigerConditionTitle\0"
    "txtTrigerNoTitle\0txtDisplayTitle\0"
    "txtSignalSelectTitle\0txtInputName\0"
    "txtOutputName\0txtInternalName\0txtNoneName\0"
    "txtBtnOKName\0txtBtnCancelName\0listSMPCYC\0"
    "listDisplay\0listTrigerCondition\0"
    "listTrigerNo\0listSignalType"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_IOMonitorScreenVM[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
      21,   26, // properties
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
      16, QMetaType::QString, 0x00095401,
      17, QMetaType::QString, 0x00095401,
      18, QMetaType::QString, 0x00095401,
      19, QMetaType::QString, 0x00095401,
      20, QMetaType::QStringList, 0x00095401,
      21, QMetaType::QStringList, 0x00095401,
      22, QMetaType::QStringList, 0x00095401,
      23, QMetaType::QStringList, 0x00095401,
      24, QMetaType::QStringList, 0x00095401,

       0        // eod
};

void IOMonitorScreenVM::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        IOMonitorScreenVM *_t = static_cast<IOMonitorScreenVM *>(_o);
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
        IOMonitorScreenVM *_t = static_cast<IOMonitorScreenVM *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->txtSampCycleTitle(); break;
        case 1: *reinterpret_cast< QString*>(_v) = _t->txtSampCycleUnit(); break;
        case 2: *reinterpret_cast< QString*>(_v) = _t->txtStart(); break;
        case 3: *reinterpret_cast< QString*>(_v) = _t->txtStop(); break;
        case 4: *reinterpret_cast< QString*>(_v) = _t->txtSMPCYCTitle(); break;
        case 5: *reinterpret_cast< QString*>(_v) = _t->txtSignalTypeTitle(); break;
        case 6: *reinterpret_cast< QString*>(_v) = _t->txtTrigerConditionTitle(); break;
        case 7: *reinterpret_cast< QString*>(_v) = _t->txtTrigerNoTitle(); break;
        case 8: *reinterpret_cast< QString*>(_v) = _t->txtDisplayTitle(); break;
        case 9: *reinterpret_cast< QString*>(_v) = _t->txtSignalSelectTitle(); break;
        case 10: *reinterpret_cast< QString*>(_v) = _t->txtInputName(); break;
        case 11: *reinterpret_cast< QString*>(_v) = _t->txtOutputName(); break;
        case 12: *reinterpret_cast< QString*>(_v) = _t->txtInternalName(); break;
        case 13: *reinterpret_cast< QString*>(_v) = _t->txtNoneName(); break;
        case 14: *reinterpret_cast< QString*>(_v) = _t->txtBtnOKName(); break;
        case 15: *reinterpret_cast< QString*>(_v) = _t->txtBtnCancelName(); break;
        case 16: *reinterpret_cast< QStringList*>(_v) = _t->listSMPCYC(); break;
        case 17: *reinterpret_cast< QStringList*>(_v) = _t->listDisplay(); break;
        case 18: *reinterpret_cast< QStringList*>(_v) = _t->listTrigerCondition(); break;
        case 19: *reinterpret_cast< QStringList*>(_v) = _t->listTrigerNo(); break;
        case 20: *reinterpret_cast< QStringList*>(_v) = _t->listSignalType(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

const QMetaObject IOMonitorScreenVM::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_IOMonitorScreenVM.data,
      qt_meta_data_IOMonitorScreenVM,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *IOMonitorScreenVM::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *IOMonitorScreenVM::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_IOMonitorScreenVM.stringdata0))
        return static_cast<void*>(const_cast< IOMonitorScreenVM*>(this));
    return QObject::qt_metacast(_clname);
}

int IOMonitorScreenVM::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
        _id -= 21;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 21;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 21;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 21;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 21;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 21;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}
QT_END_MOC_NAMESPACE
