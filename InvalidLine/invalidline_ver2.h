#ifndef INVALIDLINE_VER2_H
#define INVALIDLINE_VER2_H

#include <QtQuick/QQuickPaintedItem>
#include <QColor>
#include <QPixmap>
#include <QTimer>
#include <QElapsedTimer>
#include <QList>
#include "TableAdjustLineUC/tableadjustline_ver2.h"

class InvalidLine_ver2 : public QQuickPaintedItem
{
    Q_OBJECT
public:
    InvalidLine_ver2(QQuickItem* parent = 0);
    ~InvalidLine_ver2();

    void paint(QPainter *painter);
    Q_INVOKABLE void clickEnable();
    Q_INVOKABLE void clickDisable();
    Q_INVOKABLE void onClickInvalidLinePanel(float x, float y);
    Q_INVOKABLE void selectAll();
    Q_INVOKABLE void clearSelection();
    Q_INVOKABLE void changeSelection();

private:
    int _maxLine = 12;
    QList<TableAdjustLine_ver2*> ListTable;

    void DrawTitle(QPainter*);
    void DrawTable(QPainter*);
    void CreateListTable();
    void UpdateData();
    QList<QString> GetItemNameList();
};

#endif // INVALIDLINE_VER2_H
