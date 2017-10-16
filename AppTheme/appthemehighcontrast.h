#ifndef APPTHEMEHIGHCONTRAST_H
#define APPTHEMEHIGHCONTRAST_H
#include "AppTheme/apptheme.h"
class AppThemeHighContrast: public AppTheme
{
public:
    AppThemeHighContrast() : AppTheme(Theme::AppThemeHighContrast)
    {
        m_colorBackGround = QColor(255,171,3);
        m_lable = QPen(QRgb(0x596A74));
        m_value = QPen(QRgb(0x202020));
        m_line  = QPen(QRgb(0x596A74));
        m_line.setWidth(0.5);
        m_line.setStyle(Qt::SolidLine);
        m_border = QPen(QRgb(0x202020));
    }
};
#endif // APPTHEMEHIGHCONTRAST_H
