/****************************************************************************
** Meta object code from reading C++ file 'xray_qimage.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../XRay/xray_qimage.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'xray_qimage.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_XRay_qimage_t {
    QByteArrayData data[5];
    char stringdata0[44];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_XRay_qimage_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_XRay_qimage_t qt_meta_stringdata_XRay_qimage = {
    {
QT_MOC_LITERAL(0, 0, 11), // "XRay_qimage"
QT_MOC_LITERAL(1, 12, 10), // "updateDraw"
QT_MOC_LITERAL(2, 23, 0), // ""
QT_MOC_LITERAL(3, 24, 10), // "getIsStart"
QT_MOC_LITERAL(4, 35, 8) // "_isStart"

    },
    "XRay_qimage\0updateDraw\0\0getIsStart\0"
    "_isStart"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_XRay_qimage[] = {

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

 // slots: name, argc, parameters, tag, flags
       1,    0,   24,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
       3,    1,   25,    2, 0x02 /* Public */,

 // slots: parameters
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void, QMetaType::Bool,    4,

       0        // eod
};

void XRay_qimage::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        XRay_qimage *_t = static_cast<XRay_qimage *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->updateDraw(); break;
        case 1: _t->getIsStart((*reinterpret_cast< bool(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObject XRay_qimage::staticMetaObject = {
    { &QQuickPaintedItem::staticMetaObject, qt_meta_stringdata_XRay_qimage.data,
      qt_meta_data_XRay_qimage,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *XRay_qimage::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *XRay_qimage::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_XRay_qimage.stringdata0))
        return static_cast<void*>(const_cast< XRay_qimage*>(this));
    return QQuickPaintedItem::qt_metacast(_clname);
}

int XRay_qimage::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickPaintedItem::qt_metacall(_c, _id, _a);
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
    return _id;
}
QT_END_MOC_NAMESPACE
