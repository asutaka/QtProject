#include "lang.h"
#include <QDebug>
#include <QtSql/QSqlDatabase>
#include <QFileInfo>
#include <QFile>
#include <QDir>
#include <QMap>
#include <QSqlError>
#include <QMetaEnum>
#include "../globals.h"
Lang* Lang::instance = 0;
QMutex Lang::langDBMutex;
LangId* Lang::langIdMng = new LangId();

Lang::Lang()
{
    QSqlDatabase::addDatabase("QSQLITE", LANG_CONNECTION_NAME);
    QString configPath = QDir::toNativeSeparators(CONFIG_PATH);
    langSetting = new QSettings(configPath, QSettings::IniFormat);
}

Lang::Lang(QString pathDB){
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE", LANG_CONNECTION_NAME);
    db.setDatabaseName(pathDB);
    QString configPath = QDir::toNativeSeparators(CONFIG_PATH);
    langSetting = new QSettings(configPath, QSettings::IniFormat);
}

Lang* Lang::GetInstance() {

    if (!instance) {
        QString pathLangDB = QDir::currentPath();
#ifdef Q_OS_ANDROID
        QFile dfile("assets:/NewMasterSql.sqlite");
        pathLangDB.append(QDir::separator()).append("/NewMasterSql.sqlite");
        pathLangDB = QDir::toNativeSeparators(pathLangDB);
        if (dfile.exists()) {
            if( QFile::exists( pathLangDB ) )
                QFile::remove( pathLangDB );
            if( dfile.copy( pathLangDB ) )
                QFile::setPermissions( pathLangDB, QFile::WriteOwner | QFile::ReadOwner );
        }
#else
        pathLangDB = QDir::toNativeSeparators("./Data/NewMasterSql.sqlite");
#endif
        instance = new Lang(pathLangDB);
    }
    return instance;
}

int Lang::GetInstance(QString pathLangData, Lang *&lang) {
    if (!instance) {
        instance = new Lang(pathLangData);
        lang = instance;
    } else {
        QSqlDatabase db = QSqlDatabase::database(LANG_CONNECTION_NAME);
        if (QString::compare(pathLangData, db.databaseName()) == 0) {
            lang = instance;
        } else {
            lang = 0;
            return 1;
        }
    }
    return 0;
}

LangId* Lang::GetLangIdMng() {
    return langIdMng;
}

int Lang::ChangePathDB(QString pathDB) {
    if (instance) {
        QMutexLocker locker(&Lang::langDBMutex);
        QSqlDatabase db = QSqlDatabase::database(LANG_CONNECTION_NAME);
        db.close();
        db.setDatabaseName(pathDB);
    } else {
        return 1;
    }
    return 0;
}

QString Lang::ConvertLangCodeToString(LangCode lang) {
    QString ret = "";
    switch (lang) {
    case JPN:
        ret = VARIABLE_NAME(JPN);
        break;
    case ENG:
        ret = VARIABLE_NAME(ENG);
        break;
    case CHN:
        ret = VARIABLE_NAME(CHN);
        break;
    case KRE:
        ret = VARIABLE_NAME(KRE);
        break;
    case GER:
        ret = VARIABLE_NAME(GER);
        break;
    case FRA:
        ret = VARIABLE_NAME(FRA);
        break;
    case DUT:
        ret = VARIABLE_NAME(DUT);
        break;
    case SPN:
        ret = VARIABLE_NAME(SPN);
        break;
    case POR:
        ret = VARIABLE_NAME(POR);
        break;
    case POL:
        ret = VARIABLE_NAME(POL);
        break;
    case HGR:
        ret = VARIABLE_NAME(HGR);
        break;
    case GRE:
        ret = VARIABLE_NAME(GRE);
        break;
    case DAN:
        ret = VARIABLE_NAME(DAN);
        break;
    case FIN:
        ret = VARIABLE_NAME(FIN);
        break;
    case THA:
        ret = VARIABLE_NAME(THA);
        break;
    case RUS:
        ret = VARIABLE_NAME(RUS);
        break;
    default:
        ret = VARIABLE_NAME(JPN);
        break;
    }
    return ret;
}

int Lang::ConvertStringToLangCode(QString langStr) {
    LangCode ret;
    if (QString::compare(langStr, VARIABLE_NAME(JPN)) == 0) {
        ret = JPN;
    } else if (QString::compare(langStr, VARIABLE_NAME(ENG)) == 0) {
        ret = ENG;
    } else if (QString::compare(langStr, VARIABLE_NAME(CHN)) == 0) {
        ret = CHN;
    } else if (QString::compare(langStr, VARIABLE_NAME(KRE)) == 0) {
        ret = KRE;
    } else if (QString::compare(langStr, VARIABLE_NAME(GER)) == 0) {
        ret = GER;
    } else if (QString::compare(langStr, VARIABLE_NAME(FRA)) == 0) {
        ret = FRA;
    } else if (QString::compare(langStr, VARIABLE_NAME(DUT)) == 0) {
        ret = DUT;
    } else if (QString::compare(langStr, VARIABLE_NAME(SPN)) == 0) {
        ret = SPN;
    } else if (QString::compare(langStr, VARIABLE_NAME(POR)) == 0) {
        ret = POR;
    } else if (QString::compare(langStr, VARIABLE_NAME(POL)) == 0) {
        ret = POL;
    } else if (QString::compare(langStr, VARIABLE_NAME(HGR)) == 0) {
        ret = HGR;
    } else if (QString::compare(langStr, VARIABLE_NAME(GRE)) == 0) {
        ret = GRE;
    } else if (QString::compare(langStr, VARIABLE_NAME(DAN)) == 0) {
        ret = DAN;
    } else if (QString::compare(langStr, VARIABLE_NAME(FIN)) == 0) {
        ret = FIN;
    } else if (QString::compare(langStr, VARIABLE_NAME(THA)) == 0) {
        ret = THA;
    } else if (QString::compare(langStr, VARIABLE_NAME(RUS)) == 0) {
        ret = RUS;
    } else {
        ret = JPN;
    }
    return ret;
}

QString Lang:: GetColumNameLang(LangCode langCode){
    QString strlang;
    switch(langCode){
        case LangCode::JPN: strlang = CL_JAPAN;  break;
        case LangCode::ENG: strlang = CL_ENGLISH;  break;
        case LangCode::CHN: strlang = CL_CHINESE; break;
        case LangCode::DAN: strlang = CL_DANISH; break;
        case LangCode::DUT: strlang = CL_DUTCH; break;
        case LangCode::FIN: strlang = CL_FINNISH; break;
        case LangCode::FRA: strlang = CL_FRENCH; break;
        case LangCode::GER: strlang = CL_GERMAN; break;
        case LangCode::GRE: strlang = CL_GREEK; break;
        case LangCode::HGR: strlang = CL_HUNGARIAN; break;
        case LangCode::KRE: strlang = CL_KOREA; break;
        case LangCode::POL: strlang = CL_POLIST; break;
        case LangCode::POR: strlang = CL_PORTUGUESE; break;
        case LangCode::RUS: strlang = CL_RUSSIAN; break;
        case LangCode::SPN: strlang = CL_SPANISH; break;
        case LangCode::THA: strlang = CL_THAI; break;
        default: break;
    }
    return strlang;
}

QString Lang::GetLanguage(int langId, int langCode){
    qDebug() << "GetLanguage";
    QMutexLocker locker(&langDBMutex);
    QString text= "";
    QString key = QString::number(langCode) + "." + QString::number(langId);
    QMap<QString, QString>::iterator result;
    result = map.find(key);
    if (result != map.end() && result.key() == key) {
        qDebug() << "get from map";
        text = result.value();
    }
    else {
        //Get string info
        QString stringValue;
        QString langIdName;
        QSqlDatabase db = QSqlDatabase::database(LANG_CONNECTION_NAME);
        if(db.isOpen()){
            QSqlQuery query(db);
            QString strQuery  = "SELECT " + QString(CL_ID) + QString(",") + GetColumNameLang((LangCode)langCode)
                    + " FROM tblLang"
                    + " WHERE DefID = " + QString::number(langId) + ";";
            db.transaction();
            query.prepare(strQuery);
            query.exec();
            db.database().commit();
            if(query.next()) {
                langIdName = query.value(0).toString();
                stringValue = query.value(1).toString();
            }
            db.close();
        }
        else{
            qDebug() << "[ERROR]" << "Query lang database: " <<db.lastError().text();
        }

        //Check replace folder
        QString replacePath= langSetting->value(REPLACE_PATH_TAG,"").toString() + "/" +langIdName + ".txt";
        QString fileR= QDir::toNativeSeparators(replacePath);
        if(QFile::exists(fileR))
        {
            qDebug() << "get from replace file";
            //load file here
            QFile file(fileR);
            if(file.open(QIODevice::ReadOnly))
            {
                QTextStream in(&file);
                while (!in.atEnd()) {
                    QString line = in.readLine();
                    QStringList fields = line.split(':');
                    if (fields.size() == 2 && QString::compare(fields.at(0),ConvertLangCodeToString((LangCode)langCode)) == 0) {
                        replaceItems.append(key);
                        text = fields.at(1);
                        text.trimmed();
                        break;
                    }
                }
                file.close();
            }
        }
        else
        {
            qDebug() << "Get from db";
            text = stringValue;

        }
        map.insert(key,text);
    }
    return text;
}

int Lang::UpdateLangSetting(){
    langSetting->sync();
    return 0;
}

int Lang::UpdateReplaceFolder() {
    //clean replace item
    qDebug() << "UpdateReplaceFolder";
    ClearReplaceItem();
    qDebug() << "Clear replace item finish";

    QString dir= langSetting->value(REPLACE_PATH_TAG,"").toString();
    QDir dirReplace (QDir::toNativeSeparators(dir));
    QStringList extFilter(LANG_EXT);

    QStringList listItem = dirReplace.entryList(extFilter, QDir::Files);

    qDebug() << "Connect sql db";
    //Get string info of lang file
    QSqlDatabase db = QSqlDatabase::database(LANG_CONNECTION_NAME);
    if(db.isOpen()){
        QSqlQuery query(db);
        for (int i = 0; i < listItem.count(); i++) {
            int langId = 0;
            //Get LangID name
            QString croped_fileName=listItem[i].section(".",0,0);
            qDebug() << "croped_fileName: " << croped_fileName;

            //Get langId
            QString strQuery  = "SELECT " + QString(CL_DEFID) + " FROM tblLang"
                                + " WHERE " + CL_ID + "=\"" + croped_fileName + "\";";
            db.transaction();
            query.prepare(strQuery);
            query.exec();
            db.database().commit();
            if(query.next()) {
                langId = query.value(0).toInt();
                //Get langCode
                QString replacePathFile= dir + "/" + listItem[i];
                QString fileR= QDir::toNativeSeparators(replacePathFile);
                QFile file(fileR);
                if(file.open(QIODevice::ReadOnly))
                {
                    QTextStream in(&file);
                    while (!in.atEnd()) {
                        QString line;
                        line.append(in.readLine());
                        qDebug() << "line: " << line;
                        if (line.length() > 0) {
                            QStringList fields = line.split(':');
                            LangCode langCode = (LangCode)ConvertStringToLangCode(fields.at(0));
                            QString key = QString::number(langCode) + "." + QString::number(langId);
                            qDebug() << "Remove replace item: " << key;
                            if (map.contains(key)) {
                                map.remove(key);
                            }
                        }
                    }
                    file.close();
                }
            }
        }
        db.close();
    }
    else{
        qDebug() << "[ERROR]" << "Query lang database: " <<db.lastError().text();
    }
    return 0;
}

int Lang::CleanLangFactory() {
    map.clear();
    return 0;
}

int Lang::ClearReplaceItem() {
    QListIterator<QString> i(replaceItems);
    while (i.hasNext()) {
        map.remove(i.next());
    }
    replaceItems.clear();
    return 0;
}

void Lang :: WriteLog(QString functionName,QString message){
    QString pathOutputLog = "./DataLog";
    QDir dir(QDir::toNativeSeparators(pathOutputLog));
    if (!dir.exists()) {
        dir.mkpath(".");
    }
    QFile fileLog(QDir::toNativeSeparators(pathOutputLog + "/" + "log.txt"));
    fileLog.open(QIODevice::ReadWrite);
    QTextStream stream(&fileLog);
    message = "Function "+ functionName+ " : " + message;
    stream << message << endl;
    fileLog.close();
}
