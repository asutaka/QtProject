/****************************************************************************
** Meta object code from reading C++ file 'mainproductionver2vm.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../Production/mainproductionver2vm.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#include <QtCore/QList>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'mainproductionver2vm.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_MainProductionVer2VM_t {
    QByteArrayData data[20];
    char stringdata0[273];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_MainProductionVer2VM_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_MainProductionVer2VM_t qt_meta_stringdata_MainProductionVer2VM = {
    {
QT_MOC_LITERAL(0, 0, 20), // "MainProductionVer2VM"
QT_MOC_LITERAL(1, 21, 14), // "setValueToDraw"
QT_MOC_LITERAL(2, 36, 10), // "QList<int>"
QT_MOC_LITERAL(3, 47, 0), // ""
QT_MOC_LITERAL(4, 48, 12), // "setLineColor"
QT_MOC_LITERAL(5, 61, 14), // "QList<QString>"
QT_MOC_LITERAL(6, 76, 18), // "updateImgtoProduct"
QT_MOC_LITERAL(7, 95, 18), // "updateMeasureValue"
QT_MOC_LITERAL(8, 114, 16), // "onChangeLanguage"
QT_MOC_LITERAL(9, 131, 11), // "getInterval"
QT_MOC_LITERAL(10, 143, 12), // "measureValue"
QT_MOC_LITERAL(11, 156, 11), // "measureUnit"
QT_MOC_LITERAL(12, 168, 15), // "backgroundColor"
QT_MOC_LITERAL(13, 184, 6), // "isXBar"
QT_MOC_LITERAL(14, 191, 15), // "arrPixmapLineNo"
QT_MOC_LITERAL(15, 207, 14), // "QList<QPixmap>"
QT_MOC_LITERAL(16, 222, 18), // "arrMassbarBargraph"
QT_MOC_LITERAL(17, 241, 15), // "arrStatusLineNo"
QT_MOC_LITERAL(18, 257, 7), // "txtProd"
QT_MOC_LITERAL(19, 265, 7) // "txtXbar"

    },
    "MainProductionVer2VM\0setValueToDraw\0"
    "QList<int>\0\0setLineColor\0QList<QString>\0"
    "updateImgtoProduct\0updateMeasureValue\0"
    "onChangeLanguage\0getInterval\0measureValue\0"
    "measureUnit\0backgroundColor\0isXBar\0"
    "arrPixmapLineNo\0QList<QPixmap>\0"
    "arrMassbarBargraph\0arrStatusLineNo\0"
    "txtProd\0txtXbar"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_MainProductionVer2VM[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       9,   50, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    0,   44,    3, 0x02 /* Public */,
       4,    0,   45,    3, 0x02 /* Public */,
       6,    0,   46,    3, 0x02 /* Public */,
       7,    0,   47,    3, 0x02 /* Public */,
       8,    0,   48,    3, 0x02 /* Public */,
       9,    0,   49,    3, 0x02 /* Public */,

 // methods: parameters
    0x80000000 | 2,
    0x80000000 | 5,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Int,

 // properties: name, type, flags
      10, 0x80000000 | 5, 0x0009510b,
      11, QMetaType::QString, 0x00095103,
      12, QMetaType::QColor, 0x00095103,
      13, QMetaType::Bool, 0x00095103,
      14, 0x80000000 | 15, 0x0009510b,
      16, 0x80000000 | 15, 0x0009510b,
      17, 0x80000000 | 15, 0x0009510b,
      18, QMetaType::QString, 0x00095401,
      19, QMetaType::QString, 0x00095401,

       0        // eod
};

void MainProductionVer2VM::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        MainProductionVer2VM *_t = static_cast<MainProductionVer2VM *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: { QList<int> _r = _t->setValueToDraw();
            if (_a[0]) *reinterpret_cast< QList<int>*>(_a[0]) = _r; }  break;
        case 1: { QList<QString> _r = _t->setLineColor();
            if (_a[0]) *reinterpret_cast< QList<QString>*>(_a[0]) = _r; }  break;
        case 2: _t->updateImgtoProduct(); break;
        case 3: _t->updateMeasureValue(); break;
        case 4: _t->onChangeLanguage(); break;
        case 5: { int _r = _t->getInterval();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterPropertyMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 6:
        case 5:
        case 4:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<QPixmap> >(); break;
        case 0:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<QString> >(); break;
        }
    }

#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        MainProductionVer2VM *_t = static_cast<MainProductionVer2VM *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QList<QString>*>(_v) = _t->getMeasureValue(); break;
        case 1: *reinterpret_cast< QString*>(_v) = _t->getMeasureUnit(); break;
        case 2: *reinterpret_cast< QColor*>(_v) = _t->getBackgroundColor(); break;
        case 3: *reinterpret_cast< bool*>(_v) = _t->isXBar(); break;
        case 4: *reinterpret_cast< QList<QPixmap>*>(_v) = _t->getArrPixmapLineNo(); break;
        case 5: *reinterpret_cast< QList<QPixmap>*>(_v) = _t->getArrMassbarBargraph(); break;
        case 6: *reinterpret_cast< QList<QPixmap>*>(_v) = _t->getArrStatusLineNo(); break;
        case 7: *reinterpret_cast< QString*>(_v) = _t->txtProd(); break;
        case 8: *reinterpret_cast< QString*>(_v) = _t->txtXbar(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        MainProductionVer2VM *_t = static_cast<MainProductionVer2VM *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setMeasureValue(*reinterpret_cast< QList<QString>*>(_v)); break;
        case 1: _t->setMeasureUnit(*reinterpret_cast< QString*>(_v)); break;
        case 2: _t->setBackgroundColor(*reinterpret_cast< QColor*>(_v)); break;
        case 3: _t->setIsXBar(*reinterpret_cast< bool*>(_v)); break;
        case 4: _t->setArrPixmapLineNo(*reinterpret_cast< QList<QPixmap>*>(_v)); break;
        case 5: _t->setArrMassbarBargraph(*reinterpret_cast< QList<QPixmap>*>(_v)); break;
        case 6: _t->setArrStatusLineNo(*reinterpret_cast< QList<QPixmap>*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

const QMetaObject MainProductionVer2VM::staticMetaObject = {
    { &ProductScreenBaseVM::staticMetaObject, qt_meta_stringdata_MainProductionVer2VM.data,
      qt_meta_data_MainProductionVer2VM,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *MainProductionVer2VM::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *MainProductionVer2VM::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_MainProductionVer2VM.stringdata0))
        return static_cast<void*>(const_cast< MainProductionVer2VM*>(this));
    return ProductScreenBaseVM::qt_metacast(_clname);
}

int MainProductionVer2VM::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = ProductScreenBaseVM::qt_metacall(_c, _id, _a);
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
        _id -= 9;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 9;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 9;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 9;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 9;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 9;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}
QT_END_MOC_NAMESPACE
