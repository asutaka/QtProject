#include "startwindow.h"
#include <QDir>
#include <QFile>
#include <QTextStream>

StartWindow::StartWindow()
{
}

void StartWindow::ChildNotify(QObject* child, QEvent* event)
{
    QString childType = child->metaObject()->className();
    if (childType == "Integration")
    {
        if (event->type() == QEvent::Close)
        {
        }
    }
}

QList<QString> StartWindow::listText(QString dir)
{
    QList<QString> result;
    QDir Folder(dir);

    if(!Folder.exists())
    {
        result << "NotExist";
        return result;
    }
    result << "Exist";
    QFileInfoList list= Folder.entryInfoList();
    foreach (QFileInfo f, list)
    {
        if(f.fileName().endsWith(".txt"))
            result << f.fileName();
    }
    return result;
}

QString StartWindow::replaceText(QString path, QString control, int langCode)
{
    QString result;
    QFile file(path+"/"+control);
    if(file.open(QIODevice::ReadOnly))
    {
        QTextStream inn(&file);
        try
        {
            for(int i=0;i<langCode;i++)
                result= inn.readLine();
        }
        catch (...) {}
    }
    file.close();
    return result.remove(0,4);
}
