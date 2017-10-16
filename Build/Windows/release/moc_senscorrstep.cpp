/****************************************************************************
** Meta object code from reading C++ file 'senscorrstep.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../SensitiveCorrection/senscorrstep.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'senscorrstep.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_SensCorrStep_t {
    QByteArrayData data[14];
    char stringdata0[156];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_SensCorrStep_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_SensCorrStep_t qt_meta_stringdata_SensCorrStep = {
    {
QT_MOC_LITERAL(0, 0, 12), // "SensCorrStep"
QT_MOC_LITERAL(1, 13, 25), // "onClickToSeclectLinePanel"
QT_MOC_LITERAL(2, 39, 0), // ""
QT_MOC_LITERAL(3, 40, 1), // "x"
QT_MOC_LITERAL(4, 42, 1), // "y"
QT_MOC_LITERAL(5, 44, 11), // "onClickNext"
QT_MOC_LITERAL(6, 56, 9), // "selectAll"
QT_MOC_LITERAL(7, 66, 14), // "clearSelection"
QT_MOC_LITERAL(8, 81, 15), // "changeSelection"
QT_MOC_LITERAL(9, 97, 10), // "updateDraw"
QT_MOC_LITERAL(10, 108, 11), // "onClickBack"
QT_MOC_LITERAL(11, 120, 12), // "onClickStart"
QT_MOC_LITERAL(12, 133, 10), // "indexStart"
QT_MOC_LITERAL(13, 144, 11) // "resultCheck"

    },
    "SensCorrStep\0onClickToSeclectLinePanel\0"
    "\0x\0y\0onClickNext\0selectAll\0clearSelection\0"
    "changeSelection\0updateDraw\0onClickBack\0"
    "onClickStart\0indexStart\0resultCheck"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_SensCorrStep[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    2,   54,    2, 0x02 /* Public */,
       5,    0,   59,    2, 0x02 /* Public */,
       6,    0,   60,    2, 0x02 /* Public */,
       7,    0,   61,    2, 0x02 /* Public */,
       8,    0,   62,    2, 0x02 /* Public */,
       9,    0,   63,    2, 0x02 /* Public */,
      10,    0,   64,    2, 0x02 /* Public */,
      11,    2,   65,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void, QMetaType::Float, QMetaType::Float,    3,    4,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int, QMetaType::Bool,   12,   13,

       0        // eod
};

void SensCorrStep::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        SensCorrStep *_t = static_cast<SensCorrStep *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->onClickToSeclectLinePanel((*reinterpret_cast< float(*)>(_a[1])),(*reinterpret_cast< float(*)>(_a[2]))); break;
        case 1: _t->onClickNext(); break;
        case 2: _t->selectAll(); break;
        case 3: _t->clearSelection(); break;
        case 4: _t->changeSelection(); break;
        case 5: _t->updateDraw(); break;
        case 6: _t->onClickBack(); break;
        case 7: _t->onClickStart((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2]))); break;
        default: ;
        }
    }
}

const QMetaObject SensCorrStep::staticMetaObject = {
    { &QQuickPaintedItem::staticMetaObject, qt_meta_stringdata_SensCorrStep.data,
      qt_meta_data_SensCorrStep,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *SensCorrStep::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *SensCorrStep::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_SensCorrStep.stringdata0))
        return static_cast<void*>(const_cast< SensCorrStep*>(this));
    return QQuickPaintedItem::qt_metacast(_clname);
}

int SensCorrStep::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickPaintedItem::qt_metacall(_c, _id, _a);
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
    return _id;
}
QT_END_MOC_NAMESPACE
