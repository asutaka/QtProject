#ifndef RESULTIMPORTLINECOLOR_H
#define RESULTIMPORTLINECOLOR_H
#include <QList>
#include<QPainter>

class ResultImportLineColor
{
public:
    ResultImportLineColor();
    enum PenWidth
    {
        Normal = 0,
        Bold
    };
    QPen* GetDrawLinePen(int colorIndex, PenWidth width = PenWidth::Normal);

private:
    QList<QPen*> _listPens;
    QList<QPen*> _listBoldPens ;
   };

#endif // RESULTIMPORTLINECOLOR_H
