/****************************************************************************
** Meta object code from reading C++ file 'getpathreplace.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../SetReplacePathScreen/getpathreplace.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'getpathreplace.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_GetPathReplace_t {
    QByteArrayData data[6];
    char stringdata0[49];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GetPathReplace_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GetPathReplace_t qt_meta_stringdata_GetPathReplace = {
    {
QT_MOC_LITERAL(0, 0, 14), // "GetPathReplace"
QT_MOC_LITERAL(1, 15, 7), // "setPath"
QT_MOC_LITERAL(2, 23, 0), // ""
QT_MOC_LITERAL(3, 24, 10), // "settingApp"
QT_MOC_LITERAL(4, 35, 3), // "dir"
QT_MOC_LITERAL(5, 39, 9) // "isAndroid"

    },
    "GetPathReplace\0setPath\0\0settingApp\0"
    "dir\0isAndroid"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GetPathReplace[] = {

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

 // methods: name, argc, parameters, tag, flags
       1,    0,   29,    2, 0x02 /* Public */,
       3,    1,   30,    2, 0x02 /* Public */,
       5,    0,   33,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    4,
    QMetaType::Bool,

       0        // eod
};

void GetPathReplace::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        GetPathReplace *_t = static_cast<GetPathReplace *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->setPath(); break;
        case 1: _t->settingApp((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 2: { bool _r = _t->isAndroid();
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        default: ;
        }
    }
}

const QMetaObject GetPathReplace::staticMetaObject = {
    { &QQuickPaintedItem::staticMetaObject, qt_meta_stringdata_GetPathReplace.data,
      qt_meta_data_GetPathReplace,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *GetPathReplace::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GetPathReplace::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_GetPathReplace.stringdata0))
        return static_cast<void*>(const_cast< GetPathReplace*>(this));
    return QQuickPaintedItem::qt_metacast(_clname);
}

int GetPathReplace::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 3;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
