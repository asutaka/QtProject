#ifndef APPTHEMEDARK_H
#define APPTHEMEDARK_H
#include "AppTheme/apptheme.h"
class AppThemeDark: public AppTheme
{
public:
    AppThemeDark() : AppTheme(Theme::AppThemeDark)
    {
        m_colorBackGround = QColor(25,25,25);
        m_lable = QPen(QRgb(0xe2e2e2));
        m_value = QPen(QRgb(0xFE9A2E));
        m_line  = QPen(QRgb(0x848385));
        m_line.setWidth(0.5);
        m_line.setStyle(Qt::SolidLine);
        m_border = QPen(QRgb(0x848385));
    }
};
#endif // APPTHEMEDARK_H
