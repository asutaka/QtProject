#include "tableadjustline_ver2.h"
#include "QDebug"

TableAdjustLine_ver2::TableAdjustLine_ver2()
{
    SelectHighlightColor = QColor(0, 0, 255, 100);
}

TableAdjustLine_ver2::~TableAdjustLine_ver2()
{

}

void TableAdjustLine_ver2::CreateListItem()
{
    AdjustLineList.clear();
    int currentNum = BeginNum;

    if (IsShowItemName == false)
    {
        ItemNameWidth = 0;
    }

    for (int i = 0; i < ColCount; i++)
    {
        AdjustLine_ver2* adjustLine = new AdjustLine_ver2();
        adjustLine->LineNo = currentNum;
        adjustLine->StepCount = StepCount;
        adjustLine->CellWidth = CellWidth;
        adjustLine->CellHeight = CellHeight;
        adjustLine->Step1Bkg = Step1Bkg;
        adjustLine->StepBkg = StepBkg;
        adjustLine->Step2Color = Step2Color;
        adjustLine->Step2Align = Step2Align;
        adjustLine->Step3Color = Step3Color;
        adjustLine->Step3Align = Step3Align;
        adjustLine->Step4Color = Step4Color;
        adjustLine->Step4Align = Step4Align;
        adjustLine->SelectHighlightColor = SelectHighlightColor;
        adjustLine->FontAdjustLine = FontTableLine;
        AdjustLineList.append(adjustLine);
        currentNum++;
    }
}

void TableAdjustLine_ver2::paint(QPainter *painter)
{
    QFontMetrics fm(FontTableLine);
    int fontHeight = fm.height();
    int margin = 2;

    QPainterPath path;
    QPen pen;

    int itemNameWidth = 0;
    if (IsShowItemName)
    {
        itemNameWidth = ItemNameWidth;
    }

    //Draw border of item name
    pen.setColor(ItemNameBkg);
    painter->setPen(pen);
    for (int i = 0; i < StepCount; i++)
    {
        int y = this->y() + i * (CellHeight + margin);
        path.addRoundedRect(QRectF(this->x(), y, itemNameWidth, CellHeight), Corner, Corner);
        painter->fillPath(path, ItemNameBkg);
        painter->drawPath(path);
    }

    pen.setColor(ItemNameColor);
    painter->setPen(pen);
    painter->setFont(FontTableLine);

    //Draw item name
    for (int i = 0; i < StepCount; i++)
    {
        int y = this->y() + (CellHeight / 2) - (fontHeight / 2) + i * CellHeight + margin;
        painter->drawText(this->x() + margin, y, itemNameWidth, CellHeight, Qt::AlignLeft, ItemNameList[i]);
    }

    //Draw columns
    for (int i = 0; i < AdjustLineList.count(); i++)
    {
        int x = (this->x() + itemNameWidth + margin) + (i * (AdjustLineList[i]->CellWidth + margin));
        AdjustLineList[i]->setX(x);
        AdjustLineList[i]->setY(this->y());
        AdjustLineList[i]->paint(painter);
    }
}

int TableAdjustLine_ver2::GetLineNoOfColumnSelected(QPoint posClick)
{
    int lineNo = 0;
    int margin = 2;
    for (int i = 0; i < AdjustLineList.count(); i++)
    {
        if ((posClick.x() > AdjustLineList[i]->position().x() && posClick.x() < (AdjustLineList[i]->position().x() + AdjustLineList[i]->CellWidth))
            && (posClick.y() > AdjustLineList[i]->position().y() && posClick.y() < (AdjustLineList[i]->position().y() + AdjustLineList[i]->CellHeight * StepCount + (StepCount - 1) * margin)))
        {
            lineNo = AdjustLineList[i]->LineNo;
        }
    }

    return lineNo;
}

void TableAdjustLine_ver2::SelectColumnWithLine(int lineNo)
{
    if (AdjustLineList.count() != 0)
    {
        AdjustLineList[lineNo - BeginNum]->IsSelect = !AdjustLineList[lineNo - BeginNum]->IsSelect;
    }
}
