#include "adjustline_ver2.h"
#include "QDebug"

AdjustLine_ver2::AdjustLine_ver2()
{
    LoadImages();
}

AdjustLine_ver2::~AdjustLine_ver2()
{
}

void AdjustLine_ver2::paint(QPainter *painter)
{
    if (StepCount <= 0)
    {
        return;
    }

    int margin = 2;
    QFontMetrics fm(FontAdjustLine);
    int fontHeight = fm.height();
    QPen pen;

    //Draw background step1
    pen.setColor(Step1Bkg);
    painter->setPen(pen);
    QPainterPath pathStep1;
    pathStep1.addRoundedRect(QRectF(this->x(), this->y(), CellWidth, CellHeight), Corner, Corner);
    painter->fillPath(pathStep1, Step1Bkg);
    pen.setColor(Qt::white);
    painter->setPen(pen);
    painter->drawPath(pathStep1);

    //Draw background step2 -> StepCount
    pen.setColor(StepBkg);
    painter->setPen(pen);
    for (int i = 1; i < StepCount; i++)
    {
        int y = this->y() + i * (CellHeight + margin);
        QPainterPath pathStep;
        pathStep.addRoundedRect(QRectF(this->x(), y, CellWidth, CellHeight), Corner, Corner);
        painter->fillPath(pathStep, StepBkg);
        pen.setColor(Qt::white);
        painter->setPen(pen);
        painter->drawPath(pathStep);
    }

    //Draw LineNo
    int x;
    if (IsLineNoCenter == true)
    {
        x = this->x() + (CellWidth / 2) - _arrLineNo[LineNo - 1].width() / 2;
    }
    int y = this->y() + CellHeight / 2 - _arrLineNo[LineNo - 1].width() / 2;
    if (IsValid)
    {
        painter->drawPixmap(x, y,
                            _arrLineNo[LineNo - 1].width(), _arrLineNo[LineNo - 1].height(),
                            _arrLineNo[LineNo - 1]);
    }
    else
    {
        painter->drawPixmap(x, y,
                            _arrLineNo_out[LineNo - 1].width(), _arrLineNo_out[LineNo - 1].height(),
                            _arrLineNo_out[LineNo - 1]);
    }

    x = this->x() + margin;

    //Draw Step1Kind
    if (StrStep1Kind.isNull() == false)
    {
        pen.setColor(QColor(255, 217, 187));
        painter->setPen(pen);
        painter->drawText(x - margin, y, CellWidth, CellHeight, Qt::AlignRight, StrStep1Kind);
    }
    else if (ImgStep1Kind.isNull() == false)
    {
        painter->drawPixmap(x + CellWidth - margin - ImgStep1Kind.width(), y,
                            ImgStep1Kind.width(), ImgStep1Kind.height(), ImgStep1Kind);
    }

    //Draw value
    QColor stepColor[3] = {Step2Color, Step3Color, Step4Color};
    int stepAlign[3] = {Step2Align, Step3Align, Step4Align};
    for (int i = 0; i < StepValue.count(); i++)
    {
        pen.setColor(stepColor[i]);
        painter->setPen(pen);
        y = this->y() + (CellHeight / 2) - (fontHeight / 2) + (i + 1) * CellHeight + margin;
        painter->drawText(x - margin, y, CellWidth, CellHeight, stepAlign[i], StepValue[i]);
    }

    //Draw highlight line selected
    if (IsSelect)
    {
        pen.setColor(SelectHighlightColor);
        painter->setPen(pen);
        QPainterPath pathHighlight;
        pathHighlight.addRoundedRect(QRectF(this->x(), this->y(),
                                            CellWidth, StepCount * CellHeight + ((StepCount - 1) * margin)),
                                     Corner, Corner);
        painter->fillPath(pathHighlight, SelectHighlightColor);
        painter->drawPath(pathHighlight);
    }
}

QPixmap AdjustLine_ver2::GetImageLineNo(int line)
{
    QPixmap imgLineNo;
    imgLineNo.load("");

    if (line > 0)
    {
        if (IsValid)
        {
            imgLineNo = _arrLineNo[line - 1];
        }
        else
        {
            imgLineNo = _arrLineNo_out[line - 1];
        }
    }

    return imgLineNo;
}

void AdjustLine_ver2::LoadImages()
{
    _arrLineNo[0].load(":/Images/Number_w24h24_01.png");
    _arrLineNo[1].load(":/Images/Number_w24h24_02.png");
    _arrLineNo[2].load(":/Images/Number_w24h24_03.png");
    _arrLineNo[3].load(":/Images/Number_w24h24_04.png");
    _arrLineNo[4].load(":/Images/Number_w24h24_05.png");
    _arrLineNo[5].load(":/Images/Number_w24h24_06.png");
    _arrLineNo[6].load(":/Images/Number_w24h24_07.png");
    _arrLineNo[7].load(":/Images/Number_w24h24_08.png");
    _arrLineNo[8].load(":/Images/Number_w24h24_09.png");
    _arrLineNo[9].load(":/Images/Number_w24h24_10.png");
    _arrLineNo[10].load(":/Images/Number_w24h24_11.png");
    _arrLineNo[11].load(":/Images/Number_w24h24_12.png");

    _arrLineNo_out[0].load(":/Images/Number_w24h24_01_out.png");
    _arrLineNo_out[1].load(":/Images/Number_w24h24_02_out.png");
    _arrLineNo_out[2].load(":/Images/Number_w24h24_03_out.png");
    _arrLineNo_out[3].load(":/Images/Number_w24h24_04_out.png");
    _arrLineNo_out[4].load(":/Images/Number_w24h24_05_out.png");
    _arrLineNo_out[5].load(":/Images/Number_w24h24_06_out.png");
    _arrLineNo_out[6].load(":/Images/Number_w24h24_07_out.png");
    _arrLineNo_out[7].load(":/Images/Number_w24h24_08_out.png");
    _arrLineNo_out[8].load(":/Images/Number_w24h24_09_out.png");
    _arrLineNo_out[9].load(":/Images/Number_w24h24_10_out.png");
    _arrLineNo_out[10].load(":/Images/Number_w24h24_11_out.png");
    _arrLineNo_out[11].load(":/Images/Number_w24h24_12_out.png");
}
