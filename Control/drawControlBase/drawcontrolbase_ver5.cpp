#include "drawcontrolbase_ver5.h"
#include <QDebug>
#include <QDateTime>

DrawControlBase_ver5::DrawControlBase_ver5(QQuickItem *parent)
    : QQuickPaintedItem(parent)
{
    isForLine = false;
    isR = true;
    isPass = false;
    currentLine = 1;

    timerDateTime = new QTimer(this);
    connect(timerDateTime, SIGNAL(timeout()), this, SLOT(updateTime()));
    timerDateTime->start(1000);
    startLoadTimer.start();

    timerDrawing = new QTimer(this);
    connect(timerDrawing, SIGNAL(timeout()), this, SLOT(updateDraw()));
    timerDrawing->start(100);
}
DrawControlBase_ver5::~DrawControlBase_ver5()
{
    delete timerDateTime;
    delete timerDrawing;
}
void DrawControlBase_ver5::paint(QPainter *painter)
{
    drawTimer.restart();
    DrawCom1(painter);
    DrawCom2(painter);
    DrawCom3(painter);
    // nMilliseconds = drawTimer.elapsed();
}
void DrawControlBase_ver5::updateDraw()
{
    this->update();
}

void DrawControlBase_ver5::updateTime()
{
    QDate date = QDate::currentDate();
    QTime time = QTime::currentTime();
    QString strYear = QString::number(date.year());
    int month = date.month();
    QString strMonth = QString::number(month);
    if (month < 10)
    {
        strMonth = "0" + strMonth;
    }
    int day = date.day();
    QString strDay = QString::number(day);
    if (day < 10)
    {
        strDay = "0" + strDay;
    }
    int hour = time.hour();
    QString strHour = QString::number(hour);
    if (hour < 10)
    {
        strHour = "0" + strHour;
    }
    int minute = time.minute();
    QString strMinute = QString::number(minute);
    if (minute < 10)
    {
        strMinute = "0" + strMinute;
    }
    QString strDateTime = strYear + "-" + strMonth + "-" + strDay;
    strDateTime += "\n";
    strDateTime += strHour + ":" + strMinute;
}
//Draw rect 1 Integration,ZoomLine
void DrawControlBase_ver5::DrawCom1(QPainter *qp)
{
    //draw border line com1
    qp->setOpacity(0.1);
    QPainterPath path;
    QBrush greyBrush(QColor(255,255,255));
    path.addRoundRect(QRect(10, 10, 315, 80), 5, 5);
    qp->fillPath(path,greyBrush);
    path.addRoundRect(QRect(10, 95, 315, 45), 5, 5);
    qp->fillPath(path,greyBrush);
    pen.setColor(QColor(138,41,8));
    qp->setPen(pen);
    qp->drawRoundedRect(QRect(10, 10, 315, 80), 5, 5);
    qp->drawRoundedRect(QRect(10, 95, 315, 45), 5, 5);
    qp->setOpacity(1);
    pen.setColor(Qt::white);
    pen.setWidth(1);
    pen.setStyle(Qt::SolidLine);
    qp->setPen(pen);
    font.setFamily(":/Images/MS Gothic.ttf");
    font.setPixelSize(23);
    font.setBold(false);
    font.setUnderline(false);
    font.setItalic(false);
    qp->setFont(font);

    // draw text
    qp->drawText(15,35,"Prod");
    qp->drawText(15,120,"LotNo name.");
    qp->drawText(195,120,"Anritsu");

    font.setPixelSize(40);
    qp->setFont(font);
    pen.setColor(QColor(255,217,187));
    qp->setPen(pen);

    qp->drawText(195,65,"001");

    font.setPixelSize(23);
    qp->setFont(font);
    qp->drawText(15,70,"Sample");
    qp->drawPixmap(250,20,pixmap);
}
//Draw rect 2 Integration,ZoomLine
void DrawControlBase_ver5::DrawCom2(QPainter *qp)
{
    //draw border line com2
    qp->setOpacity(0.1);
    QPainterPath path;
    QBrush greyBrush(QColor(255,255,255));
    path.addRoundRect(QRect(330, 10, 225, 130), 5, 5);
    qp->fillPath(path,greyBrush);
    pen.setColor(QColor(132,131,133));
    qp->setPen(pen);
    qp->drawRoundedRect(QRect(330, 10, 225, 130), 5, 5);
    qp->setOpacity(1);

    pen.setColor(Qt::white);
    pen.setWidth(1);
    pen.setStyle(Qt::SolidLine);
    qp->setPen(pen);
    font.setPixelSize(23);
    font.setBold(false);
    font.setUnderline(false);
    font.setItalic(false);
    qp->setFont(font);

    // draw text
    qp->drawText(335,35,"基準値");
    qp->drawText(335,60,"下限値");
    qp->drawText(335,90,"上限値");
    qp->drawText(335,120,"号数");

    qp->drawText(530,35,"g");
    qp->drawText(530,60,"g");
    qp->drawText(530,90,"g");

    pen.setColor(QColor(255,217,187));
    qp->setPen(pen);

    qp->drawText(430,35,"12.0");
    qp->drawText(430,60,"-5.0");
    qp->drawText(430,90,"5.0");
    qp->drawText(430,120,"000号");
}

//Draw rect 3 Integration,ZoomLine
void DrawControlBase_ver5::DrawCom3(QPainter *qp)
{
    //draw border line com3
    qp->setOpacity(0.1);
    QPainterPath path;
    QBrush greyBrush(QColor(255,255,255));
    path.addRoundRect(QRect(560, 10, 160, 130), 5, 5);
    qp->fillPath(path,greyBrush);
    pen.setColor(QColor(132,131,133));
    qp->setPen(pen);
    qp->drawRoundedRect(QRect(560, 10, 160, 130), 5, 5);
    qp->setOpacity(1);

    font.setPixelSize(23);
    font.setBold(false);
    font.setUnderline(false);
    font.setItalic(false);
    qp->setFont(font);
    pen.setColor(Qt::white);
    pen.setWidth(1);
    pen.setStyle(Qt::SolidLine);
    qp->setPen(pen);

    // draw text com3_1
    qp->drawText(565,35, "総数");
    qp->drawText(565,60, "OK");
    qp->drawText(565,90, "NG");

    // draw text com3_2
    pen.setColor(QColor(255,217,187));
    qp->setPen(pen);

    int number = rand()% 1000 + 0;
    qp->drawText(655,35, QString::number(number));
    qp->drawText(655,60, QString::number(number));
    qp->drawText(655,90, QString::number(number));
}
void DrawControlBase_ver5::setNumSelect(int _lineNo,int _numSelect)
{
    lineNo =_lineNo;
    numSelect=_numSelect;
}

void DrawControlBase_ver5::getIsLeft(bool _isLeft, int _btnID, int _screenID)
{
    if (_screenID == 4) {
        switch (_btnID) {
        case 0:
            isForLine = _isLeft;
            break;
        case 1:
            isR = _isLeft;
            break;
        case 2:
            isPass = _isLeft;
        default:
            break;
        }
    }
    this->update();
}
void DrawControlBase_ver5::getCurrentLine(int _currentLine)
{
    currentLine = _currentLine;
    this->update();
}
void DrawControlBase_ver5::getIntervalValue(int _interval)
{
    timerDrawing->stop();
    timerDrawing->start(_interval);
}

