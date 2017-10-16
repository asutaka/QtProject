/****************************************************************************
** Meta object code from reading C++ file 'bufferedgraphicspanel.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../Control/bufferedGraphicsPanel/bufferedgraphicspanel.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'bufferedgraphicspanel.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_BufferedGraphicsPanel_t {
    QByteArrayData data[16];
    char stringdata0[220];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_BufferedGraphicsPanel_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_BufferedGraphicsPanel_t qt_meta_stringdata_BufferedGraphicsPanel = {
    {
QT_MOC_LITERAL(0, 0, 21), // "BufferedGraphicsPanel"
QT_MOC_LITERAL(1, 22, 17), // "signalDrawControl"
QT_MOC_LITERAL(2, 40, 0), // ""
QT_MOC_LITERAL(3, 41, 9), // "QPainter*"
QT_MOC_LITERAL(4, 51, 7), // "painter"
QT_MOC_LITERAL(5, 59, 12), // "refreshPanel"
QT_MOC_LITERAL(6, 72, 26), // "updateBufferedGraphisPanel"
QT_MOC_LITERAL(7, 99, 12), // "IntervalTime"
QT_MOC_LITERAL(8, 112, 13), // "Interval_Stop"
QT_MOC_LITERAL(9, 126, 13), // "Interval_None"
QT_MOC_LITERAL(10, 140, 12), // "Interval_100"
QT_MOC_LITERAL(11, 153, 12), // "Interval_300"
QT_MOC_LITERAL(12, 166, 12), // "Interval_330"
QT_MOC_LITERAL(13, 179, 12), // "Interval_500"
QT_MOC_LITERAL(14, 192, 13), // "Interval_2000"
QT_MOC_LITERAL(15, 206, 13) // "Interval_5000"

    },
    "BufferedGraphicsPanel\0signalDrawControl\0"
    "\0QPainter*\0painter\0refreshPanel\0"
    "updateBufferedGraphisPanel\0IntervalTime\0"
    "Interval_Stop\0Interval_None\0Interval_100\0"
    "Interval_300\0Interval_330\0Interval_500\0"
    "Interval_2000\0Interval_5000"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_BufferedGraphicsPanel[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       3,   14, // methods
       0,    0, // properties
       1,   34, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   29,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       5,    0,   32,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
       6,    0,   33,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void, 0x80000000 | 3,    4,

 // slots: parameters
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void,

 // enums: name, flags, count, data
       7, 0x0,    8,   38,

 // enum data: key, value
       8, uint(BufferedGraphicsPanel::Interval_Stop),
       9, uint(BufferedGraphicsPanel::Interval_None),
      10, uint(BufferedGraphicsPanel::Interval_100),
      11, uint(BufferedGraphicsPanel::Interval_300),
      12, uint(BufferedGraphicsPanel::Interval_330),
      13, uint(BufferedGraphicsPanel::Interval_500),
      14, uint(BufferedGraphicsPanel::Interval_2000),
      15, uint(BufferedGraphicsPanel::Interval_5000),

       0        // eod
};

void BufferedGraphicsPanel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        BufferedGraphicsPanel *_t = static_cast<BufferedGraphicsPanel *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->signalDrawControl((*reinterpret_cast< QPainter*(*)>(_a[1]))); break;
        case 1: _t->refreshPanel(); break;
        case 2: _t->updateBufferedGraphisPanel(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (BufferedGraphicsPanel::*_t)(QPainter * );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&BufferedGraphicsPanel::signalDrawControl)) {
                *result = 0;
                return;
            }
        }
    }
}

const QMetaObject BufferedGraphicsPanel::staticMetaObject = {
    { &QQuickPaintedItem::staticMetaObject, qt_meta_stringdata_BufferedGraphicsPanel.data,
      qt_meta_data_BufferedGraphicsPanel,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *BufferedGraphicsPanel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *BufferedGraphicsPanel::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_BufferedGraphicsPanel.stringdata0))
        return static_cast<void*>(const_cast< BufferedGraphicsPanel*>(this));
    return QQuickPaintedItem::qt_metacast(_clname);
}

int BufferedGraphicsPanel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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

// SIGNAL 0
void BufferedGraphicsPanel::signalDrawControl(QPainter * _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_END_MOC_NAMESPACE
