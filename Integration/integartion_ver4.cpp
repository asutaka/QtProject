#include "integartion_ver4.h"
#include "screenmng.h"
Integartion_ver4::Integartion_ver4()
{
    LoadImages();
}

Integartion_ver4::~Integartion_ver4()
{}

void Integartion_ver4::connectToBufferedGraphicsPanel(BufferedGraphicsPanel *buffered)
{
    connect(buffered, SIGNAL(signalDrawControl(QPainter*)), this, SLOT(DrawControl(QPainter*)));
    buffered->refreshPanel();
    buffered->setFrequence(BufferedGraphicsPanel::Interval_100);
}

void Integartion_ver4::DrawControl(QPainter *painter)
{
    DrawControlBase_ver7::DrawCom1(painter);
    DrawControlBase_ver7::DrawCom2(painter);
    DrawControlBase_ver7::DrawCom3(painter);

    QPoint point(2, 210);
    QSize graphSize(32, 207);
    int marginLeftOfTable = 2;
    int marginRightOfTable = 2;
    int widthOfTitle = 84;
    int heightText = 30;
    int stepLine = 30;
    int yBeginDrawValue = 395;
    int yOrdinaryMode = 141;
    int stepCount = 8;
    int marginRightOfValue = 3;
    int marginTopOfValue = 4;
    int widthOfLine = (_WIDTH_SCREEN - widthOfTitle - marginLeftOfTable - marginRightOfTable) / _lineNo;
    int yGraphLocation = yBeginDrawValue - graphSize.height();

    _font.setPixelSize(16);
    painter->setFont(_font);
    QPen colorTitle(Qt::white);
    painter->setPen(colorTitle);
#ifdef STUP_DISPLAY_DATA
    QString valueUpLmt = "+0.50";
    QString valueLwLmt = "-0.50";
    QString valueRef = "6.00";
#endif
    painter->drawText(point.x(), 210, widthOfTitle, heightText, Qt::AlignCenter, valueUpLmt);
    painter->drawText(point.x(), 277, widthOfTitle, heightText, Qt::AlignCenter, valueRef);
    painter->drawText(point.x(), 349, widthOfTitle, heightText, Qt::AlignCenter, valueLwLmt);

    _font.setPixelSize(18);
    painter->setFont(_font);
    point.setY(yBeginDrawValue);
#ifdef STUP_DISPLAY_DATA
    QString titleIndiv = "Indiv";
    QString uintIndiv = "g";
    QString titleMean = "Mean";
    QString unitMean = "g";
    QString titleOK = "OK";
    QString unitOK = "pcs";
    QString titleNGPlus = "+NG";
    QString unitNGPlus = "pcs";
    QString titleNGMinus = "-NG";
    QString unitNGMinus = "pcs";
    QString titleEXNG = "EXNG";
    QString unitEXNG = "pcs";
    QString titleEXNG2 = "EXNG2";
    QString unitEXNG2 = "pcs";
#endif
    painter->drawText(point.x() + marginRightOfValue, point.y(), widthOfTitle, heightText, Qt::AlignLeft, titleIndiv);
    painter->drawText(point.x(), point.y(), widthOfTitle - marginRightOfValue, heightText, Qt::AlignRight, uintIndiv);
    point.setY(point.y() + stepLine);
    painter->drawText(point.x() + marginRightOfValue, point.y(), widthOfTitle, heightText, Qt::AlignLeft, titleMean);
    painter->drawText(point.x(), point.y(), widthOfTitle - marginRightOfValue, heightText, Qt::AlignRight, unitMean);
    point.setY(point.y() + stepLine);
    painter->drawText(point.x() + marginRightOfValue, point.y(), widthOfTitle, heightText, Qt::AlignLeft, titleOK);
    painter->drawText(point.x(), point.y(), widthOfTitle - marginRightOfValue, heightText, Qt::AlignRight, unitOK);
    point.setY(point.y() + stepLine);
    painter->drawText(point.x() + marginRightOfValue, point.y(), widthOfTitle, heightText, Qt::AlignLeft, titleNGPlus);
    painter->drawText(point.x(), point.y(), widthOfTitle - marginRightOfValue, heightText, Qt::AlignRight, unitNGPlus);
    point.setY(point.y() + stepLine);
    painter->drawText(point.x() + marginRightOfValue, point.y(), widthOfTitle, heightText, Qt::AlignLeft, titleNGMinus);
    painter->drawText(point.x(), point.y(), widthOfTitle - marginRightOfValue, heightText, Qt::AlignRight, unitNGMinus);
    point.setY(point.y() + stepLine);
    painter->drawText(point.x() + marginRightOfValue, point.y(), widthOfTitle, heightText, Qt::AlignLeft, titleEXNG);
    painter->drawText(point.x(), point.y(), widthOfTitle - marginRightOfValue, heightText, Qt::AlignRight, unitEXNG);
    point.setY(point.y() + stepLine);
    painter->drawText(point.x() + marginRightOfValue, point.y(), widthOfTitle, heightText, Qt::AlignLeft, titleEXNG2);
    painter->drawText(point.x(), point.y(), widthOfTitle - marginRightOfValue, heightText, Qt::AlignRight, unitEXNG2);

    for (int i = 0; i < _lineNo; i++)
    {
        int xCenterOfLine = (i * widthOfLine) + widthOfTitle + (widthOfLine / 2);
        QPoint lineImgLocation(xCenterOfLine - graphSize.width(), 152);
        QPoint statusImgLocation(xCenterOfLine - graphSize.width(), 183);
        QPoint location((i * widthOfLine) + widthOfTitle, 144);

        //Draw line ball
        painter->drawPixmap(lineImgLocation, arrayPixmapLineNo[i]);

        //Draw confirm image
#ifdef STUP_DISPLAY_DATA
        int iStatus = rand() % 3;
#endif
        painter->drawPixmap(statusImgLocation, arrayLineImage[iStatus].GetStatusLine());

        //Draw Up, Low line
        QPen colorUpLowLmt((QColor(46, 46, 46)), 0, Qt::DashLine);
        painter->setPen(colorUpLowLmt);
#ifdef STUP_DISPLAY_DATA
        int upLmtPoint = 174;
        int lwLmtPoint = 34;
#endif
        painter->drawLine(location.x(), yGraphLocation + graphSize.height() - upLmtPoint, location.x() + widthOfLine, yGraphLocation + graphSize.height() - upLmtPoint);
        painter->drawLine(location.x(), yGraphLocation + graphSize.height() - lwLmtPoint, location.x() + widthOfLine, yGraphLocation + graphSize.height() - lwLmtPoint);

        //Draw bar graph
        QRect bkgSrc((imgBarGraph.width() - graphSize.width()) / 2,
                     (imgBarGraph.height() - graphSize.height()) / 2, graphSize.width(), graphSize.height());
        QRect bkgDes(xCenterOfLine, yGraphLocation, graphSize.width(), graphSize.height());
        painter->drawPixmap(bkgDes, imgBarGraph, bkgSrc);
#ifdef STUP_DISPLAY_DATA
        int massBarHeight = rand() % graphSize.height();
#endif
        QRect resultMassBarDes(xCenterOfLine, yGraphLocation + graphSize.height() - massBarHeight, graphSize.width(), massBarHeight);
        QRect resultMassBarSrc(0, 0, graphSize.width(), massBarHeight);
        painter->drawPixmap(resultMassBarDes, arrayLineImage[iStatus].GetBigLineColor(), resultMassBarSrc);

        //Draw ave value
#ifdef STUP_DISPLAY_DATA
        int massBarAve = rand() % (massBarHeight == 0 ? 1 : massBarHeight);
#endif
        painter->drawPixmap(xCenterOfLine + graphSize.width(),
                              yGraphLocation + graphSize.height() - massBarAve - imgAve.height() / 2,
                              imgAve);

        //Draw value
        _font.setPixelSize(16);
        painter->setFont(_font);
        QPen colorValue(QColor(255,217,187));
        painter->setPen(colorValue);
        int xValue = location.x();
        int yValue = yBeginDrawValue + marginTopOfValue;
        QString txtValue;
#ifdef STUP_DISPLAY_DATA
        txtValue = QString::number(rand()% 6000 + 1000);
#endif
        painter->drawText(xValue, yValue, widthOfLine - marginRightOfValue, heightText, Qt::AlignRight, txtValue);
        yValue += stepLine;
        painter->drawText(xValue, yValue, widthOfLine - marginRightOfValue, heightText, Qt::AlignRight, txtValue);
        yValue += stepLine;
        painter->drawText(xValue, yValue, widthOfLine - marginRightOfValue, heightText, Qt::AlignRight, txtValue);
        yValue += stepLine;
        painter->drawText(xValue, yValue, widthOfLine - marginRightOfValue, heightText, Qt::AlignRight, txtValue);
        yValue += stepLine;
        painter->drawText(xValue, yValue, widthOfLine - marginRightOfValue, heightText, Qt::AlignRight, txtValue);
        yValue += stepLine;
        painter->drawText(xValue, yValue, widthOfLine - marginRightOfValue, heightText, Qt::AlignRight, txtValue);
        yValue += stepLine;
        painter->drawText(xValue, yValue, widthOfLine - marginRightOfValue, heightText, Qt::AlignRight, txtValue);

        //Draw border of line
        QPen colorBorderLine(QColor(132,131,133));
        painter->setPen(colorBorderLine);
        point.setX((i + 1) * widthOfLine + widthOfTitle);
        painter->drawLine(point.x(), yOrdinaryMode, point.x(), point.y() + stepLine);
    }

    //Draw border of title
    painter->drawLine(marginLeftOfTable, yOrdinaryMode, marginLeftOfTable, point.y() + stepLine);
    painter->drawLine(widthOfTitle, yOrdinaryMode, widthOfTitle, point.y() + stepLine);

    //Draw border of Indiv, Mean, OK, +NG, -NG, EXNG, EXNG2
    for (int i = 0; i < stepCount; i++)
    {
        painter->drawLine(marginLeftOfTable, point.y() + stepLine, point.x(), point.y() + stepLine);
        point.setY(point.y() - stepLine);
    }
}

void Integartion_ver4::LoadImages()
{
    arrayPixmapLineNo[0].load(":/Images/Number_w24h24_01.png");
    arrayPixmapLineNo[1].load(":/Images/Number_w24h24_02.png");
    arrayPixmapLineNo[2].load(":/Images/Number_w24h24_03.png");
    arrayPixmapLineNo[3].load(":/Images/Number_w24h24_04.png");
    arrayPixmapLineNo[4].load(":/Images/Number_w24h24_05.png");
    arrayPixmapLineNo[5].load(":/Images/Number_w24h24_06.png");
    arrayPixmapLineNo[6].load(":/Images/Number_w24h24_07.png");
    arrayPixmapLineNo[7].load(":/Images/Number_w24h24_08.png");
    arrayPixmapLineNo[8].load(":/Images/Number_w24h24_09.png");
    arrayPixmapLineNo[9].load(":/Images/Number_w24h24_10.png");
    arrayPixmapLineNo[10].load(":/Images/Number_w24h24_11.png");
    arrayPixmapLineNo[11].load(":/Images/Number_w24h24_12.png");

    QPixmap pixmap1;
    QPixmap pixmap2;
    QPixmap pixmap3;
    QPixmap pixmap4;
    QPixmap pixmap5;
    QPixmap pixmap6;
    QPixmap pixmap7;
    QPixmap pixmap8;
    QPixmap pixmap9;

    pixmap1.load(":/Images/bargraph_w32_red.png");
    pixmap2.load(":/Images/bargraph_w3h61_red_.bmp");
    pixmap3.load(":/Images/Icon_w28h28_mNG.png");
    LineImage arrayElem1(pixmap1, pixmap2, pixmap3);
    arrayLineImage[0] = arrayElem1;

    pixmap4.load(":/Images/bargraph_w32_Orange_v2.png");
    pixmap5.load(":/Images/bargraph_w3h61_orange_.bmp");
    pixmap6.load(":/Images/Icon_w28h28_pNG.png");
    LineImage arrayElem2(pixmap4, pixmap5, pixmap6);
    arrayLineImage[1] = arrayElem2;

    pixmap7.load(":/Images/bargraph_w32_green_v2.png");
    pixmap8.load(":/Images/bargraph_w3h61_green_.bmp");
    pixmap9.load(":/Images/Not_Exist.bmp");
    LineImage arrayElem3(pixmap7, pixmap8, pixmap9);
    arrayLineImage[2] = arrayElem3;

    imgBarGraph.load(":/Images/bargraph_w32.png");
    imgAve.load(":/Images/Icon_Ave_w5h7.png");
}

