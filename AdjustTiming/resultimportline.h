#ifndef RESULTIMPORTLINE_H
#define RESULTIMPORTLINE_H

#include <QQuickItem>
#include <QPixmap>
#include <QtQuick/QQuickPaintedItem>
#include <AdjustTiming/resultimportlinecolor.h>

class ResultImportLine
{
public:
     ResultImportLine();
    ~ResultImportLine();
    int isSelect = false;
    int lineNo = 0;
    int importNumber = 0;
    int weight = 1;
    ResultImportLineColor obj;
    void DrawControl(QPainter *qp, QPoint pos);

signals:

public slots:
private:
    QPixmap arrayPixmapLineNo[12];
    void LoadImages();
};

#endif // RESULTIMPORTLINE_H
