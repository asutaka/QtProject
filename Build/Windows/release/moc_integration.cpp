/****************************************************************************
** Meta object code from reading C++ file 'integration.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../Integration/integration.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'integration.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_Integration_t {
    QByteArrayData data[10];
    char stringdata0[99];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Integration_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Integration_t qt_meta_stringdata_Integration = {
    {
QT_MOC_LITERAL(0, 0, 11), // "Integration"
QT_MOC_LITERAL(1, 12, 14), // "ContentCleared"
QT_MOC_LITERAL(2, 27, 0), // ""
QT_MOC_LITERAL(3, 28, 12), // "ColorChanged"
QT_MOC_LITERAL(4, 41, 10), // "updateTime"
QT_MOC_LITERAL(5, 52, 10), // "updateDraw"
QT_MOC_LITERAL(6, 63, 11), // "DrawContent"
QT_MOC_LITERAL(7, 75, 12), // "ClearContent"
QT_MOC_LITERAL(8, 88, 4), // "name"
QT_MOC_LITERAL(9, 93, 5) // "color"

    },
    "Integration\0ContentCleared\0\0ColorChanged\0"
    "updateTime\0updateDraw\0DrawContent\0"
    "ClearContent\0name\0color"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Integration[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       2,   50, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   44,    2, 0x06 /* Public */,
       3,    0,   45,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       4,    0,   46,    2, 0x0a /* Public */,
       5,    0,   47,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
       6,    0,   48,    2, 0x02 /* Public */,
       7,    0,   49,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void,

 // properties: name, type, flags
       8, QMetaType::QString, 0x00095103,
       9, QMetaType::QColor, 0x00095103,

       0        // eod
};

void Integration::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Integration *_t = static_cast<Integration *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->ContentCleared(); break;
        case 1: _t->ColorChanged(); break;
        case 2: _t->updateTime(); break;
        case 3: _t->updateDraw(); break;
        case 4: _t->DrawContent(); break;
        case 5: _t->ClearContent(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (Integration::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&Integration::ContentCleared)) {
                *result = 0;
                return;
            }
        }
        {
            typedef void (Integration::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&Integration::ColorChanged)) {
                *result = 1;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        Integration *_t = static_cast<Integration *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->name(); break;
        case 1: *reinterpret_cast< QColor*>(_v) = _t->color(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        Integration *_t = static_cast<Integration *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setName(*reinterpret_cast< QString*>(_v)); break;
        case 1: _t->setColor(*reinterpret_cast< QColor*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
    Q_UNUSED(_a);
}

const QMetaObject Integration::staticMetaObject = {
    { &DrawControlBase::staticMetaObject, qt_meta_stringdata_Integration.data,
      qt_meta_data_Integration,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *Integration::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Integration::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_Integration.stringdata0))
        return static_cast<void*>(const_cast< Integration*>(this));
    return DrawControlBase::qt_metacast(_clname);
}

int Integration::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = DrawControlBase::qt_metacall(_c, _id, _a);
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

// SIGNAL 0
void Integration::ContentCleared()
{
    QMetaObject::activate(this, &staticMetaObject, 0, Q_NULLPTR);
}

// SIGNAL 1
void Integration::ColorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, Q_NULLPTR);
}
QT_END_MOC_NAMESPACE
