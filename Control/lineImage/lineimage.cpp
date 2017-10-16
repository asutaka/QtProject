#include "lineimage.h"
#include <QPixmap>

LineImage::LineImage()
{  
}

LineImage::LineImage( QPixmap pixmap1, QPixmap pixmap2, QPixmap pixmap3)
{
    this->BigLineColor = pixmap1;
    this->SmallLineColor = pixmap2;
    this->StatusLine = pixmap3;
}

LineImage::~LineImage()
{
}

QPixmap LineImage::GetBigLineColor()
{
    return this->BigLineColor;
}

QPixmap LineImage::GetSmallLineColor()
{
    return this->SmallLineColor;
}

QPixmap LineImage::GetStatusLine()
{
    return this->StatusLine;
}

