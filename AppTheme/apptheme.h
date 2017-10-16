#ifndef APPTHEME_H
#define APPTHEME_H

#include <QPen>
#include <QColor>

class AppTheme
{
public:
    enum Theme{
        AppThemeBlack = 0,
        AppThemeBlueCerulean,
        AppThemeDark,
        AppThemeBrownSand,
        AppThemeBlueNcs,
        AppThemeHighContrast,
        AppThemeBlueIcy,
        AppThemeSystem,
        AppThemeQt
    };
    explicit AppTheme( Theme id = Theme::AppThemeBlack):m_id(id){}
    QColor colorBackGround() const { return m_colorBackGround;}
    QPen labelPen() const { return  m_lable; }
    QPen valuePen() const { return m_value; }
    QPen linePen() const {return m_line;}
    QPen borderPen() const {return m_border;}
    Theme id() const { return m_id; }

protected:
    Theme m_id;
    QColor m_colorBackGround;
    QPen m_lable;
    QPen m_value;
    QPen m_line;
    QPen m_border;
};

#endif // APPTHEME_H
