#ifndef PRODUCTIONSCREENCONTROL_VER3_H
#define PRODUCTIONSCREENCONTROL_VER3_H

#include <QtQuick/QQuickPaintedItem>
#include <QColor>
#include <QPainter>
#include <QPixmap>
#include <QTimer>
#include "AppTheme/appthememanager.h"

class ProductionScreenControl_ver3 : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QPixmap imgMassBarGraphBgk READ imgMassBarGraphBgk WRITE setImgMassBarGraphBgk)
    Q_PROPERTY(QPixmap imgMassBarGraph READ imgMassBarGraph WRITE setImgMassBarGraph)
    Q_PROPERTY(QPixmap imgBarLimit READ imgBarLimit WRITE setImgBarLimit)
    Q_PROPERTY(QPixmap imgAverage READ imgAverage WRITE setImgAverage)
    Q_PROPERTY(QPixmap imgDetect READ imgDetect WRITE setImgDetect)
    Q_PROPERTY(QPixmap imgLineBkg READ imgLineBkg WRITE setImgLineBkg)
    Q_PROPERTY(QList<QPixmap> imgLineResult READ imgLineResult WRITE setImgLineResult)
    Q_PROPERTY(QList<QPixmap> imgProductReason READ imgProductReason WRITE setImgProductReason)
    Q_PROPERTY(QString txtMeasureUnit READ txtMeasureUnit WRITE setTxtMeasureUnit)
    Q_PROPERTY(QString txtMeasureValue READ txtMeasureValue WRITE setTxtMeasureValue)
    Q_PROPERTY(QString txtLineTitle READ txtLineTitle WRITE setTxtLineTitle)
    Q_PROPERTY(int maxLine READ maxLine WRITE setMaxLine)
    Q_PROPERTY(int prodResult READ prodResult WRITE setProdResult)
    Q_PROPERTY(QPixmap imgProductResult READ imgProductResult WRITE setImgProductResult)
    Q_PROPERTY(QFont fontText READ fontText WRITE setFontText)
    Q_PROPERTY(int widtMassBar READ widtMassBar WRITE setWidtMassBar)
    Q_PROPERTY(int widtMassBarResult READ widtMassBarResult WRITE setWidtMassBarResult)

public:
    explicit ProductionScreenControl_ver3();

    QPixmap imgMassBarGraphBgk();
    void setImgMassBarGraphBgk(QPixmap &value);
    QPixmap imgMassBarGraph();
    void setImgMassBarGraph(QPixmap &value);
    QPixmap imgBarLimit();
    void setImgBarLimit(QPixmap &value);
    QPixmap imgAverage();
    void setImgAverage(QPixmap &value);
    QPixmap imgDetect();
    void setImgDetect(QPixmap &value);
    QPixmap imgLineBkg();
    void setImgLineBkg(QPixmap &value);
    QList<QPixmap> imgLineResult();
    void setImgLineResult(QList<QPixmap> &value);
    QList<QPixmap> imgProductReason();
    void setImgProductReason(QList<QPixmap> &value);
    QString txtMeasureUnit();
    void setTxtMeasureUnit(QString &value);
    QString txtMeasureValue();
    void setTxtMeasureValue(QString &value);
    QString txtLineTitle();
    void setTxtLineTitle(QString &value);
    int maxLine();
    void setMaxLine(int &value);
    int prodResult();
    void setProdResult(int &value);
    int widtMassBar();
    void setWidtMassBar(int &value);
    int widtMassBarResult();
    void setWidtMassBarResult(int &value);
    QPixmap imgProductResult();
    void setImgProductResult(QPixmap &value);
    QFont fontText();
    void setFontText(QFont &value);

    void paint(QPainter *painter);

private:
    QPixmap m_MassBarGraphBgk;
    QPixmap m_MassBarGraph;
    QPixmap m_BarLimit;
    QPixmap m_Average;
    QPixmap m_ImgDetect;
    QPixmap m_LineBkg;
    QPixmap m_ImgProductResult;
    QList<QPixmap> m_LineResult;
    QList<QPixmap> m_ImgProductReason;
    QString m_MeasureUnit;
    QString m_MeasureValue;
    QString m_LineTitle;
    QFont m_FontText;
    int m_WidthMassBar = 500;
    int m_WidthMassBarResult = 0;
    int m_ProductResult;
    int m_MaxLine;
};

#endif // PRODUCTIONSCREENCONTROL_VER3_H
