#ifndef LANG_H
#define LANG_H

#include "lang_global.h"
#include <QString>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QMap>
#include <QMutex>
#include <QSettings>
#include "langid.h"

#define LANG_CONNECTION_NAME "lang-database"
#define CL_DEFID "DefID"
#define CL_ID "LangID"
#define CL_JAPAN "LangJapan"
#define CL_ENGLISH "LangEnglish"
#define CL_KOREA "LangKorean"
#define CL_CHINESE "LangChinese"
#define CL_GERMAN "LangGerman"
#define CL_FRENCH "LangFrench"
#define CL_DUTCH "LangDutch"
#define CL_SPANISH "LangSpanish"
#define CL_PORTUGUESE "LangPortuguese"
#define CL_POLIST "LangPolish"
#define CL_HUNGARIAN "LangHungarian"
#define CL_GREEK "LangGreek"
#define CL_DANISH "LangDanish"
#define CL_FINNISH "LangFinnish"
#define CL_THAI "LangThai"
#define CL_RUSSIAN "LangRussian"

#define LANG_EXT "*.txt"

#define VARIABLE_NAME(x) #x

struct LangInfo{

};

class LANGSHARED_EXPORT Lang
{
private:
    static QMutex langDBMutex;
    static Lang* instance;
    static LangId* langIdMng;
    QMap<QString, QString> map;
    QList<QString> replaceItems;
    QSettings* langSetting;

public:
    enum LangCode{
        JPN = 0,
        ENG,
        CHN,
        KRE,
        GER,
        FRA,
        DUT,
        SPN,
        POR,
        POL,
        HGR,
        GRE,
        DAN,
        FIN,
        THA,
        RUS,
    };

public:

    QString GetLanguage(int langId, int langCode);
    void WriteLog(QString functionName,QString message);
    static Lang* GetInstance();
    static int GetInstance(QString pathLangData, Lang *&lang);
    static int ChangePathDB(QString pathDB);
    static LangId* GetLangIdMng();
    int UpdateLangSetting();
    int UpdateReplaceFolder();
    int CleanLangFactory();

private:
    int ClearReplaceItem();
    QString GetColumNameLang(LangCode langCode);
    Lang();
    Lang(QString pathDB);
    QString ConvertLangCodeToString(LangCode lang);
    int ConvertStringToLangCode(QString langStr);
};

#endif // LANG_H
