/****************************************************************************
** Meta object code from reading C++ file 'production.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../Production/production.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'production.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_Production_t {
    QByteArrayData data[4];
    char stringdata0[30];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Production_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Production_t qt_meta_stringdata_Production = {
    {
QT_MOC_LITERAL(0, 0, 10), // "Production"
QT_MOC_LITERAL(1, 11, 10), // "updateView"
QT_MOC_LITERAL(2, 22, 0), // ""
QT_MOC_LITERAL(3, 23, 6) // "weight"

    },
    "Production\0updateView\0\0weight"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Production[] = {

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
       1,    1,   19,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void, QMetaType::QString,    3,

       0        // eod
};

void Production::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Production *_t = static_cast<Production *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->updateView((*reinterpret_cast< QString(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObject Production::staticMetaObject = {
    { &QQuickPaintedItem::staticMetaObject, qt_meta_stringdata_Production.data,
      qt_meta_data_Production,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *Production::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Production::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_Production.stringdata0))
        return static_cast<void*>(const_cast< Production*>(this));
    return QQuickPaintedItem::qt_metacast(_clname);
}

int Production::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 1;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
