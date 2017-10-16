#include "getpathreplace.h"
#include <QDebug>
#include <QFileDialog>
#include <QQmlApplicationEngine>
#include "globals.h"
#include "lang.h"

GetPathReplace::GetPathReplace(QQuickItem *parent)
    : QQuickPaintedItem(parent)
{
}

void GetPathReplace::paint(QPainter *painter)
{
}

void GetPathReplace::setPath()
{
    QString dir= QFileDialog::getExistingDirectory(NULL,"Folder","/home",
                                                   QFileDialog::ShowDirsOnly|
                                                   QFileDialog::DontResolveSymlinks);
    globals::settingsApp->setValue(REPLACE_PATH_TAG, dir);
    qDebug() << globals::settingsApp->value(REPLACE_PATH_TAG,"").toString();
    globals::settingsApp->sync();
    Lang::GetInstance()->UpdateLangSetting();

    //update ImageProvider
    ImgProvider::GetInstance()->UpdateReplaceFolder();

    //update LangFactory
    Lang::GetInstance()->UpdateReplaceFolder();
}
