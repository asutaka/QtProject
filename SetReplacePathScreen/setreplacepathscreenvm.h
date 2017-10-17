#ifndef SETREPLACEPATHSCREENVM_H
#define SETREPLACEPATHSCREENVM_H

#include <QObject>

class SetReplacePathScreenVM : public QObject
{
  Q_OBJECT
public:
  explicit SetReplacePathScreenVM(QObject *parent = 0);
  Q_INVOKABLE void onLoad();
signals:

public slots:
};

#endif // SETREPLACEPATHSCREENVM_H
