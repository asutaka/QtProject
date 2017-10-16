#ifndef ADJUSTTIMINGVER4_H
#define ADJUSTTIMINGVER4_H
#include <QtQuick/QQuickPaintedItem>
#include "adjusttimingver4_vm.h"
#include "AppTheme/appthememanager.h"

class AdjustTimingVer4 : public QQuickPaintedItem
{
    Q_OBJECT
public:
    AdjustTimingVer4(QQuickItem *parent =0);
    ~AdjustTimingVer4();
    void paint(QPainter *painter);

    Q_INVOKABLE void setDrawTn(QList<int>localTn, QList <QString> stringTn);
    //Q_INVOKABLE void setTheme(int indexTheme);
private:
    AdjustTimingVer4_VM *adjustVM;
    void drawLegendLine(QPainter*qp);
    void createList();
    void DrawTn(QPainter *qp,QColor color,QPoint start,QString strTn,int maxX,int preTnX);
    QList<int> lineImport;
    QList<int>local;
    QList<QString> titleTn;
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

#endif // ADJUSTTIMINGVER4_H
