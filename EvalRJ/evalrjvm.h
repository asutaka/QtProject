#ifndef EVALRJVM_H
#define EVALRJVM_H

#include <QObject>

class EvalRJVM : public QObject
{
  Q_OBJECT
public:
  explicit EvalRJVM(QObject *parent = 0);
  Q_INVOKABLE void onLoad();
signals:

public slots:
};

#endif // EVALRJVM_H
