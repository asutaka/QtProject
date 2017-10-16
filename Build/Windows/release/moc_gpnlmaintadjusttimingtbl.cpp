/****************************************************************************
** Meta object code from reading C++ file 'gpnlmaintadjusttimingtbl.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../AdjustTiming/gpnlmaintadjusttimingtbl.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#include <QtCore/QList>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gpnlmaintadjusttimingtbl.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_GPnlMaintAdjustTimingTbl_t {
    QByteArrayData data[12];
    char stringdata0[136];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GPnlMaintAdjustTimingTbl_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GPnlMaintAdjustTimingTbl_t qt_meta_stringdata_GPnlMaintAdjustTimingTbl = {
    {
QT_MOC_LITERAL(0, 0, 24), // "GPnlMaintAdjustTimingTbl"
QT_MOC_LITERAL(1, 25, 11), // "clearLegend"
QT_MOC_LITERAL(2, 37, 0), // ""
QT_MOC_LITERAL(3, 38, 5), // "isAll"
QT_MOC_LITERAL(4, 44, 16), // "changeLineActive"
QT_MOC_LITERAL(5, 61, 6), // "mouseX"
QT_MOC_LITERAL(6, 68, 6), // "mouseY"
QT_MOC_LITERAL(7, 75, 26), // "updateListResultImportLine"
QT_MOC_LITERAL(8, 102, 10), // "QList<int>"
QT_MOC_LITERAL(9, 113, 4), // "line"
QT_MOC_LITERAL(10, 118, 9), // "setDrawTn"
QT_MOC_LITERAL(11, 128, 7) // "localTn"

    },
    "GPnlMaintAdjustTimingTbl\0clearLegend\0"
    "\0isAll\0changeLineActive\0mouseX\0mouseY\0"
    "updateListResultImportLine\0QList<int>\0"
    "line\0setDrawTn\0localTn"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GPnlMaintAdjustTimingTbl[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    1,   34,    2, 0x02 /* Public */,
       4,    2,   37,    2, 0x02 /* Public */,
       7,    1,   42,    2, 0x02 /* Public */,
      10,    1,   45,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::QString, QMetaType::Bool,    3,
    QMetaType::QString, QMetaType::Int, QMetaType::Int,    5,    6,
    QMetaType::QString, 0x80000000 | 8,    9,
    QMetaType::Void, 0x80000000 | 8,   11,

       0        // eod
};

void GPnlMaintAdjustTimingTbl::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        GPnlMaintAdjustTimingTbl *_t = static_cast<GPnlMaintAdjustTimingTbl *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: { QString _r = _t->clearLegend((*reinterpret_cast< bool(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 1: { QString _r = _t->changeLineActive((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 2: { QString _r = _t->updateListResultImportLine((*reinterpret_cast< QList<int>(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 3: _t->setDrawTn((*reinterpret_cast< QList<int>(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 2:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<int> >(); break;
            }
            break;
        case 3:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<int> >(); break;
            }
            break;
        }
    }
}

const QMetaObject GPnlMaintAdjustTimingTbl::staticMetaObject = {
    { &QQuickPaintedItem::staticMetaObject, qt_meta_stringdata_GPnlMaintAdjustTimingTbl.data,
      qt_meta_data_GPnlMaintAdjustTimingTbl,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *GPnlMaintAdjustTimingTbl::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GPnlMaintAdjustTimingTbl::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_GPnlMaintAdjustTimingTbl.stringdata0))
        return static_cast<void*>(const_cast< GPnlMaintAdjustTimingTbl*>(this));
    return QQuickPaintedItem::qt_metacast(_clname);
}

int GPnlMaintAdjustTimingTbl::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickPaintedItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 4)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 4)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
