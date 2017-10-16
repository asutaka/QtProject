#ifndef APPTHEMEBLUENCS_H
#define APPTHEMEBLUENCS_H
#include "AppTheme/apptheme.h"
class AppThemeBlueNcs: public AppTheme
{
public:
    AppThemeBlueNcs() : AppTheme(Theme::AppThemeBlueNcs)
    {
        //m_colorBackGround = QColor(1,139,186);
        m_colorBackGround = QColor(11,30,59);
        m_lable = QPen(QRgb(0xe2e2e2));
        m_value = QPen(QRgb(0xFFFF00));
        m_line  = QPen(QRgb(0xA4A4A4));
        m_line.setWidth(0.5);
        m_line.setStyle(Qt::SolidLine);
        m_border = QPen(QRgb(0xe2e2e2));
    }
};
#endif // APPTHEMEBLUENCS_H
