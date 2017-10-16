#ifndef LINEIMAGE_H
#define LINEIMAGE_H
#include <QPixmap>


class LineImage
{
public:
    LineImage();
    LineImage(QPixmap,QPixmap,QPixmap);
    ~LineImage();
private:
    QPixmap BigLineColor;
    QPixmap SmallLineColor;
    QPixmap StatusLine;
public:
    QPixmap GetBigLineColor();
    QPixmap GetSmallLineColor();
    QPixmap GetStatusLine();
};

#endif // LINEIMAGE_H
