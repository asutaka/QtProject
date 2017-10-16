#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QQuickItem>
#include <QAxObject>
#include <QFile>
#include <QtSql/QSqlDatabase>
#include <QSqlQuery>

struct FontInfo{
    int ID;
    float Size;
    bool Italic;
    bool Bold;
    bool Underline;
    QString Name;
};
struct StrInfo{
    int ID;
    QString Data;
};
struct LangInfo{
    int ID;
    QString DisplayName;
    QString EnglishName;
    QString SystemeName;
    QList<FontInfo>FontInfo;
    QList<StrInfo>StrInfo;

};
class MainWindow : public QQuickItem
{
    Q_OBJECT
public:
    MainWindow();
    Q_INVOKABLE void btnGenerator_Click(QString fileInput, QString dirOutput,bool isSqlite);
signals:

public slots:
private:
    void makeHeaderFile();
    void readFileExcel(QString filePath);
    void createHeaderFile();
    void makeFileCpp();
    void putLine(QString data);
    void putLibrary(QList<QString> arrLib);
    void PutCarriageReturn();
    void putClass();
    void putPublicMethod(QList<QString> listMethod);
    void putPrivateMethod(QList<QString> listMethod);
    void putSignal(QList<QString> listSignal);
    void putPublicSlot(QList<QString> listSlot);
    void writeLog(QString functionName,QString message);
    void createSqliteFile();
    void createBinaryFile();
    bool convertStringToBool(QString value);
    int convertBoolToInt(bool value);
    void serializeData(QString path,LangInfo dataLang);
    QList<QString> readDataColSheet(QAxObject* sheet,int column,int numRow);


    const QString _FILE_HEADER = "#ifndef LANGID_H\n#define LANGID_H";
    const QString _FILE_END = "#endif // LANGID_H";
    const QString _FILE_CLASS_NAME = "langid";
    const QString _SQLITE_FILE_NAME = "NewMasterSql.sqlite";

    QList<QString> arrayLangId;
    QString dirPathOutput;
    QString pathFileInput;
    QFile headerFile;
    QString _CPP_FILE_NAME = _FILE_CLASS_NAME + ".cpp";
    QString _HEADER_FILE_NAME = _FILE_CLASS_NAME + ".h";
    QString filePathLog = "C:\\LangGenerator\\Log\\";
    QString strQuery = "SELECT * FROM tblLang";
    QSqlDatabase dbSqlite;
    int idStartLangData = 9000;
    int rowStartFontData = 4;
    int posStartRowData = 16;
    int posRow1000 = 268;
    int indexLangSheet = 4;
    int indexFontSheet = 5;
    int maxColumnFont = 18;
    int starColumnDataFont = 3;
    bool isSQLite= false;
    bool isReadFile = false;
    QList<QList<QString>> arrData;
    QList<QList<FontInfo>> arrFont;
    QList<QString> fileName;
    QList<QString> displayName;
    QList<QString> englishName;
    QString sysName = "CW";
    int countRowLang = 0;

};
QDataStream &operator<<(QDataStream &out, const StrInfo &strInfo);
QDataStream &operator>>(QDataStream &in, StrInfo &strInfo);
QDataStream &operator<<(QDataStream &out, const FontInfo &fontInfo);
QDataStream &operator>>(QDataStream &in, FontInfo &fontInfo);
QDataStream &operator<<(QDataStream &out, const LangInfo &langInfo);
QDataStream &operator>>(QDataStream &in, LangInfo &langInfo);
#endif // MAINWINDOW_H
