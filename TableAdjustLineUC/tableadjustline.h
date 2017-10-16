#ifndef TABLEADJUSTLINE_H
#define TABLEADJUSTLINE_H

#include <QtQuick/QQuickPaintedItem>
#include <QColor>
#include <QPixmap>
#include <QTimer>
#include <QElapsedTimer>
#include <QList>

#include "adjustline.h"

class TableAdjustLine
{
public:
    TableAdjustLine();
    ~TableAdjustLine();

    int _beginNum;
    int _cellHeight;
    int _celltitleWidth;
    int _cellWidth;
    int _ColumnCount;
    int _stepCount;

    QList<AdjustLine*> ListItem;
    QList<AdjustLine*> CreateListItem();

    void DrawControl(QPainter *qp, QPoint pos);
    int GetLineNoOfColumnSelected(QPoint posClick, QPoint posBegin);
    void SelectColumnWithLine(int lineNo);

private:

signals:

public slots:

protected:

};
#endif // TABLEADJUSTLINE_H
