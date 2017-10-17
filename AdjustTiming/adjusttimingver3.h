#ifndef ADJUSTTIMINGVER3_H
#define ADJUSTTIMINGVER3_H
#include <QtQuick/QQuickPaintedItem>
#include <QColor>
#include <QQuickItem>
#include <QPainterPath>
#include <QList>
#include "AppTheme/appthememanager.h"

class AdjustTimingVer3: public QQuickPaintedItem
{
    Q_OBJECT

public:
    AdjustTimingVer3(QQuickItem *parent =0);
    ~AdjustTimingVer3();
    void paint(QPainter *painter);
//    Q_INVOKABLE QString clearLegend(bool isAll);
//    Q_INVOKABLE QString changeLineActive(int mouseX, int mouseY);
//    Q_INVOKABLE QString updateListResultImportLine(QList<int> line);
    Q_INVOKABLE void setDrawTn(QList<int>localTn);
public:
    //draw axis option, set before call drawAxisLine
    struct AxisOption {
      qreal distanceX = 0;
      qreal distanceY = 0;
      bool drawGridY = false;
      bool drawGridX = false;
      QString color = "#000000";
    };

private:
    void drawLegendLine(QPainter*qp);
    void createList();
    void DrawTn(QPainter *qp,QColor color,QPoint start,QString strTn,int maxX,int preTnX);
    void DrawTn2(QPainter *qp,QColor color,QPoint start,QString strTn,int maxX,int preTnX);
    QList<int> lineImport;
    QList<int>local;
    //QList<ResultImportLine*> listResultImportLine;
    int _MAX_LINE_NO = 12;
    int _ColumnCount = 6;
    int _beginNum;
    int countClear = 0;
    int importCount = 0;
    int indexLineActive = 1;
    bool isDrawTn = false;
    QMap<void*, AxisOption> mAxisOption;

signals:
public slots:

   /*
    * Rule: alway set option for axis with each chart before call  drawAxisLine function
    */
    Q_INVOKABLE void setAxisOption(QQuickItem* _item, QString _color, qreal _distanceX, qreal _distanceY, bool _drawGridX, bool _drawGridY) {
        AxisOption option;
        option.color = _color;
        option.distanceX = _distanceX;
        option.distanceY = _distanceY;
        option.drawGridX = _drawGridX;
        option.drawGridY = _drawGridY;

        mAxisOption.insert(_item, option);
    }

    Q_INVOKABLE void drawAxisLine(QQuickItem *item, QPainter *painter);
protected:
};

#endif // ADJUSTTIMINGVER3_H
