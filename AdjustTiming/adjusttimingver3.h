#ifndef ADJUSTTIMINGVER3_H
#define ADJUSTTIMINGVER3_H
#include <QtQuick/QQuickPaintedItem>
#include <QColor>
#include <QQuickItem>
#include <QPainterPath>
#include <QList>

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
private:
    void drawLegendLine(QPainter*qp);
    void createList();
    void DrawTn(QPainter *qp,QColor color,QPoint start,QString strTn,int maxX,int preTnX);
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
signals:
public slots:
protected:
};

#endif // ADJUSTTIMINGVER3_H
