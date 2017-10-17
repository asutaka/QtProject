/****************************************************************************
** Meta object code from reading C++ file 'adjusttimingver3.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../AdjustTiming/adjusttimingver3.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#include <QtCore/QList>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'adjusttimingver3.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_AdjustTimingVer3_t {
    QByteArrayData data[17];
    char stringdata0[166];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_AdjustTimingVer3_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_AdjustTimingVer3_t qt_meta_stringdata_AdjustTimingVer3 = {
    {
QT_MOC_LITERAL(0, 0, 16), // "AdjustTimingVer3"
QT_MOC_LITERAL(1, 17, 13), // "setAxisOption"
QT_MOC_LITERAL(2, 31, 0), // ""
QT_MOC_LITERAL(3, 32, 11), // "QQuickItem*"
QT_MOC_LITERAL(4, 44, 5), // "_item"
QT_MOC_LITERAL(5, 50, 6), // "_color"
QT_MOC_LITERAL(6, 57, 10), // "_distanceX"
QT_MOC_LITERAL(7, 68, 10), // "_distanceY"
QT_MOC_LITERAL(8, 79, 10), // "_drawGridX"
QT_MOC_LITERAL(9, 90, 10), // "_drawGridY"
QT_MOC_LITERAL(10, 101, 12), // "drawAxisLine"
QT_MOC_LITERAL(11, 114, 4), // "item"
QT_MOC_LITERAL(12, 119, 9), // "QPainter*"
QT_MOC_LITERAL(13, 129, 7), // "painter"
QT_MOC_LITERAL(14, 137, 9), // "setDrawTn"
QT_MOC_LITERAL(15, 147, 10), // "QList<int>"
QT_MOC_LITERAL(16, 158, 7) // "localTn"

    },
    "AdjustTimingVer3\0setAxisOption\0\0"
    "QQuickItem*\0_item\0_color\0_distanceX\0"
    "_distanceY\0_drawGridX\0_drawGridY\0"
    "drawAxisLine\0item\0QPainter*\0painter\0"
    "setDrawTn\0QList<int>\0localTn"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_AdjustTimingVer3[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       3,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    6,   29,    2, 0x0a /* Public */,
      10,    2,   42,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
      14,    1,   47,    2, 0x02 /* Public */,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 3, QMetaType::QString, QMetaType::QReal, QMetaType::QReal, QMetaType::Bool, QMetaType::Bool,    4,    5,    6,    7,    8,    9,
    QMetaType::Void, 0x80000000 | 3, 0x80000000 | 12,   11,   13,

 // methods: parameters
    QMetaType::Void, 0x80000000 | 15,   16,

       0        // eod
};

void AdjustTimingVer3::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        AdjustTimingVer3 *_t = static_cast<AdjustTimingVer3 *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->setAxisOption((*reinterpret_cast< QQuickItem*(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< qreal(*)>(_a[3])),(*reinterpret_cast< qreal(*)>(_a[4])),(*reinterpret_cast< bool(*)>(_a[5])),(*reinterpret_cast< bool(*)>(_a[6]))); break;
        case 1: _t->drawAxisLine((*reinterpret_cast< QQuickItem*(*)>(_a[1])),(*reinterpret_cast< QPainter*(*)>(_a[2]))); break;
        case 2: _t->setDrawTn((*reinterpret_cast< QList<int>(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 0:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QQuickItem* >(); break;
            }
            break;
        case 1:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QQuickItem* >(); break;
            }
            break;
        case 2:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<int> >(); break;
            }
            break;
        }
    }
}

const QMetaObject AdjustTimingVer3::staticMetaObject = {
    { &QQuickPaintedItem::staticMetaObject, qt_meta_stringdata_AdjustTimingVer3.data,
      qt_meta_data_AdjustTimingVer3,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *AdjustTimingVer3::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *AdjustTimingVer3::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_AdjustTimingVer3.stringdata0))
        return static_cast<void*>(const_cast< AdjustTimingVer3*>(this));
    return QQuickPaintedItem::qt_metacast(_clname);
}

int AdjustTimingVer3::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickPaintedItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 3)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 3)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
