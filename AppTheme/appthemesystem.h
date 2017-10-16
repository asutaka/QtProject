#ifndef APPTHEMESYSTEM_H
#define APPTHEMESYSTEM_H
#include "AppTheme/apptheme.h"
class AppThemeSystem: public AppTheme
{
public:
    AppThemeSystem() : AppTheme(Theme::AppThemeSystem)
    {
        m_colorBackGround = QColor(10,80,100);
        m_lable = QPen(QRgb(0xe2e2e2));
        m_value = QPen(QRgb(0xe2e2e2));
        m_line  = QPen(QRgb(0xe2e2e2));
        m_line.setWidth(1);
        m_line.setStyle(Qt::SolidLine);
        m_border = QPen(QRgb(0xe2e2e2));
    }
};
#endif // APPTHEMESYSTEM_H
