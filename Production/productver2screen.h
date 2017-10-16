#ifndef PRODUCTIONVER2SCREENVM_H
#define PRODUCTIONVER2SCREENVM_H
#include "QtQuick/QQuickPaintedItem"
#include <QPainter>
#include <QPixmap>
#include <QTimer>
#include <QElapsedTimer>
#include <QPen>
#include <QFont>
#include "mainproductionver2vm.h"

class ProductVer2Screen : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(bool isXBar READ isXBar WRITE setIsXBar)
    Q_PROPERTY(QString measureValue READ getMeasureValue WRITE setMeasureValue)
    Q_PROPERTY(QString measureUnit READ getMeasureUnit WRITE setMeasureUnit)
//    Q_PROPERTY(qreal measureValueXbar READ getMeasureValueXbar WRITE setMeasureValueXbar)

    Q_PROPERTY(QList<QPixmap> arrPixmapLineNo READ getArrPixmapLineNo WRITE setArrPixmapLineNo CONSTANT)
    Q_PROPERTY(QList<QPixmap> arrMassbarBargraph READ getArrMassbarBargraph WRITE setArrMassbarBargraph CONSTANT)
    Q_PROPERTY(QList<QPixmap> arrStatusLineNo READ getArrStatusLineNo WRITE setArrStatusLineNo CONSTANT)

public:
    ProductVer2Screen(QQuickItem *parent=0);
    ~ProductVer2Screen();
    void paint(QPainter *painter);
    void drawProd(QPainter *painter);
    void drawXBar(QPainter *painter);

    bool isXBar();
    void setIsXBar(bool &value);
    QString getMeasureValue();
    void setMeasureValue(QString &value);
    QString getMeasureUnit();
    void setMeasureUnit(QString &value);
//    qreal getMeasureValueXbar();
//    void setMeasureValueXbar(qreal &value);

    QList<QPixmap> getArrPixmapLineNo();
    void setArrPixmapLineNo(QList<QPixmap> &value);
    QList<QPixmap> getArrMassbarBargraph();
    void setArrMassbarBargraph(QList<QPixmap> &value);
    QList<QPixmap> getArrStatusLineNo();
    void setArrStatusLineNo(QList<QPixmap> &value);

    QPen pen;
    QFont font;
    QPixmap pixmap;
    Q_INVOKABLE QString getBackGroundColorFromVM();

private:
    bool m_IsXbar = false;
    QList<QPixmap> m_arrPixmapLineNo;
    QList<QPixmap> m_arrMassbarBargraph;
    QList<QPixmap> m_arrStatusLineNo;
    QString m_MeasureValue;
    QString m_MeasureUnit;
//    qreal m_MeasureValueXbar;
    int m_LineNo = 12;
};

#endif // PRODUCTIONVER2SCREENVM_H
