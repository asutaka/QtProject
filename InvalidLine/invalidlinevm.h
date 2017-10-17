#ifndef INVALIDLINEVM_H
#define INVALIDLINEVM_H

#include <QObject>

class InvalidLineVM : public QObject
{
  Q_OBJECT
public:
  explicit InvalidLineVM(QObject *parent = 0);
  Q_INVOKABLE void onLoad();
signals:

public slots:
};

#endif // INVALIDLINEVM_H
