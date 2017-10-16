#include "switchcontrolver5.h"
#include <QDir>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlError>
#include "startwindow.h"
#include "globals.h"
#include "mainwindow.h"

SwitchControlVer5::SwitchControlVer5(QObject*parent): QObject(parent)
{

}
QString SwitchControlVer5::isProd()
{
    return m_isProd;
}
void SwitchControlVer5::isProd(QString &value)
{
    m_isProd=value;
}

QString SwitchControlVer5::isXbar()
{
    return m_isXbar;
}
void SwitchControlVer5::isXbar(QString &value)
{
    m_isXbar=value;
}
int SwitchControlVer5::OnChangeLanguage(){
    Lang* langInstance = Lang::GetInstance();
    m_isProd = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_COM_INDIV,globals::settingsApp->value(LANGUAGE_ID_TAG,(int)EnumControl::LangCode::JPN).toInt());
    m_isXbar = langInstance->GetLanguage(Lang::GetLangIdMng()->IDS_COM_XBAR,globals::settingsApp->value(LANGUAGE_ID_TAG,(int)EnumControl::LangCode::JPN).toInt());
    qDebug() <<"m_isProd" <<m_isProd;
    qDebug() <<"m_isXbar" <<m_isXbar;
    return 0;
}
