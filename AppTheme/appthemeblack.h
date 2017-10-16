#ifndef APPTHEMEBLACK_H
#define APPTHEMEBLACK_H
#include "apptheme.h"

class AppThemeBlack : public AppTheme
{
public:
    AppThemeBlack(): AppTheme(Theme::AppThemeBlack){
        m_colorBackGround = QColor(0,0,0);
        m_lable = QPen(QRgb(0xFFFFFF));
        m_lable.setWidth(1);
        m_lable.setStyle(Qt::SolidLine);
        m_value = QPen(QRgb(0xF7BE81));
        m_line  = QPen(QRgb(0xBDBDBD));
        m_line.setWidth(0.5);
        m_line.setStyle(Qt::SolidLine);
        m_border = QPen(QRgb(0xBDBDBD));
    }
};
#endif // APPTHEMEBLACK_H
