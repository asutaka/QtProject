#ifndef APPTHEMEBLUEICY_H
#define APPTHEMEBLUEICY_H
#include "AppTheme/apptheme.h"

class AppThemeBlueIcy: public AppTheme
{
public:
    AppThemeBlueIcy() : AppTheme(Theme ::AppThemeBlueIcy)
    {
        m_colorBackGround = QColor(206,231,240);
        m_lable = QPen(QRgb(0x08088A));
        m_value = QPen(QRgb(0x01A9DB));
        m_line  = QPen(QRgb(0x01A9DB));
        m_line.setWidth(1);
        m_line.setStyle(Qt::SolidLine);
        m_border = QPen(QRgb(0x08088A));
    }
};
#endif // APPTHEMEBLUEICY_H
