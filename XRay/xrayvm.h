#ifndef XRAYVM_H
#define XRAYVM_H

#include <QObject>

class XRayVM : public QObject
{
  Q_OBJECT
public:
  explicit XRayVM(QObject *parent = 0);
  Q_INVOKABLE void onLoad();
signals:

public slots:
};

#endif // XRAY_VM_H
