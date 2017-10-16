#ifndef TABLEADJUSTLINE_VER2_H
#define TABLEADJUSTLINE_VER2_H

#include <QtQuick/QQuickPaintedItem>
#include <QColor>
#include <QPixmap>
#include <QTimer>
#include <QElapsedTimer>
#include <QList>
#include <QPainter>

#include "adjustline_ver2.h"

class TableAdjustLine_ver2 : public QQuickPaintedItem
{
    Q_OBJECT
public:
    TableAdjustLine_ver2();
    ~TableAdjustLine_ver2();

    bool IsSelect = true;
    int StepCount = 4;
    int BeginNum = 1;
    int ColCount = 6;
    int CellWidth = 108;
    int CellHeight = 36;
    int Corner = 0;
    int Step2Align;
    int Step3Align;
    int Step4Align;
    QColor Step1Bkg;
    QColor StepBkg;
    QColor Step2Color;
    QColor Step3Color;
    QColor Step4Color;
    QColor SelectHighlightColor;
    QFont FontTableLine;

    int ItemNameWidth = 150;
    bool IsShowItemName = true;
    QList<QString> ItemNameList;
    QColor ItemNameColor;
    QColor ItemNameBkg;

    QList<AdjustLine_ver2*> AdjustLineList;

    void paint(QPainter *painter);
    void CreateListItem();
    int GetLineNoOfColumnSelected(QPoint posClick);
    void SelectColumnWithLine(int lineNo);
};

#endif // TABLEADJUSTLINE_VER2_H
