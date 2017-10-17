#ifndef ADJUSTLINE_VER2_H
#define ADJUSTLINE_VER2_H

#include <QtQuick/QQuickPaintedItem>
#include <QColor>
#include <QPixmap>
#include <QList>
#include<QSize>
#include <QPainter>

class AdjustLine_ver2 : public QQuickPaintedItem
{
public:
    AdjustLine_ver2();
    ~AdjustLine_ver2();

    int StepCount = 4;
    int CellWidth = 108;
    int CellHeight = 36;
    int LineNo;
    int Corner = 2;
    bool IsLineNoCenter = false;
    bool IsValid = true;
    bool IsSelect = false;
    QList<QString> StepValue;

    QFont FontAdjustLine;
    QColor SelectHighlightColor;
    QColor Step1Bkg;
    QColor StepBkg;
    QColor Step2Color;
    QColor Step3Color;
    QColor Step4Color;
    int Step2Align;
    int Step3Align;
    int Step4Align;

    QString StrStep1Kind;
    QPixmap ImgStep1Kind;

    void paint(QPainter *painter);

private:
    QPixmap _arrLineNo[12];
    QPixmap _arrLineNo_out[12];

    void LoadImages();
    QPixmap GetImageLineNo(int line);
};

#endif // ADJUSTLINE_VER2_H
