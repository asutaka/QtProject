#ifndef APPTHEMEQT_H
#define APPTHEMEQT_H

#include "AppTheme/apptheme.h"
class AppThemeQt: public AppTheme
{
public:
    AppThemeQt() : AppTheme(Theme::AppThemeQt)
    {
        m_colorBackGround = QColor(240,240,240);
        m_lable = QPen(QRgb(0x000000));
        m_value = QPen(QRgb(0x006633));
        m_line  = QPen(QRgb(0x74DF00));
        m_line.setWidth(1);
        m_line.setStyle(Qt::SolidLine);
        m_border = QPen(QRgb(0x088A08));
    }
};
#endif // APPTHEMEQT_H
