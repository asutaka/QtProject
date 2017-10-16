#include "senscorrstep.h"
#include <QPainter>
#include <QColor>
#include <QList>
#include <QDebug>

SensCorrStep::SensCorrStep(QQuickItem *parent):QQuickPaintedItem(parent)
{
    CreateListTable();
}
SensCorrStep::~SensCorrStep()
{

}
void SensCorrStep::paint(QPainter *painter)
{
    painter -> fillRect(0,0,1024,640, QColor(234, 241, 221));
    DrawTitle(painter);
    DrawTable(painter);
}
void SensCorrStep::DrawTitle(QPainter *gp)
{
    QPen pen(Qt::black,1,Qt::SolidLine);
    gp->setPen(pen);

    QFont font(":/Images/MS Gothic.ttf", 20, QFont::Normal);
    font.setPixelSize(27);
    gp->setFont(font);
}
void SensCorrStep::DrawTable(QPainter *gp)
{
    QPoint posBegin (x_begin, y_begin);
    for(int i=0;i<ListTable.count();i++)
    {
        ListTable[i]->DrawControl(gp, posBegin);
        posBegin.setY(posBegin.y()+CellHeight*stepCount+6);
    }
}
QList<TableAdjustLine*> SensCorrStep::CreateListTable()
{
    if (ListTable.count() > 0)
    {
        ListTable.clear();
    }
    numberOfTable = maxLine/numberColumnOfTable;
    if(maxLine%numberColumnOfTable)
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
        table->_stepCount = stepCount;
        table->CreateListItem();
        ListTable.append(table);
    }
    return ListTable;
}
void SensCorrStep::onClickToSeclectLinePanel(float x, float y)
{
    QPoint posClick(x,y);
    for (int i = 0; i < ListTable.count(); i++)
    {
        int x_begin_table = x_begin + 152;
        int x_finish_table = x_begin_table + (CellWidth+1)*6 - 1;
        int y_begin_table = y_begin + (CellHeight*stepCount+ stepCount - 1) * i + 5*i;
        int y_finish_table = y_begin_table + CellHeight*stepCount + stepCount - 1;
        QPoint posBegin(x_begin_table, y_begin_table);

        if (posClick.x() > x_begin_table && posClick.x() < x_finish_table && posClick.y() > y_begin_table && posClick.y()< y_finish_table)
        {
            int lineNo = ListTable[i]->GetLineNoOfColumnSelected(posClick, posBegin) + 6*i;
            if (lineNo > 0 && lineNo <= maxLine)
            {
                ListTable[i]->SelectColumnWithLine(lineNo);
            }
            break;
        }
    }
    updateDraw();
}
void SensCorrStep::updateDraw()
{
    this->update();
}
void SensCorrStep::selectAll()
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
void SensCorrStep::clearSelection()
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
void SensCorrStep::changeSelection()
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
void SensCorrStep::onClickNext()
{
    for(int i=0;i<ListTable.count();i++)
        for(int j=0;j<ListTable[i]->_ColumnCount;j++)
        {
            if (ListTable[i]->ListItem[j]->isSelected)
            {
                ListTable[i]->ListItem[j]->selectedSensCorr = true;
            }
            else
            {
                ListTable[i]->ListItem[j]->selectedSensCorr = false;
            }
        }
    updateDraw();
}
void SensCorrStep::onClickBack()
{
    for(int i=0;i<ListTable.count();i++)
        for(int j=0;j<ListTable[i]->_ColumnCount;j++)
        {
            ListTable[i]->ListItem[j]->selectedSensCorr=true;
        }
    updateDraw();
}
void SensCorrStep:: onClickStart(int indexStart, bool resultCheck)
{
    if (indexStart == 3)
    {
        QPixmap pixmapResult;
        if (resultCheck)
        {
            pixmapResult.load(":/Images/Pass.png");
        } else
        {
            pixmapResult.load(":/Images/Fail.png");
        }
        for(int i=0;i<ListTable.count();i++)
            for(int j=0;j<ListTable[i]->_ColumnCount;j++)
            {
                if (ListTable[i]->ListItem[j]->selectedSensCorr)
                {
                    ListTable[i]->ListItem[j]->pixmapStep1Kind = pixmapResult;
                }
            }
    } else {
        QString strStep;
        if (indexStart == 1)
        {
            strStep = "--";
        } else {
            strStep = "|";
        }
        for(int i=0;i<ListTable.count();i++)
            for(int j=0;j<ListTable[i]->_ColumnCount;j++)
            {
                if (ListTable[i]->ListItem[j]->selectedSensCorr)
                {
                    ListTable[i]->ListItem[j]->strStep1Kind = strStep;
                }
            }
    }
    updateDraw();
}
