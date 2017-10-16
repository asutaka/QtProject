#include "appthememanager.h"
#include "AppTheme/appthemeblack.h"
#include "AppTheme/appthemedark.h"
#include "AppTheme/appthemebluecerulean.h"
#include "AppTheme/appthemebrownsand.h"
#include "AppTheme/appthemeblueicy.h"
#include "AppTheme/appthemebluencs.h"
#include "AppTheme/appthemehighcontrast.h"
#include "AppTheme/appthemeqt.h"
#include "AppTheme/appthemesystem.h"
#include <QDebug>
#include "globals.h"
#include "mainwindow.h"

AppThemeManager* AppThemeManager::instance = 0;

AppThemeManager* AppThemeManager::GetInstance() {
    if (!instance){
        instance = new AppThemeManager();
    }
    return instance;
}

AppThemeManager::AppThemeManager()
{
    UpdateTheme();
}
void AppThemeManager :: setTheme(AppTheme::Theme theme){
    if (m_theme.isNull() || theme != m_theme->id()) {
        switch (theme) {
        case AppTheme::AppThemeSystem:
            m_theme.reset(new AppThemeSystem());
            break;
        case AppTheme::AppThemeBlueCerulean:
            m_theme.reset(new AppThemeBlueCerulean());
            break;
        case AppTheme::AppThemeDark:
            m_theme.reset(new AppThemeDark());
            break;
        case AppTheme::AppThemeBrownSand:
            m_theme.reset(new AppThemeBrownSand());
            break;
        case AppTheme::AppThemeBlueNcs:
            m_theme.reset(new AppThemeBlueNcs());
            break;
        case AppTheme::AppThemeHighContrast:
            m_theme.reset(new AppThemeHighContrast());
            break;
        case AppTheme::AppThemeBlueIcy:
            m_theme.reset(new AppThemeBlueIcy());
            break;
        case AppTheme::AppThemeQt:
            m_theme.reset(new AppThemeQt());
            break;
        default:
            m_theme.reset(new AppThemeBlack());
            break;
        }
    }
}
void AppThemeManager :: setDefaultTheme(){
    if(m_theme.isNull()){
        m_theme.reset(new AppThemeBlack());
    }
}

void AppThemeManager::UpdateTheme () {
    EnumControl::LangCode lang = (EnumControl::LangCode)globals::settingsApp->value(LANGUAGE_ID_TAG,0).toInt();
    qDebug() << "lang to theme : " << (int)lang;
    switch (lang) {
    case EnumControl::LangCode::JPN:
        m_theme.reset(new AppThemeBlack());
        break;
    case EnumControl::LangCode::ENG:
        m_theme.reset(new AppThemeBlueCerulean());
        break;
    case EnumControl::LangCode::CHN:
        m_theme.reset(new AppThemeBrownSand());
        break;
    case EnumControl::LangCode::DAN:
        m_theme.reset(new AppThemeBlueIcy());
        break;
    case EnumControl::LangCode::DUT:
        m_theme.reset(new AppThemeBlueNcs());
        break;
    case EnumControl::LangCode::FIN:
        m_theme.reset(new AppThemeDark());
        break;
    case EnumControl::LangCode::FRA:
        m_theme.reset(new AppThemeHighContrast());
        break;
    case EnumControl::LangCode::GER:
        m_theme.reset(new AppThemeQt());
        break;
    case EnumControl::LangCode::GRE:
        m_theme.reset(new AppThemeSystem());
        break;
    case EnumControl::LangCode::KRE:
    case EnumControl::LangCode::SPN:
    case EnumControl::LangCode::POR:
    default:
        m_theme.reset(new AppThemeQt());
        break;
    }
}
