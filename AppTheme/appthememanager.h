#ifndef APPTHEMEMANAGER_H
#define APPTHEMEMANAGER_H
#include <QScopedPointer>
#include <QObject>
#include "AppTheme/apptheme.h"

class AppThemeManager : public QObject
{
    Q_OBJECT
private:
    static AppThemeManager* instance;
public:
    static AppThemeManager* GetInstance();
    void setTheme(AppTheme::Theme theme);
    void setDefaultTheme();
    void UpdateTheme();
    AppTheme* theme() const { return m_theme.data(); }
private:
    AppThemeManager();
protected:
    QScopedPointer<AppTheme> m_theme;
};

#endif // APPTHEMEMANAGER_H
