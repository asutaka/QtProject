#include "tableadjustline.h"
#include <QPainter>
#include <QDebug>
#include <QDateTime>

TableAdjustLine::TableAdjustLine()
{
}
TableAdjustLine::~TableAdjustLine()
{
}
void TableAdjustLine::DrawControl(QPainter *qp, QPoint pos)
{
    //Draw Title of Table
    QRect qRect(pos.x(),pos.y(),_celltitleWidth,_cellHeight);
    qp->fillRect(qRect,QColor(222,231,247));

    QRect qRect1(pos.x(),pos.y() + _cellHeight + 1,_celltitleWidth,_cellHeight);
    qp->fillRect(qRect1,QColor(222,231,247));

    //Draw Text of Title
    QPen pen(Qt::black, 1, Qt::SolidLine);
    qp->setPen(pen);
    QFont font(":/Images/MS Gothic.ttf", 15, QFont::Normal);
    font.setPixelSize(20);
    qp->setFont(font);
    qp->drawText(pos.x() + 10,pos.y() + 60,"Weight");
    qp->drawText(pos.x() + _celltitleWidth - 20,pos.y() + 60,"g");

    if (_stepCount == 3)
    {
        QRect qRect2(pos.x(),pos.y() + (_cellHeight + 1)*2,_celltitleWidth,_cellHeight);
        qp->fillRect(qRect2,QColor(222,231,247));
        qp->drawText(pos.x() + 10,pos.y() + _cellHeight + 1 + 60,"Level");
    }

    //Create List Item
    if (ListItem.count()== 0)
    {
        CreateListItem();
    }

    //Draw Item
    QPoint pos1(pos.x() + _celltitleWidth + 1, pos.y());
    for (int i = 0; i < ListItem.count(); i++)
    {
        ListItem[i]->DrawControl(qp,pos1);
        pos1.setX(pos1.x() + _cellWidth + 1);
    }
}
QList<AdjustLine*> TableAdjustLine::CreateListItem()
{
    if (ListItem.count() != 0)
    {
        ListItem.clear();
    }
    int currentCount = _beginNum;
    for (int i = 0; i < _ColumnCount; i++)
    {
        AdjustLine* temp = new AdjustLine();
        temp->LineNo = currentCount;
        temp->stepCount = _stepCount;
        temp->cellHeight = _cellHeight;
        temp->cellWidth = _cellWidth;
        temp->isSelected = false;
        temp->isValid = true;
        ListItem.append(temp);
        currentCount++;
    }
    return ListItem;
}
int TableAdjustLine::GetLineNoOfColumnSelected(QPoint posClick, QPoint posBegin)
{
    int lineNo = 0;
    int x_begin_item = posBegin.x();
    int y_begin_item = posBegin.y();
    int y_finish_item = y_begin_item + _cellHeight*_stepCount + _stepCount - 1;

    for (int i = 0; i < ListItem.count(); i++)
    {
        int x_finish_item = x_begin_item + _cellWidth;
        if (posClick.x()> x_begin_item && posClick.x() < x_finish_item && posClick.y() > y_begin_item && posClick.y()< y_finish_item)
        {
            lineNo = i + 1;
            return lineNo;
        }
        x_begin_item = x_finish_item + 1;
    }
    return lineNo;
}
void TableAdjustLine::SelectColumnWithLine(int lineNo)
{
    if (ListItem.count() != 0)
    {
     int index = lineNo%_ColumnCount;
     if (index == 0)
     {
        index = _ColumnCount - 1;
     }
     else
     {
         index -= 1;
     }
     ListItem[index]->isSelected = !ListItem[index]->isSelected;
    }
}
