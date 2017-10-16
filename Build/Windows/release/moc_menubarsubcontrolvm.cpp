/****************************************************************************
** Meta object code from reading C++ file 'menubarsubcontrolvm.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../ParameterSetting/menubarsubcontrolvm.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'menubarsubcontrolvm.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_MenuBarSubControlVM_t {
    QByteArrayData data[20];
    char stringdata0[297];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_MenuBarSubControlVM_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_MenuBarSubControlVM_t qt_meta_stringdata_MenuBarSubControlVM = {
    {
QT_MOC_LITERAL(0, 0, 19), // "MenuBarSubControlVM"
QT_MOC_LITERAL(1, 20, 18), // "txtAddress1Changed"
QT_MOC_LITERAL(2, 39, 0), // ""
QT_MOC_LITERAL(3, 40, 8), // "QString&"
QT_MOC_LITERAL(4, 49, 3), // "arg"
QT_MOC_LITERAL(5, 53, 18), // "txtAddress2Changed"
QT_MOC_LITERAL(6, 72, 18), // "txtAddress3Changed"
QT_MOC_LITERAL(7, 91, 18), // "txtAddress4Changed"
QT_MOC_LITERAL(8, 110, 22), // "fontSizeDefaultChanged"
QT_MOC_LITERAL(9, 133, 6), // "float&"
QT_MOC_LITERAL(10, 140, 22), // "fontNameDefaultChanged"
QT_MOC_LITERAL(11, 163, 23), // "fontColorDefaultChanged"
QT_MOC_LITERAL(12, 187, 12), // "onUpdateLang"
QT_MOC_LITERAL(13, 200, 11), // "txtAddress1"
QT_MOC_LITERAL(14, 212, 11), // "txtAddress2"
QT_MOC_LITERAL(15, 224, 11), // "txtAddress3"
QT_MOC_LITERAL(16, 236, 11), // "txtAddress4"
QT_MOC_LITERAL(17, 248, 15), // "fontSizeDefault"
QT_MOC_LITERAL(18, 264, 15), // "fontNameDefault"
QT_MOC_LITERAL(19, 280, 16) // "fontColorDefault"

    },
    "MenuBarSubControlVM\0txtAddress1Changed\0"
    "\0QString&\0arg\0txtAddress2Changed\0"
    "txtAddress3Changed\0txtAddress4Changed\0"
    "fontSizeDefaultChanged\0float&\0"
    "fontNameDefaultChanged\0fontColorDefaultChanged\0"
    "onUpdateLang\0txtAddress1\0txtAddress2\0"
    "txtAddress3\0txtAddress4\0fontSizeDefault\0"
    "fontNameDefault\0fontColorDefault"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_MenuBarSubControlVM[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       7,   76, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       7,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   54,    2, 0x06 /* Public */,
       5,    1,   57,    2, 0x06 /* Public */,
       6,    1,   60,    2, 0x06 /* Public */,
       7,    1,   63,    2, 0x06 /* Public */,
       8,    1,   66,    2, 0x06 /* Public */,
      10,    1,   69,    2, 0x06 /* Public */,
      11,    1,   72,    2, 0x06 /* Public */,

 // methods: name, argc, parameters, tag, flags
      12,    0,   75,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void, 0x80000000 | 3,    4,
    QMetaType::Void, 0x80000000 | 3,    4,
    QMetaType::Void, 0x80000000 | 3,    4,
    QMetaType::Void, 0x80000000 | 3,    4,
    QMetaType::Void, 0x80000000 | 9,    4,
    QMetaType::Void, 0x80000000 | 3,    4,
    QMetaType::Void, 0x80000000 | 3,    4,

 // methods: parameters
    QMetaType::Int,

 // properties: name, type, flags
      13, QMetaType::QString, 0x00495103,
      14, QMetaType::QString, 0x00495103,
      15, QMetaType::QString, 0x00495103,
      16, QMetaType::QString, 0x00495103,
      17, QMetaType::Float, 0x00495103,
      18, QMetaType::QString, 0x00495103,
      19, QMetaType::QString, 0x00495103,

 // properties: notify_signal_id
       0,
       0,
       0,
       0,
       4,
       5,
       6,

       0        // eod
};

void MenuBarSubControlVM::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        MenuBarSubControlVM *_t = static_cast<MenuBarSubControlVM *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->txtAddress1Changed((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 1: _t->txtAddress2Changed((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 2: _t->txtAddress3Changed((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 3: _t->txtAddress4Changed((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 4: _t->fontSizeDefaultChanged((*reinterpret_cast< float(*)>(_a[1]))); break;
        case 5: _t->fontNameDefaultChanged((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 6: _t->fontColorDefaultChanged((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 7: { int _r = _t->onUpdateLang();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (MenuBarSubControlVM::*_t)(QString & );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&MenuBarSubControlVM::txtAddress1Changed)) {
                *result = 0;
                return;
            }
        }
        {
            typedef void (MenuBarSubControlVM::*_t)(QString & );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&MenuBarSubControlVM::txtAddress2Changed)) {
                *result = 1;
                return;
            }
        }
        {
            typedef void (MenuBarSubControlVM::*_t)(QString & );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&MenuBarSubControlVM::txtAddress3Changed)) {
                *result = 2;
                return;
            }
        }
        {
            typedef void (MenuBarSubControlVM::*_t)(QString & );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&MenuBarSubControlVM::txtAddress4Changed)) {
                *result = 3;
                return;
            }
        }
        {
            typedef void (MenuBarSubControlVM::*_t)(float & );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&MenuBarSubControlVM::fontSizeDefaultChanged)) {
                *result = 4;
                return;
            }
        }
        {
            typedef void (MenuBarSubControlVM::*_t)(QString & );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&MenuBarSubControlVM::fontNameDefaultChanged)) {
                *result = 5;
                return;
            }
        }
        {
            typedef void (MenuBarSubControlVM::*_t)(QString & );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&MenuBarSubControlVM::fontColorDefaultChanged)) {
                *result = 6;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        MenuBarSubControlVM *_t = static_cast<MenuBarSubControlVM *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->txtAddress1(); break;
        case 1: *reinterpret_cast< QString*>(_v) = _t->txtAddress2(); break;
        case 2: *reinterpret_cast< QString*>(_v) = _t->txtAddress3(); break;
        case 3: *reinterpret_cast< QString*>(_v) = _t->txtAddress4(); break;
        case 4: *reinterpret_cast< float*>(_v) = _t->fontSizeDefault(); break;
        case 5: *reinterpret_cast< QString*>(_v) = _t->fontNameDefault(); break;
        case 6: *reinterpret_cast< QString*>(_v) = _t->fontColorDefault(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        MenuBarSubControlVM *_t = static_cast<MenuBarSubControlVM *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setTxtAddress1(*reinterpret_cast< QString*>(_v)); break;
        case 1: _t->setTxtAddress2(*reinterpret_cast< QString*>(_v)); break;
        case 2: _t->setTxtAddress3(*reinterpret_cast< QString*>(_v)); break;
        case 3: _t->setTxtAddress4(*reinterpret_cast< QString*>(_v)); break;
        case 4: _t->setFontSizeDefault(*reinterpret_cast< float*>(_v)); break;
        case 5: _t->setFontNameDefault(*reinterpret_cast< QString*>(_v)); break;
        case 6: _t->setFontColorDefault(*reinterpret_cast< QString*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

const QMetaObject MenuBarSubControlVM::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_MenuBarSubControlVM.data,
      qt_meta_data_MenuBarSubControlVM,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *MenuBarSubControlVM::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *MenuBarSubControlVM::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_MenuBarSubControlVM.stringdata0))
        return static_cast<void*>(const_cast< MenuBarSubControlVM*>(this));
    return QObject::qt_metacast(_clname);
}

int MenuBarSubControlVM::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 8)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 8;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 7;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void MenuBarSubControlVM::txtAddress1Changed(QString & _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void MenuBarSubControlVM::txtAddress2Changed(QString & _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void MenuBarSubControlVM::txtAddress3Changed(QString & _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void MenuBarSubControlVM::txtAddress4Changed(QString & _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void MenuBarSubControlVM::fontSizeDefaultChanged(float & _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void MenuBarSubControlVM::fontNameDefaultChanged(QString & _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}

// SIGNAL 6
void MenuBarSubControlVM::fontColorDefaultChanged(QString & _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 6, _a);
}
QT_END_MOC_NAMESPACE
