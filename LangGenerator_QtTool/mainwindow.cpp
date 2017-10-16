#include "mainwindow.h"
#include <QAxObject>
#include <QDebug>
#include <QtSql/QSqlDatabase>
#include <QSqlQuery>
#include <QFileInfo>
#include <QFile>
#include <QDir>
#include <QTextStream>
#include <QString>
#include <QVariant>
#include <QTextCodec>
#include <QDataStream>

MainWindow::MainWindow()
{
    dbSqlite = QSqlDatabase::addDatabase("QSQLITE");
}
void MainWindow:: btnGenerator_Click(QString fileInput, QString dirOutput,bool isSqlite){
    isSQLite = isSqlite;
    dirPathOutput = dirOutput;
    pathFileInput = fileInput;
    QDir dir(dirOutput);
    if (!dir.exists()){
        dir.mkpath(".");
    }
    idStartLangData= 9000;
    if(!isReadFile){
        readFileExcel(fileInput);
    }
    makeHeaderFile();
    makeFileCpp();
    if(isSQLite){
        createSqliteFile();
    }
    else{
        createBinaryFile();
    }
}

void MainWindow:: readFileExcel(QString filePath){
    // read full lang.
    QAxObject* excel = new QAxObject( "Excel.Application", 0 );
    QAxObject* workbooks = excel->querySubObject( "Workbooks" );
    QAxObject* workbook = workbooks->querySubObject( "Open(const QString&)",filePath );
    QAxObject* sheets = workbook->querySubObject( "Worksheets" );

    //worksheets count
    int count = sheets->dynamicCall("Count()").toInt();
    count = sheets->property("Count").toInt();
    QAxObject*sheet;
    for (int i=1; i<=count; i++){
        sheet = sheets->querySubObject( "Item( int )", i );
        if(i== indexLangSheet)//read sheet data lang
        {
            QList<QString>strID = readDataColSheet(sheet,3,0);
            countRowLang = strID.count();
            for(int colLang = 1; colLang <= 84; colLang+=2){
                QList<QString>data;
                data =readDataColSheet(sheet,colLang,countRowLang);
                arrData.append(data);
                if(colLang ==1){
                    colLang= 52;
                    arrData.append(strID);
                }
            }
        }
        else if(i== indexFontSheet)
        {
            FontInfo fontData;
            int dem = 1;
            int id = 1;
            for(int columnFont = starColumnDataFont;columnFont<= maxColumnFont; columnFont++){
                QList<FontInfo> listFont;
                QAxObject* rows = sheet->querySubObject( "Rows" );
                int rowCount = rows->dynamicCall( "Count()" ).toInt();
                for(int row = rowStartFontData; row< rowCount; row ++){
                    QAxObject* cell = sheet->querySubObject( "Cells( int, int )", row, columnFont);
                    QVariant valueFont = cell->dynamicCall( "Value()" );
                    if((valueFont.toString() =="")&&(row!=8)){
                        id = 0;
                        break;
                    }
                    if(row < 11){
                        switch (row) {
                        case 4: fileName.append(valueFont.toString()); break;
                        case 6: displayName.append(valueFont.toString()); break;
                        case 7: englishName.append(valueFont.toString()); break;
                        default:break;
                        }
                    }
                    else{
                        fontData.ID = id;
                        switch(dem){
                        case 1 : fontData.Size = valueFont.toString().toInt();qDebug()<<valueFont.toString(); break;
                        case 2 : fontData.Bold = convertStringToBool(valueFont.toString());qDebug()<<valueFont.toString(); break;
                        case 3 : fontData.Italic = convertStringToBool(valueFont.toString());qDebug()<<valueFont.toString(); break;
                        case 4 : fontData.Underline = convertStringToBool(valueFont.toString());qDebug()<<valueFont.toString(); break;
                        case 5 : fontData.Name = valueFont.toString();qDebug()<<valueFont.toString();qDebug()<<"------------"; break;
                        default : break;
                        }
                        dem++;
                        if(dem == 6){
                            listFont.append(fontData);
                            dem = 1;
                            row ++;
                            id ++;
                        }
                    }
                }
                arrFont.append(listFont);
            }
        }
    }
    workbook->dynamicCall("Close (Boolean)", false);
    excel->dynamicCall("Quit (void)");
    isReadFile= true;
}
QList<QString> MainWindow ::readDataColSheet(QAxObject* sheet,int column, int numRow){
    QList<QString>data;
    QAxObject* rows = sheet->querySubObject( "Rows" );
    int rowCount = rows->dynamicCall( "Count()" ).toInt();
    if(numRow != 0){
        rowCount = posStartRowData + numRow;
    }
    for (int row = posStartRowData; row <= rowCount; row++){
        if(row!= posRow1000){
            QAxObject* cell = sheet->querySubObject( "Cells( int, int )", row, column);
            QVariant value = cell->dynamicCall( "Value()" );
            if((value.toString() == "")&&(column ==3)){
                break;
            }
            else if((value.toString() == "")&&(column ==1)){
                data.append(QString:: number(idStartLangData++));
            }
            else{
                data.append(value.toString());
                qDebug()<<value.toString();
            }
        }
    }
    return data;
}
void MainWindow :: makeFileCpp(){
    QString cppPathFile = dirPathOutput +"\\"+ _CPP_FILE_NAME;
    headerFile.setFileName(cppPathFile);
    headerFile.open(QIODevice::ReadWrite);
    putLine("#include <langid.h>");
    PutCarriageReturn();
    putLine("LangId::LangId()");
    putLine("{");
    putLine("}");
    headerFile.close();
}

void MainWindow::makeHeaderFile(){
    QString headerPathFile = dirPathOutput+"\\" + _HEADER_FILE_NAME;
    headerFile.setFileName(headerPathFile);
    if(QFileInfo(headerPathFile).exists()){
        headerFile.remove();
    }
    headerFile.open(QIODevice::ReadWrite|QIODevice::Truncate );
    QList<QString> idLang = arrData[0];
    QList<QString> strLangID = arrData[1];
    for(int iRow = 0; iRow< (countRowLang);iRow++ ){
        QString itemLang = QString("const int ")+ strLangID[iRow] +" = " + idLang[iRow] + ";";
        arrayLangId.append(itemLang);
    }
    QList<QString> lib;
    lib.append("#include <QObject>");
    createHeaderFile();
    putLibrary(lib);
    putClass();
    putLine(_FILE_END);
    headerFile.close();
}
void MainWindow :: createHeaderFile(){
    putLine(_FILE_HEADER);
    PutCarriageReturn();
}

void MainWindow :: putLibrary(QList<QString> arrLib){
    if(arrLib.isEmpty()){
        foreach (QString item, arrLib) {
            putLine(item);
        }
    }
    else {
        putLine("#include <QObject>");
    }
    PutCarriageReturn();
}
void MainWindow :: putLine(QString data){
    QTextStream stream(&headerFile);
    stream << data << endl;
}
void MainWindow ::PutCarriageReturn()
{
    putLine("");
}
void MainWindow:: putClass(){
    putLine("class LangId");
    putLine("{");
    QList<QString> list;
    putPublicMethod(arrayLangId);
    putSignal(list);
    putPublicSlot(list);
    putPrivateMethod(list);
    putLine("};");
}
void MainWindow:: putPublicMethod(QList<QString> listMethod){
    putLine("public:");
    putLine("LangId();");
    if(!listMethod.isEmpty()){
        foreach (QString item, listMethod) {
            putLine(item);
        }
    }
    PutCarriageReturn();
}
void MainWindow:: putPrivateMethod(QList<QString> listMethod){
    putLine("private:");
    if(!listMethod.isEmpty()){
        foreach (QString item, listMethod) {
            putLine(item);
        }
    }
    PutCarriageReturn();
}
void MainWindow:: putSignal(QList<QString> listSignal){
    putLine("signals:");
    if(!listSignal.isEmpty()){
        foreach (QString item, listSignal) {
            putLine(item);
        }
    }
    PutCarriageReturn();
}
void MainWindow:: putPublicSlot(QList<QString> listSlot){
    putLine("public slots:");
    if(!listSlot.isEmpty()){
        foreach (QString item, listSlot) {
            putLine(item);
        }
    }
    PutCarriageReturn();
}
void MainWindow :: writeLog(QString functionName,QString message){
    QDir dir(filePathLog);
    if (!dir.exists()) {
        dir.mkpath(".");
    }
    QFile fileLog(filePathLog+ "log.txt");
    fileLog.open(QIODevice::ReadWrite);
    QTextStream stream(&fileLog);
    message = "Function "+ functionName+ " : " + message;
    stream << message << endl;
    fileLog.close();
}
void MainWindow :: createSqliteFile(){
    QDir dir(dirPathOutput);
    if (!dir.exists()){
        dir.mkpath(".");
    }
    QString pathSqlFile = dirPathOutput+ "\\" + _SQLITE_FILE_NAME;
    QFile fileSql(pathSqlFile);
    fileSql.open(QIODevice::ReadWrite);
    dbSqlite.setDatabaseName(pathSqlFile);
    dbSqlite.open();
    dbSqlite.database().transaction();
    QSqlQuery query;
    query.exec("create table tblLang (DefID int primary key, "
               "LangID nvarchar(100), LangJapan nvarchar(500),LangEnglish nvarchar(500),"
               "LangKorean nvarchar(500),LangChinese nvarchar(500), LangGerman nvarchar(500),"
               "LangFrench nvarchar(500),LangDutch nvarchar(500), LangSpanish nvarchar(500),"
               "LangPortuguese nvarchar(500),LangPolish nvarchar(500), LangHungarian nvarchar(500),"
               "LangGreek nvarchar(500),LangDanish nvarchar(500), LangFinnish nvarchar(500),"
               "LangThai nvarchar(500),LangRussian nvarchar(500))");
    for(int i=0 ;i< (countRowLang);i++){
        query.prepare("INSERT INTO tblLang (DefID, LangID, LangJapan,LangEnglish,LangKorean,"
                      "LangChinese,LangGerman,LangFrench,LangDutch,LangSpanish,LangPortuguese,"
                      "LangPolish,LangHungarian,LangGreek,LangDanish,LangFinnish,LangThai,LangRussian)"
                      "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        for(int j = 0; j< arrData.length();j++ ){
            QList<QString> temp = arrData[j];
            query.addBindValue(temp[i]);
        }
        query.exec();
    }
    query.exec("create table tblFont (FontID int primary key, FontName nvarchar(50),FontSize nvarchar(20),Bold int, Italic int, Underline int, FontLanguage nvarchar(20))");
    QList<FontInfo> fontInfo;
    for(int fontLangIndex =0; fontLangIndex< arrFont.length();fontLangIndex++){
        fontInfo = arrFont[fontLangIndex];
        for(int iFont = 0; iFont< fontInfo.length();iFont++){
            FontInfo tempFont;
            tempFont = fontInfo[iFont];
            query.prepare("INSERT INTO tblFont (FontID, FontName, FontSize,Bold,Italic,Underline,FontLanguage)"
                          "VALUES (?,?,?,?,?,?,?)");
            query.addBindValue(tempFont.ID + fontInfo.length()*fontLangIndex);
            query.addBindValue(tempFont.Name);
            query.addBindValue(tempFont.Size);
            query.addBindValue(convertBoolToInt(tempFont.Bold));
            query.addBindValue(convertBoolToInt(tempFont.Italic));
            query.addBindValue(convertBoolToInt(tempFont.Underline));
            query.addBindValue(QString::number(fontLangIndex+ 1));
            query.exec();
        }
    }
    dbSqlite.database().commit();
}
void MainWindow ::createBinaryFile(){
    //Duyệt tất cả các LangInfo rồi tạo file.
    QList<QString> lstId = arrData[0];
    for(int i =0; i< (arrData.count()-2); i++){
        QString path = dirPathOutput;
        path += "//"+ fileName[i].split(".")[0] +".xcf";
        QList<QString> lstStrId =arrData[i+ 2];
        QList<StrInfo> lstStrInfo;
        LangInfo langInfoItem;
        for(int k = 0; k< countRowLang;k++ ){
            StrInfo strInfoItem;
            strInfoItem.ID = lstId[k].toInt();
            strInfoItem.Data = lstStrId[k];
            lstStrInfo.append(strInfoItem);
        }
        langInfoItem.StrInfo = lstStrInfo;
        langInfoItem.FontInfo = arrFont[i];
        langInfoItem.ID = i+1;
        langInfoItem.DisplayName= displayName[i];
        langInfoItem.EnglishName = englishName[i];
        langInfoItem.SystemeName = sysName;
        serializeData(path,langInfoItem);
    }
}
bool MainWindow :: convertStringToBool(QString value){
    if((value == "FALSE")|| (value =="FW_NORMAL")){
        return false;
    }
    else return true;
}
int MainWindow:: convertBoolToInt(bool value){
    if(value){
        return 1;
    }
    else{
        return 0;
    }
}
void MainWindow :: serializeData(QString path,LangInfo dataLang){
    QFile file(path);
    file.open(QIODevice::WriteOnly);
    QDataStream out(&file);
    out << dataLang;
}
QDataStream &operator<<(QDataStream &out, const LangInfo &langInfo){
    out << langInfo.ID << langInfo.DisplayName << langInfo.EnglishName << langInfo.SystemeName << langInfo.StrInfo << langInfo.FontInfo;
    return out;
}
QDataStream &operator>>(QDataStream &in, LangInfo &langInfo){
    in >> langInfo.ID >> langInfo.DisplayName >> langInfo.EnglishName >> langInfo.SystemeName >> langInfo.StrInfo >> langInfo.FontInfo;
    return in;
}
QDataStream &operator<<(QDataStream &out, const StrInfo &strInfo){
    out << strInfo.ID << strInfo.Data;
    return out;
}
QDataStream &operator>>(QDataStream &in, StrInfo &strInfo){
    in >> strInfo.ID >> strInfo.Data;
    return in;
}
QDataStream &operator<<(QDataStream &out, const FontInfo &fontInfo){
    out << fontInfo.ID << fontInfo.Size << fontInfo.Italic << fontInfo.Bold << fontInfo.Underline << fontInfo.Name;
    return out;
}
QDataStream &operator>>(QDataStream &in, FontInfo &fontInfo){
    in >> fontInfo.ID >> fontInfo.Size >> fontInfo.Italic >> fontInfo.Bold >> fontInfo.Underline >> fontInfo.Name;
    return in;
}



