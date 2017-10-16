/****************************************************************************
** Meta object code from reading C++ file 'invalidline.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../InvalidLine/invalidline.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'invalidline.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_InvalidLine_t {
    QByteArrayData data[10];
    char stringdata0[107];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_InvalidLine_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_InvalidLine_t qt_meta_stringdata_InvalidLine = {
    {
QT_MOC_LITERAL(0, 0, 11), // "InvalidLine"
QT_MOC_LITERAL(1, 12, 23), // "onClickInvalidLinePanel"
QT_MOC_LITERAL(2, 36, 0), // ""
QT_MOC_LITERAL(3, 37, 1), // "x"
QT_MOC_LITERAL(4, 39, 1), // "y"
QT_MOC_LITERAL(5, 41, 11), // "clickEnable"
QT_MOC_LITERAL(6, 53, 12), // "clickDisable"
QT_MOC_LITERAL(7, 66, 9), // "selectAll"
QT_MOC_LITERAL(8, 76, 14), // "clearSelection"
QT_MOC_LITERAL(9, 91, 15) // "changeSelection"

    },
    "InvalidLine\0onClickInvalidLinePanel\0"
    "\0x\0y\0clickEnable\0clickDisable\0selectAll\0"
    "clearSelection\0changeSelection"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_InvalidLine[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    2,   44,    2, 0x02 /* Public */,
       5,    0,   49,    2, 0x02 /* Public */,
       6,    0,   50,    2, 0x02 /* Public */,
       7,    0,   51,    2, 0x02 /* Public */,
       8,    0,   52,    2, 0x02 /* Public */,
       9,    0,   53,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void, QMetaType::Float, QMetaType::Float,    3,    4,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void InvalidLine::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        InvalidLine *_t = static_cast<InvalidLine *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->onClickInvalidLinePanel((*reinterpret_cast< float(*)>(_a[1])),(*reinterpret_cast< float(*)>(_a[2]))); break;
        case 1: _t->clickEnable(); break;
        case 2: _t->clickDisable(); break;
        case 3: _t->selectAll(); break;
        case 4: _t->clearSelection(); break;
        case 5: _t->changeSelection(); break;
        default: ;
        }
    }
}

const QMetaObject InvalidLine::staticMetaObject = {
    { &QQuickPaintedItem::staticMetaObject, qt_meta_stringdata_InvalidLine.data,
      qt_meta_data_InvalidLine,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *InvalidLine::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *InvalidLine::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_InvalidLine.stringdata0))
        return static_cast<void*>(const_cast< InvalidLine*>(this));
    return QQuickPaintedItem::qt_metacast(_clname);
}

int InvalidLine::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
    return _id;
}
QT_END_MOC_NAMESPACE
