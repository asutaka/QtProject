#include "imgprovider.h"
#include <QDebug>
#include <QDir>
#include "globals.h"

ImgProvider* ImgProvider::_instance = 0;

ImgProvider::ImgProvider(ImageType type, Flags flags) : QQuickImageProvider(type,flags)
{
}

ImgProvider* ImgProvider::GetInstance(){
    if (!_instance) {
        _instance = new ImgProvider(QQmlImageProviderBase::Image, 0);
    }
    return _instance;
}

QImage ImgProvider::requestImage(const QString &id, QSize *size, const QSize &requestedSize)
{
    QImage image;
    QMap<QString, QImage>::iterator i = dictionary.find(id);
    if (i != dictionary.end() && i.key() == id) {
        image = dictionary[id];
    }
    else {
        QString imagePath= globals::settingsApp->value(REPLACE_PATH_TAG,"").toString() + "/"+id;
        QString fileR= QDir::toNativeSeparators(imagePath);
        if(QFile::exists(fileR))
        {
            replaceItems.append(id);
            image.load(fileR);
        }
        else
        {
            image.load(":/Images/"+id);

        }
        dictionary[id] = image;
    }

    //resize here

    return image;
}

int ImgProvider::UpdateReplaceFolder() {
    clearReplaceItems();
    QString dir= globals::settingsApp->value(REPLACE_PATH_TAG,"").toString();
    QDir dirReplace (QDir::toNativeSeparators(dir));
    QStringList extFilter(IMAGE_EXT);
    QStringList listIcon = dirReplace.entryList(extFilter, QDir::Files);
    replaceItems.clear();
    for (int i = 0; i < listIcon.count(); i++) {
        replaceItems.append(listIcon[i]);
        dictionary.remove(listIcon[i]);
    }
    return 0;
}

int ImgProvider::CleanImageProvider () {
    dictionary.clear();
    return 0;
}

int ImgProvider::clearReplaceItems() {
    for (int i = 0; i < replaceItems.count(); i++) {
        dictionary.remove(replaceItems[i]);
    }
    return 0;
}
