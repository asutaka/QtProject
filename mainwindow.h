#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QtQuick/QQuickPaintedItem>
#include <QColor>
#include <QPixmap>
#include <QTimer>
#include <QElapsedTimer>
#include <QList>
#include "Control/enumcontrol.h"

class MainWindow : public QObject
{
    Q_OBJECT
    Q_PROPERTY(EnumControl::LangCode language READ language WRITE setLanguage)

public:


    struct DataCtrl {
        QMap<int,QVariant> listValue;
    };

private:
    static MainWindow *mainWindow;
    EnumControl::LangCode langCode;
    EnumControl::StatusMachine  statusMachine;

public:
    static MainWindow* GetInstance();
    MainWindow();
    EnumControl::LangCode language();
    void setLanguage(EnumControl::LangCode lang);
    Q_INVOKABLE void InnerChangeScreen(int id);
    Q_INVOKABLE void GoBackScreen();

    EnumControl::StatusMachine getStatusMachine();
    void setStatusMachine(EnumControl::StatusMachine value);

signals:
    void onChangeScreen(QString source);
    void onChangeStatusBar(QString source);
    void onChangeBottomBar(QString source);
    void onBackScreen(int count);
    void onChangeLanguage();
    void onChangeTheme();
    void guiEvent(int eventId);

public slots:
    void OnGuiEvent(int eventId);
};

#endif // MAINWINDOW_H
