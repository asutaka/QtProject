#include "invalidline_ver2.h"

InvalidLine_ver2::InvalidLine_ver2(QQuickItem *parent)
    : QQuickPaintedItem(parent)
{
    CreateListTable();
    UpdateData();
}

InvalidLine_ver2::~InvalidLine_ver2()
{

}

void InvalidLine_ver2::paint(QPainter *painter)
{
    painter->fillRect(0, 0, 1024, 640, "#212121");
    DrawTitle(painter);
    DrawTable(painter);
}

void InvalidLine_ver2::DrawTitle(QPainter *painter)
{
    QPen pen(Qt::white, 1, Qt::SolidLine);
    painter->setPen(pen);

    QFont font("MS Gothic", 50, QFont::Normal);
    font.setPixelSize(27);
    painter->setFont(font);

    // draw title
#ifdef STUP_DISPLAY_DATA
    QString title = QString("This is the title of this screen");
#endif
    painter->drawText(15, 30, title);

}

void InvalidLine_ver2::DrawTable(QPainter *painter)
{
    for (int i = 0; i < ListTable.count(); i++)
    {
        ListTable[i]->paint(painter);
    }
}

QList<QString> InvalidLine_ver2::GetItemNameList()
{
    QList<QString> itemNameList;
#ifdef STUP_DISPLAY_DATA
    itemNameList.append("");
    itemNameList.append("Weight          g");
#endif

    return itemNameList;
}

void InvalidLine_ver2::CreateListTable()
{
    if (ListTable.count() > 0)
    {
        ListTable.clear();
    }

    int margin = 2;
    int colCount = 6;
    int numberOfTable = _maxLine / colCount;
    int beginNum = 0;
    int corner = 2;
    int stepCount = 2;
    int cellWidth = 108;
    int cellHeight = 36;
    int itemNameWidth = 150;
    int distanceTables = 20;
    int tableWidth = itemNameWidth + colCount * cellWidth + colCount * margin;
    int tableHeight = stepCount * cellHeight + (stepCount - 1) * margin;

    if(_maxLine % colCount)
    {
        numberOfTable += 1;
    }

    for (int i = 0; i < numberOfTable; i++)
    {
        beginNum = colCount * i + 1;

        TableAdjustLine_ver2* table = new TableAdjustLine_ver2();
        table->BeginNum = beginNum;
        table->ItemNameWidth = itemNameWidth;
        table->ColCount = colCount;
        table->StepCount = stepCount;
        table->CellWidth = cellWidth;
        table->CellHeight = cellHeight;
        table->Step2Align = Qt::AlignRight;
        table->Step2Color = QColor(QColor(255, 217, 187));
        table->Step1Bkg = QColor(QColor(247, 150, 66));
        table->StepBkg = QColor(QColor(26, 70, 112));

        QFont mFont;
        mFont.setFamily("MS Gothic");
        mFont.setPixelSize(14);

        table->FontTableLine = mFont;
        table->IsShowItemName = true;
        table->ItemNameBkg = QColor(QColor(187, 213, 227));
        table->ItemNameColor = QColor(Qt::black);
        table->ItemNameList = GetItemNameList();
        table->Corner = corner;
        table->setSize(QSizeF(tableWidth, tableHeight));
        table->setPosition(QPoint(80, 200 + i * (tableHeight + distanceTables)));
        table->CreateListItem();
        ListTable.append(table);
    }
}

void InvalidLine_ver2::UpdateData()
{
    QList<QString> listValue;

    for(int i = 0; i < ListTable.count(); i++)
    {
        for (int j = 0; j < ListTable[i]->AdjustLineList.count(); j++)
        {
            listValue.clear();
            if (ListTable[i]->AdjustLineList[j]->IsValid == true)
            {
#ifdef STUP_DISPLAY_DATA
                listValue.append("0.0");
#endif
                ListTable[i]->AdjustLineList[j]->StepValue = listValue;
            }
            else
            {
#ifdef STUP_DISPLAY_DATA
                listValue.append("--");
#endif
                ListTable[i]->AdjustLineList[j]->StepValue = listValue;
            }

            ListTable[i]->AdjustLineList[j]->IsLineNoCenter = true;
        }
    }

    this->update();
}

void InvalidLine_ver2::clickEnable()
{
    for(int i = 0; i < ListTable.count(); i++)
    {
        for (int j = 0; j < ListTable[i]->ColCount; j++)
        {
            if (ListTable[i]->AdjustLineList[j]->IsSelect)
            {
                ListTable[i]->AdjustLineList[j]->IsValid = true;
            }
            ListTable[i]->AdjustLineList[j]->IsSelect = false;
        }
    }

    UpdateData();
}

void InvalidLine_ver2::clickDisable()
{
    for(int i = 0; i < ListTable.count(); i++)
    {
        for (int j = 0; j < ListTable[i]->ColCount; j++)
        {
            if (ListTable[i]->AdjustLineList[j]->IsSelect)
            {
                ListTable[i]->AdjustLineList[j]->IsValid = false;
            }
            ListTable[i]->AdjustLineList[j]->IsSelect = false;
        }
    }
    UpdateData();
}

void InvalidLine_ver2::onClickInvalidLinePanel(float x, float y)
{
    QPoint posClick(x, y);
    for (int i = 0; i < ListTable.count(); i++)
    {
        if (ListTable[i]->IsSelect &&
            (posClick.x() > ListTable[i]->position().x() && posClick.x() < (ListTable[i]->position().x() + ListTable[i]->width())) &&
            (posClick.y() > ListTable[i]->position().y() && posClick.y() < (ListTable[i]->position().y() + ListTable[i]->height())))
        {
            int lineNo = ListTable[i]->GetLineNoOfColumnSelected(posClick);
            if (lineNo > 0 && lineNo <= _maxLine)
            {
                ListTable[i]->SelectColumnWithLine(lineNo);
                this->update();
                break;
            }
        }
    }
}

void InvalidLine_ver2::onLongPressInvalidLinePanel(float x, float y) {
    QPoint posClick(x,y);
    for (int i = 0; i < ListTable.count(); i++)
    {
        if (ListTable[i]->IsSelect &&
            (posClick.x() > ListTable[i]->position().x() && posClick.x() < (ListTable[i]->position().x() + ListTable[i]->width())) &&
            (posClick.y() > ListTable[i]->position().y() && posClick.y() < (ListTable[i]->position().y() + ListTable[i]->height())))
        {
            int lineNo = ListTable[i]->GetLineNoOfColumnSelected(posClick);
            if (lineNo > 0 && lineNo <= _maxLine)
            {
                int AdjustLineIndex = (lineNo - 1)%ListTable[i]->ColCount;
                ListTable[i]->AdjustLineList[AdjustLineIndex]->IsValid = !(ListTable[i]->AdjustLineList[AdjustLineIndex]->IsValid);
                ListTable[i]->AdjustLineList[AdjustLineIndex]->IsSelect = false;
                UpdateData();
                break;
            }
        }
    }
}

void InvalidLine_ver2::selectAll()
{
    for(int i = 0; i < ListTable.count(); i++)
    {
        for (int j = 0; j < ListTable[i]->ColCount; j++)
        {
            ListTable[i]->AdjustLineList[j]->IsSelect = true;
        }
    }
    this->update();
}

void InvalidLine_ver2::clearSelection()
{
    for(int i = 0; i < ListTable.count(); i++)
    {
        for (int j = 0; j < ListTable[i]->ColCount; j++)
        {
            ListTable[i]->AdjustLineList[j]->IsSelect = false;
        }
    }
    this->update();
}

void InvalidLine_ver2::changeSelection()
{
    for(int i = 0; i < ListTable.count(); i++)
    {
        for (int j = 0; j < ListTable[i]->ColCount; j++)
        {
            ListTable[i]->AdjustLineList[j]->IsSelect = !ListTable[i]->AdjustLineList[j]->IsSelect;
        }
    }
    this->update();
}
