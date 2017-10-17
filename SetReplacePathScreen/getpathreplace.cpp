#include "getpathreplace.h"
#include <QDebug>
#include <QFileDialog>
#include <QQmlApplicationEngine>
#include "globals.h"
#include "lang.h"

GetPathReplace::GetPathReplace(QQuickItem *parent): QQuickPaintedItem(parent) {
    _isAndroid = (QSysInfo::productType() == "android");
}

void GetPathReplace::paint(QPainter *painter){

}

void GetPathReplace::setPath() {
    QString dir= QFileDialog::getExistingDirectory(NULL,"Folder","/home",
                                                   QFileDialog::ShowDirsOnly|
                                                   QFileDialog::DontResolveSymlinks);
    settingApp(dir);
}

bool GetPathReplace::isAndroid() {
    return _isAndroid;
}

void GetPathReplace::settingApp(QString dir){
    if(_isAndroid && dir.left(7) == "file://"){ dir = dir.remove(0, 7); }
    globals::settingsApp->setValue(REPLACE_PATH_TAG, dir);
    qDebug() <<"Setting app"<<globals::settingsApp->value(REPLACE_PATH_TAG,"").toString();
    globals::settingsApp->sync();
    Lang::GetInstance()->UpdateLangSetting();

    //update ImageProvider
    ImgProvider::GetInstance()->UpdateReplaceFolder();

    //update LangFactory
    Lang::GetInstance()->UpdateReplaceFolder();
}
