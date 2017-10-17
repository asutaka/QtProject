/****************************************************************************
** Meta object code from reading C++ file 'treeviewmodel.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../Control/model/treeviewmodel.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#include <QtCore/QList>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'treeviewmodel.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_TreeViewModel_t {
    QByteArrayData data[14];
    char stringdata0[136];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_TreeViewModel_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_TreeViewModel_t qt_meta_stringdata_TreeViewModel = {
    {
QT_MOC_LITERAL(0, 0, 13), // "TreeViewModel"
QT_MOC_LITERAL(1, 14, 7), // "getText"
QT_MOC_LITERAL(2, 22, 0), // ""
QT_MOC_LITERAL(3, 23, 9), // "itemIndex"
QT_MOC_LITERAL(4, 33, 9), // "getParent"
QT_MOC_LITERAL(5, 43, 8), // "getIndex"
QT_MOC_LITERAL(6, 52, 11), // "getFullPath"
QT_MOC_LITERAL(7, 64, 9), // "character"
QT_MOC_LITERAL(8, 74, 8), // "addEntry"
QT_MOC_LITERAL(9, 83, 14), // "QList<QString>"
QT_MOC_LITERAL(10, 98, 15), // "listDependEntry"
QT_MOC_LITERAL(11, 114, 11), // "description"
QT_MOC_LITERAL(12, 126, 4), // "name"
QT_MOC_LITERAL(13, 131, 4) // "type"

    },
    "TreeViewModel\0getText\0\0itemIndex\0"
    "getParent\0getIndex\0getFullPath\0character\0"
    "addEntry\0QList<QString>\0listDependEntry\0"
    "description\0name\0type"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_TreeViewModel[] = {

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
       1,    1,   44,    2, 0x02 /* Public */,
       4,    1,   47,    2, 0x02 /* Public */,
       5,    1,   50,    2, 0x02 /* Public */,
       6,    2,   53,    2, 0x02 /* Public */,
       8,    2,   58,    2, 0x02 /* Public */,
       8,    3,   63,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::QString, QMetaType::QModelIndex,    3,
    QMetaType::QString, QMetaType::QModelIndex,    3,
    QMetaType::Int, QMetaType::QModelIndex,    3,
    QMetaType::QString, QMetaType::QModelIndex, QMetaType::QString,    3,    7,
    QMetaType::Void, 0x80000000 | 9, QMetaType::QString,   10,   11,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString,   12,   13,   11,

       0        // eod
};

void TreeViewModel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        TreeViewModel *_t = static_cast<TreeViewModel *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: { QString _r = _t->getText((*reinterpret_cast< const QModelIndex(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 1: { QString _r = _t->getParent((*reinterpret_cast< const QModelIndex(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 2: { int _r = _t->getIndex((*reinterpret_cast< const QModelIndex(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 3: { QString _r = _t->getFullPath((*reinterpret_cast< const QModelIndex(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 4: _t->addEntry((*reinterpret_cast< QList<QString>(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 5: _t->addEntry((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 4:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<QString> >(); break;
            }
            break;
        }
    }
}

const QMetaObject TreeViewModel::staticMetaObject = {
    { &QStandardItemModel::staticMetaObject, qt_meta_stringdata_TreeViewModel.data,
      qt_meta_data_TreeViewModel,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *TreeViewModel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *TreeViewModel::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_TreeViewModel.stringdata0))
        return static_cast<void*>(const_cast< TreeViewModel*>(this));
    return QStandardItemModel::qt_metacast(_clname);
}

int TreeViewModel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QStandardItemModel::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
