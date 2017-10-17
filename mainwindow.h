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
    Q_PROPERTY(bool errorMode READ getErrorAlarmMode WRITE setErrorAlarmMode)

public:


    struct DataCtrl {
        QMap<int,QVariant> listValue;
    };

private:
    static MainWindow *mainWindow;
    EnumControl::LangCode langCode;
    EnumControl::StatusMachine  statusMachine;
    bool errorAlarmMode;

public:
    static MainWindow* GetInstance();
    MainWindow();
    EnumControl::LangCode language();
    void setLanguage(EnumControl::LangCode lang);
    Q_INVOKABLE void InnerChangeScreen(int id);
    Q_INVOKABLE void InnerChangeBottomBar(int id);
    Q_INVOKABLE void InnerChangeStatusBar(int id);
    Q_INVOKABLE void InnerRefreshScreen();
    Q_INVOKABLE void GoBackScreen();

    EnumControl::StatusMachine getStatusMachine();
    void setStatusMachine(EnumControl::StatusMachine value);

    void setErrorAlarmMode(bool mode);
    bool getErrorAlarmMode();

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
