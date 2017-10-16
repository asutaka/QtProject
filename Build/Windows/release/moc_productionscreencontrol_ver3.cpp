/****************************************************************************
** Meta object code from reading C++ file 'productionscreencontrol_ver3.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../Production/productionscreencontrol_ver3.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#include <QtCore/QList>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'productionscreencontrol_ver3.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_ProductionScreenControl_ver3_t {
    QByteArrayData data[19];
    char stringdata0[273];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_ProductionScreenControl_ver3_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_ProductionScreenControl_ver3_t qt_meta_stringdata_ProductionScreenControl_ver3 = {
    {
QT_MOC_LITERAL(0, 0, 28), // "ProductionScreenControl_ver3"
QT_MOC_LITERAL(1, 29, 18), // "imgMassBarGraphBgk"
QT_MOC_LITERAL(2, 48, 15), // "imgMassBarGraph"
QT_MOC_LITERAL(3, 64, 11), // "imgBarLimit"
QT_MOC_LITERAL(4, 76, 10), // "imgAverage"
QT_MOC_LITERAL(5, 87, 9), // "imgDetect"
QT_MOC_LITERAL(6, 97, 10), // "imgLineBkg"
QT_MOC_LITERAL(7, 108, 13), // "imgLineResult"
QT_MOC_LITERAL(8, 122, 14), // "QList<QPixmap>"
QT_MOC_LITERAL(9, 137, 16), // "imgProductReason"
QT_MOC_LITERAL(10, 154, 14), // "txtMeasureUnit"
QT_MOC_LITERAL(11, 169, 15), // "txtMeasureValue"
QT_MOC_LITERAL(12, 185, 12), // "txtLineTitle"
QT_MOC_LITERAL(13, 198, 7), // "maxLine"
QT_MOC_LITERAL(14, 206, 10), // "prodResult"
QT_MOC_LITERAL(15, 217, 16), // "imgProductResult"
QT_MOC_LITERAL(16, 234, 8), // "fontText"
QT_MOC_LITERAL(17, 243, 11), // "widtMassBar"
QT_MOC_LITERAL(18, 255, 17) // "widtMassBarResult"

    },
    "ProductionScreenControl_ver3\0"
    "imgMassBarGraphBgk\0imgMassBarGraph\0"
    "imgBarLimit\0imgAverage\0imgDetect\0"
    "imgLineBkg\0imgLineResult\0QList<QPixmap>\0"
    "imgProductReason\0txtMeasureUnit\0"
    "txtMeasureValue\0txtLineTitle\0maxLine\0"
    "prodResult\0imgProductResult\0fontText\0"
    "widtMassBar\0widtMassBarResult"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ProductionScreenControl_ver3[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
      17,   14, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // properties: name, type, flags
       1, QMetaType::QPixmap, 0x00095103,
       2, QMetaType::QPixmap, 0x00095103,
       3, QMetaType::QPixmap, 0x00095103,
       4, QMetaType::QPixmap, 0x00095103,
       5, QMetaType::QPixmap, 0x00095103,
       6, QMetaType::QPixmap, 0x00095103,
       7, 0x80000000 | 8, 0x0009510b,
       9, 0x80000000 | 8, 0x0009510b,
      10, QMetaType::QString, 0x00095103,
      11, QMetaType::QString, 0x00095103,
      12, QMetaType::QString, 0x00095103,
      13, QMetaType::Int, 0x00095103,
      14, QMetaType::Int, 0x00095103,
      15, QMetaType::QPixmap, 0x00095103,
      16, QMetaType::QFont, 0x00095103,
      17, QMetaType::Int, 0x00095103,
      18, QMetaType::Int, 0x00095103,

       0        // eod
};

void ProductionScreenControl_ver3::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::RegisterPropertyMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 7:
        case 6:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<QPixmap> >(); break;
        }
    }

#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        ProductionScreenControl_ver3 *_t = static_cast<ProductionScreenControl_ver3 *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QPixmap*>(_v) = _t->imgMassBarGraphBgk(); break;
        case 1: *reinterpret_cast< QPixmap*>(_v) = _t->imgMassBarGraph(); break;
        case 2: *reinterpret_cast< QPixmap*>(_v) = _t->imgBarLimit(); break;
        case 3: *reinterpret_cast< QPixmap*>(_v) = _t->imgAverage(); break;
        case 4: *reinterpret_cast< QPixmap*>(_v) = _t->imgDetect(); break;
        case 5: *reinterpret_cast< QPixmap*>(_v) = _t->imgLineBkg(); break;
        case 6: *reinterpret_cast< QList<QPixmap>*>(_v) = _t->imgLineResult(); break;
        case 7: *reinterpret_cast< QList<QPixmap>*>(_v) = _t->imgProductReason(); break;
        case 8: *reinterpret_cast< QString*>(_v) = _t->txtMeasureUnit(); break;
        case 9: *reinterpret_cast< QString*>(_v) = _t->txtMeasureValue(); break;
        case 10: *reinterpret_cast< QString*>(_v) = _t->txtLineTitle(); break;
        case 11: *reinterpret_cast< int*>(_v) = _t->maxLine(); break;
        case 12: *reinterpret_cast< int*>(_v) = _t->prodResult(); break;
        case 13: *reinterpret_cast< QPixmap*>(_v) = _t->imgProductResult(); break;
        case 14: *reinterpret_cast< QFont*>(_v) = _t->fontText(); break;
        case 15: *reinterpret_cast< int*>(_v) = _t->widtMassBar(); break;
        case 16: *reinterpret_cast< int*>(_v) = _t->widtMassBarResult(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        ProductionScreenControl_ver3 *_t = static_cast<ProductionScreenControl_ver3 *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setImgMassBarGraphBgk(*reinterpret_cast< QPixmap*>(_v)); break;
        case 1: _t->setImgMassBarGraph(*reinterpret_cast< QPixmap*>(_v)); break;
        case 2: _t->setImgBarLimit(*reinterpret_cast< QPixmap*>(_v)); break;
        case 3: _t->setImgAverage(*reinterpret_cast< QPixmap*>(_v)); break;
        case 4: _t->setImgDetect(*reinterpret_cast< QPixmap*>(_v)); break;
        case 5: _t->setImgLineBkg(*reinterpret_cast< QPixmap*>(_v)); break;
        case 6: _t->setImgLineResult(*reinterpret_cast< QList<QPixmap>*>(_v)); break;
        case 7: _t->setImgProductReason(*reinterpret_cast< QList<QPixmap>*>(_v)); break;
        case 8: _t->setTxtMeasureUnit(*reinterpret_cast< QString*>(_v)); break;
        case 9: _t->setTxtMeasureValue(*reinterpret_cast< QString*>(_v)); break;
        case 10: _t->setTxtLineTitle(*reinterpret_cast< QString*>(_v)); break;
        case 11: _t->setMaxLine(*reinterpret_cast< int*>(_v)); break;
        case 12: _t->setProdResult(*reinterpret_cast< int*>(_v)); break;
        case 13: _t->setImgProductResult(*reinterpret_cast< QPixmap*>(_v)); break;
        case 14: _t->setFontText(*reinterpret_cast< QFont*>(_v)); break;
        case 15: _t->setWidtMassBar(*reinterpret_cast< int*>(_v)); break;
        case 16: _t->setWidtMassBarResult(*reinterpret_cast< int*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
    Q_UNUSED(_o);
}

const QMetaObject ProductionScreenControl_ver3::staticMetaObject = {
    { &QQuickPaintedItem::staticMetaObject, qt_meta_stringdata_ProductionScreenControl_ver3.data,
      qt_meta_data_ProductionScreenControl_ver3,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *ProductionScreenControl_ver3::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ProductionScreenControl_ver3::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_ProductionScreenControl_ver3.stringdata0))
        return static_cast<void*>(const_cast< ProductionScreenControl_ver3*>(this));
    return QQuickPaintedItem::qt_metacast(_clname);
}

int ProductionScreenControl_ver3::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickPaintedItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    
#ifndef QT_NO_PROPERTIES
   if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 17;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 17;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 17;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 17;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 17;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 17;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}
QT_END_MOC_NAMESPACE
