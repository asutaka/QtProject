#ifndef MAINPRODUCTIONVER2VM_H
#define MAINPRODUCTIONVER2VM_H
#include "QtQuick/QQuickPaintedItem"
#include <QTimer>
#include <QPixmap>
#include "ProdScreenBase/productscreenbasevm.h"
#include "AppTheme/appthememanager.h"

class MainProductionVer2VM : public ProductScreenBaseVM
{
    Q_OBJECT
    Q_PROPERTY(QString measureValue READ getMeasureValue WRITE setMeasureValue)
    Q_PROPERTY(QString measureUnit READ getMeasureUnit WRITE setMeasureUnit)
//    Q_PROPERTY(qreal measureValueXbar READ getMeasureValueXbar WRITE setMeasureValueXbar)
    Q_PROPERTY(QColor backgroundColor READ getBackgroundColor WRITE setBackgroundColor)
    Q_PROPERTY(bool isXBar READ isXBar WRITE setIsXBar)

    Q_PROPERTY(QList<QPixmap> arrPixmapLineNo READ getArrPixmapLineNo WRITE setArrPixmapLineNo)
    Q_PROPERTY(QList<QPixmap> arrMassbarBargraph READ getArrMassbarBargraph WRITE setArrMassbarBargraph)
    Q_PROPERTY(QList<QPixmap> arrStatusLineNo READ getArrStatusLineNo WRITE setArrStatusLineNo)

    Q_PROPERTY(QString txtProd READ txtProd CONSTANT)
    Q_PROPERTY(QString txtXbar READ txtXbar CONSTANT)

public:
    MainProductionVer2VM();
    ~MainProductionVer2VM();

    // Method
    QString getMeasureValue();
    void setMeasureValue(QString &value);
    QString getMeasureUnit();
    void setMeasureUnit(QString &value);
    QColor getBackgroundColor();
    void setBackgroundColor(QColor &value);
//    qreal getMeasureValueXbar();
//    void setMeasureValueXbar(qreal &value);

    QList<QPixmap> getArrPixmapLineNo();
    void setArrPixmapLineNo(QList<QPixmap> &value);
    QList<QPixmap> getArrMassbarBargraph();
    void setArrMassbarBargraph(QList<QPixmap> &value);
    QList<QPixmap> getArrStatusLineNo();
    void setArrStatusLineNo(QList<QPixmap> &value);

    bool isXBar();
    void setIsXBar(bool &value);
    //SwitchButton
    QString txtProd();
    void txtProd(QString &value);
    QString txtXbar();
    void txtXbar(QString &value);
    //Q_INVOKABLE int OnChangeLanguage();

    Q_INVOKABLE QList <int> setValueToDraw(); //Gen random array data to draw chart
    Q_INVOKABLE QList <QString> setLineColor(); // Set line color [1-12]
    Q_INVOKABLE void updateImgtoProduct();

    void setIndexTheme();

    Q_INVOKABLE void updateMeasureValue();
    Q_INVOKABLE void onChangeLanguage();
    Q_INVOKABLE int getInterval();

    int indexTheme;
private:

    QPixmap m_MassBargraph;
    QPixmap m_LineNo;
    QPixmap m_StatusLineNo;
    QList<QPixmap> m_arrPixmapLineNo;
    QList<QPixmap> m_arrMassbarBargraph;
    QList<QPixmap> m_arrStatusLineNo;
    QString m_MeasureValue;
    QString m_MeasureUnit;
    qreal m_MeasureValueXbar;
    QColor m_BackgroundColor;
    int m_Interval = 700;
    bool m_IsXbar = false;
    int m_MaxLine = 12;
    void LoadImage();
    QString m_txtProd;
    QString m_txtXbar;

};

#endif // MAINPRODUCTIONVER2VM_H
