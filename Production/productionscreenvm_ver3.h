#ifndef PRODUCTIONSCREENVM_VER3_H
#define PRODUCTIONSCREENVM_VER3_H

#include "ProdScreenBase/productscreenbasevm.h"
#include <QPixmap>
#include "imgprovider.h"

class ProductionScreenVM_ver3 : public ProductScreenBaseVM
{
    Q_OBJECT
    //Com3A
    Q_PROPERTY(QString txtTotalATitle READ txtTotalATitle CONSTANT)
    Q_PROPERTY(QString txtFeTitle READ txtFeTitle CONSTANT)
    Q_PROPERTY(QString txtSUSTitle READ txtSUSTitle CONSTANT)
    Q_PROPERTY(QString txtTotalAValue READ txtTotalAValue CONSTANT)
    Q_PROPERTY(QString txtFeValue READ txtFeValue CONSTANT)
    Q_PROPERTY(QString txtSUSValue READ txtSUSValue CONSTANT)
    //Production
    Q_PROPERTY(int maxLine READ maxLine CONSTANT)
    Q_PROPERTY(int prodResult READ prodResult CONSTANT)
    Q_PROPERTY(int widtMassBar READ widtMassBar CONSTANT)
    Q_PROPERTY(int widtMassBarResult READ widtMassBarResult CONSTANT)
    Q_PROPERTY(QString txtZero READ txtZero CONSTANT)
    Q_PROPERTY(QPixmap imgMassBarGraphBgk READ imgMassBarGraphBgk CONSTANT)
    Q_PROPERTY(QPixmap imgMassBarGraph READ imgMassBarGraph CONSTANT)
    Q_PROPERTY(QPixmap imgBarLimit READ imgBarLimit CONSTANT)
    Q_PROPERTY(QPixmap imgAverage READ imgAverage CONSTANT)
    Q_PROPERTY(QPixmap imgLineBkg READ imgLineBkg CONSTANT)
    Q_PROPERTY(QPixmap imgDetect READ imgDetect CONSTANT)
    Q_PROPERTY(QPixmap imgProductResult READ imgProductResult CONSTANT)
    Q_PROPERTY(QList<QPixmap> imgLineResult READ imgLineResult CONSTANT)
    Q_PROPERTY(QList<QPixmap> imgProductReason READ imgProductReason CONSTANT)
    Q_PROPERTY(QString txtMeasureUnit READ txtMeasureUnit CONSTANT)
    Q_PROPERTY(QString txtMeasureValue READ txtMeasureValue CONSTANT)
    Q_PROPERTY(QString txtLineTitle READ txtLineTitle CONSTANT)
    Q_PROPERTY(QFont fontText READ fontText CONSTANT)
    Q_PROPERTY(QColor colorTxtZero READ colorTxtZero CONSTANT)

public:
    explicit ProductionScreenVM_ver3();

    QString txtTotalATitle();
    void setTxtTotalATitle(QString &value);
    QString txtFeTitle();
    void setTxtFeTitle(QString &value);
    QString txtSUSTitle();
    void setTxtSUSTitle(QString &value);
    QString txtTotalAValue();
    void setTxtTotalAValue(QString &value);
    QString txtFeValue();
    void setTxtFeValue(QString &value);
    QString txtSUSValue();
    void setTxtSUSValue(QString &value);
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
    QString txtZero();
    void setTxtZero(QString &value);
    QString txtLineTitle();
    int maxLine();
    void setMaxLine(int &value);
    void setTxtLineTitle(QString &value);
    int prodResult();
    void setProdResult(int &value);
    int widtMassBarResult();
    void setWidtMassBarResult(int &value);
    int widtMassBar();
    QPixmap imgProductResult();
    void setImgProductResult(QPixmap &value);
    QFont fontText();
    void setFontText(QFont &value);
    QColor colorTxtZero();
    void setColorTxtZero(QColor &value);

    Q_INVOKABLE int onLoad();
    Q_INVOKABLE void updateProductionContent();
    Q_INVOKABLE void onChangeLanguage();


    enum ProductResult
    {
        OK = 0,
        NG = 1,
    };

private:
    QTimer *m_Timer;
    QString m_TotalATitle;
    QString m_FeTitle;
    QString m_SUSTitle;
    QString m_TotalAValue;
    QString m_FeValue;
    QString m_SUSValue;

    QList<QPixmap> massbarBargraphList;
    QList<QPixmap> averageBarLimitList;
    QList<QPixmap> lineList;
    QList<QPixmap> productReasonList;
    QList<QPixmap> imgDetectList;
    QList<QPixmap> imgProductResultList;

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
    QString m_Zero;
    QString m_LineTitle;
    QFont m_FontText;
    QColor m_ColorTxtZero;

    int m_WidthMassBarResult;
    int m_MaxLine = 12;
    int m_ProductResult;

    int const WIDTH_MASSBAR = 499;

    void LoadImages();

signals:
    void updateValue();

private slots:
    void connectWithTimer();
    void OnGuiEvent(int eventId);
};

#endif // PRODUCTIONSCREENVM_VER3_H
