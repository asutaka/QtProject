#ifndef ZOOMLINEVM_H
#define ZOOMLINEVM_H
#include <QObject>

class ZoomLineVM : public QObject
{
  Q_OBJECT
public:
  explicit ZoomLineVM(QObject *parent = 0);

  Q_INVOKABLE void onLoad();
signals:

public slots:
};
#endif // ZOOMLINEVM_H
