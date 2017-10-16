#ifndef INVALIDLINE_H
#define INVALIDLINE_H
#include <QtQuick/QQuickPaintedItem>
#include <QColor>
#include <QPixmap>
#include <QTimer>
#include <QElapsedTimer>
#include <QList>
#include "TableAdjustLineUC/tableadjustline.h"

class InvalidLine : public QQuickPaintedItem
{
    Q_OBJECT

public:
    InvalidLine(QQuickItem* parent = 0);
    ~InvalidLine();    

    void paint(QPainter *painter);
    Q_INVOKABLE void onClickInvalidLinePanel(float x, float y);
    Q_INVOKABLE void clickEnable();
    Q_INVOKABLE void clickDisable();
    Q_INVOKABLE void selectAll();
    Q_INVOKABLE void clearSelection();
    Q_INVOKABLE void changeSelection();

private:
    int beginNum;
    int maxline;
    int numberColumnOfTable;
    int numberOfTable;
    int x_begin;
    int y_begin;
    int CellHeight;
    int CellWidth;
    int StepCount;
    bool IsSelected;
    QList<TableAdjustLine*> ListTable;

    void DrawTitle(QPainter*);
    void DrawTable(QPainter*);
    QList<TableAdjustLine*> CreateListTable();

    QPixmap arrayPixmapLineNo[12];
    void UpdateTable();
    void updateDraw();

signals:

public slots:

protected:

};
#endif // INVALIDLINE_H
