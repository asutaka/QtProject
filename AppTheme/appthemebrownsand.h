#ifndef APPTHEMEBROWNSAND_H
#define APPTHEMEBROWNSAND_H
#include "AppTheme/apptheme.h"
class AppThemeBrownSand: public AppTheme
{
public:
    AppThemeBrownSand() : AppTheme(Theme::AppThemeBrownSand)
    {
        m_colorBackGround = QColor(158,137,101);
        m_lable = QPen(QRgb(0x353530));
        m_value = QPen(QRgb(0x8A2908));
        m_line  = QPen(QRgb(0x353530));
        m_line.setWidth(1);
        m_line.setStyle(Qt::SolidLine);
        m_border = QPen(QRgb(0x140718));
        m_border.setWidth(1.5);

    }
};
#endif // APPTHEMEBROWNSAND_H
