#ifndef TESTVM_H
#define TESTVM_H

#include <QObject>

class TestVM : public QObject
{
  Q_OBJECT
public:
  explicit TestVM(QObject *parent = 0);
  Q_INVOKABLE void onLoad();
signals:

public slots:
};

#endif // TESTVM_H
