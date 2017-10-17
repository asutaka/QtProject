#include "testframework.h"

TestFramework::TestFramework(QQuickItem *parent)
{

}
TestFramework::~TestFramework()
{
}
void TestFramework::paint(QPainter *painter)
{
}

void TestFramework::TestFunction(int a) {
    qDebug() << "Value : " << a;
}

void TestFramework::DrawControl(QQuickItem* item, QPainter *painter)
{
    QString text = "Test";
    QPoint point(3, 3);
    QSize size(item->width() - (2 * point.x()), item->height() - (2 * point.y()));
    int marginTop = 5;
    int heightPath2 = 45;
    int heightPath1 = size.height() - heightPath2 - marginTop;

    QPen pen;
    pen.setColor(QColor(132, 131, 133));
    painter->setPen(pen);
    painter->drawRoundedRect(QRect(point.x(), point.y(), size.width(), heightPath1), 5, 5);
    painter->drawRoundedRect(QRect(point.x(), point.y() + heightPath1 + marginTop, size.width(), heightPath2), 5, 5);
    painter->setOpacity(1);
    pen.setColor(Qt::white);
    pen.setWidth(1);
    pen.setStyle(Qt::SolidLine);
    painter->setPen(pen);

    QFont font;
    font.setFamily(":/Fonts/MS Gothic.ttf");
    font.setPixelSize(23);
    font.setBold(false);
    font.setUnderline(false);
    font.setItalic(false);
    painter->setFont(font);

    // draw text
    QFontMetrics fm(font);
    int heightFont = fm.height();
    painter->drawText(point.x() + 5, point.y() + 5, size.width(), heightPath1, Qt::AlignLeft, text);
}
