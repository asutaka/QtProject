/****************************************************************************
** Meta object code from reading C++ file 'adjusttimingver4.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../AdjustTiming/adjusttimingver4.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#include <QtCore/QList>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'adjusttimingver4.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_AdjustTimingVer4_t {
    QByteArrayData data[7];
    char stringdata0[71];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_AdjustTimingVer4_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_AdjustTimingVer4_t qt_meta_stringdata_AdjustTimingVer4 = {
    {
QT_MOC_LITERAL(0, 0, 16), // "AdjustTimingVer4"
QT_MOC_LITERAL(1, 17, 9), // "setDrawTn"
QT_MOC_LITERAL(2, 27, 0), // ""
QT_MOC_LITERAL(3, 28, 10), // "QList<int>"
QT_MOC_LITERAL(4, 39, 7), // "localTn"
QT_MOC_LITERAL(5, 47, 14), // "QList<QString>"
QT_MOC_LITERAL(6, 62, 8) // "stringTn"

    },
    "AdjustTimingVer4\0setDrawTn\0\0QList<int>\0"
    "localTn\0QList<QString>\0stringTn"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_AdjustTimingVer4[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       1,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    2,   19,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void, 0x80000000 | 3, 0x80000000 | 5,    4,    6,

       0        // eod
};

void AdjustTimingVer4::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        AdjustTimingVer4 *_t = static_cast<AdjustTimingVer4 *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->setDrawTn((*reinterpret_cast< QList<int>(*)>(_a[1])),(*reinterpret_cast< QList<QString>(*)>(_a[2]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 0:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 1:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<QString> >(); break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<int> >(); break;
            }
            break;
        }
    }
}

const QMetaObject AdjustTimingVer4::staticMetaObject = {
    { &QQuickPaintedItem::staticMetaObject, qt_meta_stringdata_AdjustTimingVer4.data,
      qt_meta_data_AdjustTimingVer4,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *AdjustTimingVer4::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *AdjustTimingVer4::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_AdjustTimingVer4.stringdata0))
        return static_cast<void*>(const_cast< AdjustTimingVer4*>(this));
    return QQuickPaintedItem::qt_metacast(_clname);
}

int AdjustTimingVer4::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickPaintedItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 1)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 1)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    }
    return _id;
}
QT_END_MOC_NAMESPACE