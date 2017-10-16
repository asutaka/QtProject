/****************************************************************************
** Meta object code from reading C++ file 'iomonitor.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../IOMonitor/iomonitor.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'iomonitor.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_IOMonitor_t {
    QByteArrayData data[14];
    char stringdata0[200];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_IOMonitor_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_IOMonitor_t qt_meta_stringdata_IOMonitor = {
    {
QT_MOC_LITERAL(0, 0, 9), // "IOMonitor"
QT_MOC_LITERAL(1, 10, 10), // "updateDraw"
QT_MOC_LITERAL(2, 21, 0), // ""
QT_MOC_LITERAL(3, 22, 19), // "updateSamplingCycle"
QT_MOC_LITERAL(4, 42, 5), // "value"
QT_MOC_LITERAL(5, 48, 11), // "updateClear"
QT_MOC_LITERAL(6, 60, 18), // "updateFetchingData"
QT_MOC_LITERAL(7, 79, 14), // "isFetchingData"
QT_MOC_LITERAL(8, 94, 22), // "updateStartStopMachine"
QT_MOC_LITERAL(9, 117, 7), // "isStart"
QT_MOC_LITERAL(10, 125, 21), // "updatePredictedSignal"
QT_MOC_LITERAL(11, 147, 17), // "isPredictedSignal"
QT_MOC_LITERAL(12, 165, 17), // "txtSampCycleTitle"
QT_MOC_LITERAL(13, 183, 16) // "txtSampCycleUnit"

    },
    "IOMonitor\0updateDraw\0\0updateSamplingCycle\0"
    "value\0updateClear\0updateFetchingData\0"
    "isFetchingData\0updateStartStopMachine\0"
    "isStart\0updatePredictedSignal\0"
    "isPredictedSignal\0txtSampCycleTitle\0"
    "txtSampCycleUnit"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_IOMonitor[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       2,   58, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   44,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
       3,    1,   45,    2, 0x02 /* Public */,
       5,    0,   48,    2, 0x02 /* Public */,
       6,    1,   49,    2, 0x02 /* Public */,
       8,    1,   52,    2, 0x02 /* Public */,
      10,    1,   55,    2, 0x02 /* Public */,

 // slots: parameters
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void, QMetaType::Int,    4,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Bool,    7,
    QMetaType::Void, QMetaType::Bool,    9,
    QMetaType::Void, QMetaType::Bool,   11,

 // properties: name, type, flags
      12, QMetaType::QString, 0x00095103,
      13, QMetaType::QString, 0x00095103,

       0        // eod
};

void IOMonitor::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        IOMonitor *_t = static_cast<IOMonitor *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->updateDraw(); break;
        case 1: _t->updateSamplingCycle((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 2: _t->updateClear(); break;
        case 3: _t->updateFetchingData((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 4: _t->updateStartStopMachine((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 5: _t->updatePredictedSignal((*reinterpret_cast< bool(*)>(_a[1]))); break;
        default: ;
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        IOMonitor *_t = static_cast<IOMonitor *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->txtSampCycleTitle(); break;
        case 1: *reinterpret_cast< QString*>(_v) = _t->txtSampCycleUnit(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        IOMonitor *_t = static_cast<IOMonitor *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setTxtSampCycleTitle(*reinterpret_cast< QString*>(_v)); break;
        case 1: _t->setTxtSampCycleUnit(*reinterpret_cast< QString*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

const QMetaObject IOMonitor::staticMetaObject = {
    { &QQuickPaintedItem::staticMetaObject, qt_meta_stringdata_IOMonitor.data,
      qt_meta_data_IOMonitor,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *IOMonitor::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *IOMonitor::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_IOMonitor.stringdata0))
        return static_cast<void*>(const_cast< IOMonitor*>(this));
    return QQuickPaintedItem::qt_metacast(_clname);
}

int IOMonitor::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickPaintedItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 6;
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
