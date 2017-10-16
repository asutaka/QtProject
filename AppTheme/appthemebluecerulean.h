#ifndef APPTHEMEBLUECERULEAN_H
#define APPTHEMEBLUECERULEAN_H
#include "AppTheme/apptheme.h"

class AppThemeBlueCerulean: public AppTheme
{
public:
    AppThemeBlueCerulean() : AppTheme(Theme::AppThemeBlueCerulean)
    {
        m_colorBackGround = QColor(64,67,74);
        m_lable = QPen(QRgb(0xffffff));
        m_value = QPen(QRgb(0xD0FA58));
        m_line  = QPen(QRgb(0x848484));
        m_line.setWidth(0.5);
        m_line.setStyle(Qt::SolidLine);
        m_border = QPen(QRgb(0xffffff));
    }
};
#endif // APPTHEMEBLUECERULEAN_H
