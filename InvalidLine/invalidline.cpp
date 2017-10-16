#include "invalidline.h"
#include <QPainter>
#include <QDebug>
#include <QDateTime>
#include <QList>
#include <QMessageBox>

InvalidLine::InvalidLine(QQuickItem *parent)
    : QQuickPaintedItem(parent)
{
    beginNum = 0;
    maxline = 12;
    numberColumnOfTable = 6;
    x_begin = 90;
    y_begin = 200;
    CellHeight = 36;
    CellWidth = 108;
    StepCount = 2;
    CreateListTable();
}
InvalidLine::~InvalidLine()
{
}
void InvalidLine::paint(QPainter *painter)
{
    painter->fillRect(0, 0, 1024, 640, QColor(234, 241, 221));
    DrawTitle(painter);
    DrawTable(painter);
}
void InvalidLine::DrawTitle(QPainter *qp)
{
    QPen pen(Qt::black, 1, Qt::SolidLine);
    qp->setPen(pen);

    QFont font(":/Images/MS Gothic.ttf", 20, QFont::Normal);
    font.setPixelSize(27);
    qp->setFont(font);

    // draw text
    qp->drawText(15,30,"This is the title of this screen");

}
void InvalidLine::DrawTable(QPainter *qp)
{
    QPoint posBegin(x_begin, y_begin);
    for (int i = 0; i < ListTable.count(); i++)
    {
        ListTable[i]->DrawControl(qp,posBegin);
        posBegin.setY(posBegin.y()+ CellHeight*StepCount + StepCount - 1 + 5);
    }
}
QList<TableAdjustLine*> InvalidLine::CreateListTable()
{
    if (ListTable.count() > 0)
    {
        ListTable.clear();
    }
    numberOfTable = maxline/numberColumnOfTable;
    if(maxline%numberColumnOfTable)
    {
        numberOfTable += 1;
    }

    for (int i = 0; i < numberOfTable; i++)
    {
        beginNum = numberColumnOfTable*i + 1;

        TableAdjustLine* table = new TableAdjustLine();
        table->_beginNum = beginNum;
        table->_cellHeight = CellHeight;
        table->_celltitleWidth = 150;
        table->_cellWidth = CellWidth;
        table->_ColumnCount = numberColumnOfTable;
        table->_stepCount = StepCount;
        table->CreateListItem();
        ListTable.append(table);
    }
    return ListTable;
}
void InvalidLine::onClickInvalidLinePanel(float x, float y)
{
    QPoint posClick(x,y);
    for (int i = 0; i < ListTable.count(); i++)
    {
        int x_begin_table = x_begin + 152;
        int x_finish_table = x_begin_table + (CellWidth+1)*numberColumnOfTable - 1;
        int y_begin_table = y_begin + (CellHeight*StepCount + StepCount - 1 + 5)*i;
        int y_finish_table = y_begin_table + CellHeight*StepCount + StepCount - 1;
        QPoint posBegin(x_begin_table, y_begin_table);

        if (posClick.x() > x_begin_table && posClick.x() < x_finish_table && posClick.y() > y_begin_table && posClick.y()< y_finish_table)
        {
            int lineNo = ListTable[i]->GetLineNoOfColumnSelected(posClick, posBegin) + 6*i;
            if (lineNo > 0 && lineNo <= maxline)
            {
                ListTable[i]->SelectColumnWithLine(lineNo);
            }
            break;
        }
    }
    updateDraw();
}
void InvalidLine::updateDraw()
{
    this->update();
}
void InvalidLine::clickEnable()
{
    int count = 0;
    for(int i = 0; i < ListTable.count(); i++)
    {
        for (int j = 0; j < ListTable[i]->_ColumnCount; j++)
        {
            if (ListTable[i]->ListItem[j]->isSelected)
            {
                ListTable[i]->ListItem[j]->isValid = true;
                count++;
            }
            ListTable[i]->ListItem[j]->isSelected = false;
        }
    }
    updateDraw();
}
void InvalidLine::clickDisable()
{
    for(int i = 0; i < ListTable.count(); i++)
    {
        for (int j = 0; j < ListTable[i]->_ColumnCount; j++)
        {
            if (ListTable[i]->ListItem[j]->isSelected)
            {
                ListTable[i]->ListItem[j]->isValid = false;
            }
            ListTable[i]->ListItem[j]->isSelected = false;
        }
    }
    updateDraw();
}
void InvalidLine::selectAll()
{
    for(int i = 0; i < ListTable.count(); i++)
    {
        for (int j = 0; j < ListTable[i]->_ColumnCount; j++)
        {
            ListTable[i]->ListItem[j]->isSelected = true;
        }
    }
    updateDraw();
}
void InvalidLine::clearSelection()
{
    for(int i = 0; i < ListTable.count(); i++)
    {
        for (int j = 0; j < ListTable[i]->_ColumnCount; j++)
        {
            ListTable[i]->ListItem[j]->isSelected = false;
        }
    }
    updateDraw();
}
void InvalidLine::changeSelection()
{
    for(int i = 0; i < ListTable.count(); i++)
    {
        for (int j = 0; j < ListTable[i]->_ColumnCount; j++)
        {
            if (ListTable[i]->ListItem[j]->isSelected)
            {
                ListTable[i]->ListItem[j]->isSelected = false;
            }
            else
            {
                ListTable[i]->ListItem[j]->isSelected = true;
            }
        }
    }
    updateDraw();
}
