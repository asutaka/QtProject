#ifndef PROGRESSBAR_H
#define PROGRESSBAR_H

#include <QObject>
#include <QtQml>

class progressbar:public QObject
{
    Q_OBJECT

    public:
    enum ProgressBarStyle
    {
        BAR,
        BLOCK,
        SCROLL
    };
    Q_ENUMS(ProgressBarStyle)

    static void declareQML(){
        qmlRegisterType<progressbar>("MyQMLEnums", 1, 0, "Style");
    }
};

#endif // PROGRESSBAR_H
