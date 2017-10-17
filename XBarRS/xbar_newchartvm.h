#ifndef XBAR_NEWCHARTVM_H
#define XBAR_NEWCHARTVM_H

#include <QObject>

class XBar_NewChartVM : public QObject
{
  Q_OBJECT
public:
  explicit XBar_NewChartVM(QObject *parent = 0);

  Q_INVOKABLE void onLoad();
signals:

public slots:
};

#endif // XBAR_NEWCHART_H
