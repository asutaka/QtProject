/****************************************************************************
** Meta object code from reading C++ file 'testframework.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../TestFramework/testframework.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'testframework.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_TestFramework_t {
    QByteArrayData data[9];
    char stringdata0[77];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_TestFramework_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_TestFramework_t qt_meta_stringdata_TestFramework = {
    {
QT_MOC_LITERAL(0, 0, 13), // "TestFramework"
QT_MOC_LITERAL(1, 14, 11), // "DrawControl"
QT_MOC_LITERAL(2, 26, 0), // ""
QT_MOC_LITERAL(3, 27, 11), // "QQuickItem*"
QT_MOC_LITERAL(4, 39, 4), // "item"
QT_MOC_LITERAL(5, 44, 9), // "QPainter*"
QT_MOC_LITERAL(6, 54, 7), // "painter"
QT_MOC_LITERAL(7, 62, 12), // "TestFunction"
QT_MOC_LITERAL(8, 75, 1) // "a"

    },
    "TestFramework\0DrawControl\0\0QQuickItem*\0"
    "item\0QPainter*\0painter\0TestFunction\0"
    "a"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_TestFramework[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    2,   24,    2, 0x02 /* Public */,
       7,    1,   29,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void, 0x80000000 | 3, 0x80000000 | 5,    4,    6,
    QMetaType::Void, QMetaType::Int,    8,

       0        // eod
};

void TestFramework::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        TestFramework *_t = static_cast<TestFramework *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->DrawControl((*reinterpret_cast< QQuickItem*(*)>(_a[1])),(*reinterpret_cast< QPainter*(*)>(_a[2]))); break;
        case 1: _t->TestFunction((*reinterpret_cast< int(*)>(_a[1]))); break;
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
        }
    }
}

const QMetaObject TestFramework::staticMetaObject = {
    { &QQuickItem::staticMetaObject, qt_meta_stringdata_TestFramework.data,
      qt_meta_data_TestFramework,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *TestFramework::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *TestFramework::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_TestFramework.stringdata0))
        return static_cast<void*>(const_cast< TestFramework*>(this));
    return QQuickItem::qt_metacast(_clname);
}

int TestFramework::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
