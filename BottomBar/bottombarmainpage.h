#ifndef STATUSBAR_H
#define STATUSBAR_H

#include <QObject>
#include <QString>
class StatusBar : public QObject
{
    Q_OBJECT
public:
   explicit StatusBar(QObject*parent = 0);

signals:
     void connectServer(QString address, quint16 port);
     void sendResponse(QString message);
public slots:
     void connectQml();

private:
    int count;
    QString msg;
};
#endif // STATUSBAR_H
