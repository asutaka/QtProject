#ifndef STARTWINDOW_H
#define STARTWINDOW_H

#include <QMainWindow>
#include <QCloseEvent>

class StartWindow
{
    //static StartWindow* instance = nullptr;
public:
    StartWindow();
    StartWindow* GetInstance();
    void ChildNotify(QObject* child, QEvent* event);

    QList<QString> listText(QString dir);
    QString replaceText(QString path, QString control, int langCode);
};

#endif // STARTWINDOW_H
