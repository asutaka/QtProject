#ifndef SENSCORRSTEP_H
#define SENSCORRSTEP_H
#include <QtQuick/QQuickPaintedItem>
#include <QColor>
#include "TableAdjustLineUC/tableadjustline.h"

class SensCorrStep : public QQuickPaintedItem
{
    Q_OBJECT
public:
    SensCorrStep(QQuickItem * parent=0);
    ~SensCorrStep();

        int beginNum=0;
        int maxLine =12;
        int numberColumnOfTable=6;
        int numberOfTable;
        int x_begin = 90;
        int y_begin = 200;
        int CellHeight = 36;
        int CellWidth = 108;
        int stepCount = 3;
        bool IsSelected;
        QList<TableAdjustLine*> ListTable;

        void paint(QPainter *painter);

        Q_INVOKABLE void onClickToSeclectLinePanel(float x, float y);
        Q_INVOKABLE void onClickNext();
        Q_INVOKABLE void selectAll();
        Q_INVOKABLE void clearSelection();
        Q_INVOKABLE void changeSelection();
        Q_INVOKABLE void updateDraw();
        Q_INVOKABLE void onClickBack();
        Q_INVOKABLE void onClickStart(int indexStart, bool resultCheck);

private:
        void DrawTitle(QPainter*);
        void DrawTable(QPainter*);
        QList<TableAdjustLine*> CreateListTable();

        QPixmap arrayPixmapLineNo[12];
        void UpdateTable();
       // void updateDraw();

};
#endif // SENSCORRSTEP_H
