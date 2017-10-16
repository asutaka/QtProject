#include "gpnlmaintadjusttimingtbl.h"
#include <QPainter>
#include <QDebug>
#include <QQuickItem>
#include <AdjustTiming/resultimportline.h>
#include <QList>

GPnlMaintAdjustTimingTbl::GPnlMaintAdjustTimingTbl(QQuickItem *parent)
    : QQuickPaintedItem(parent)
{
}

GPnlMaintAdjustTimingTbl::~GPnlMaintAdjustTimingTbl()
{
}
void GPnlMaintAdjustTimingTbl::paint(QPainter *painter)
{
    painter->fillRect(0, 0, 1024, 640, QColor(0, 0, 0));
    drawLegendLine(painter);
    if(isDrawTn){
        if(local.count()!=0){
            DrawTn(painter, QColor(255,0,0),QPoint(local[1], local[0]),"T1",local[5],local[6]);
            DrawTn(painter, QColor(0,255,0),QPoint(local[2],local[0]),"T2",local[5],local[1]);
            DrawTn(painter, QColor(255,255,255),QPoint(local[3],local[0]),"T3",local[5],local[2]);
            DrawTn(painter, QColor(0,191,255),QPoint(local[4],local[0]),"T4",local[5],local[3]);
        }
    }
}
void GPnlMaintAdjustTimingTbl::setDrawTn(QList<int>localTn){
    local =localTn;
    isDrawTn= true;
    this->update();
}
void GPnlMaintAdjustTimingTbl::drawLegendLine(QPainter *qp){
    if (listResultImportLine.count()== 0)
    {
        createList();
    }
    //Draw Item
    QPoint pos1(450,50);
    QPoint pos2(450,81);
    for (int i = 0; i < listResultImportLine.count(); i++)
    {
        listResultImportLine[i]->importNumber = i;
        if(i< (_MAX_LINE_NO/2)){
            listResultImportLine[i]->DrawControl(qp,pos1);
            pos1.setX(pos1.x()+ 81);
        }
        else{
            listResultImportLine[i]->DrawControl(qp,pos2);
            pos2.setX(pos2.x()+ 81);
        }
    }
}

void GPnlMaintAdjustTimingTbl ::createList(){
    if (listResultImportLine.count() != 0)
    {
        listResultImportLine.clear();
    }
    for (int i = 0; i < _MAX_LINE_NO; i++)
    {
        ResultImportLine* temp = new ResultImportLine();
        if(i< lineImport.count()){
            temp->lineNo = lineImport[i];
        }
        if(i== (lineImport.count()-1)){
            temp->isSelect = true;
            indexLineActive= lineImport.count();
        }
        temp->weight =(rand()%10 +100);
        listResultImportLine.append(temp);
        importCount ++;
    }
}

QString GPnlMaintAdjustTimingTbl:: updateListResultImportLine(QList<int> line){
    lineImport = line;
    createList();
    this->update();
    QString result = QString::number(lineImport.count()) + "," + QString::number(listResultImportLine[indexLineActive-1]->weight)+ "," + QString::number(listResultImportLine[indexLineActive-1]->lineNo);
    return result;
}
QString GPnlMaintAdjustTimingTbl ::clearLegend(bool isAll){
    int indexLineActiveOld;
    QString result ="";
    int weightAllLine = 100;
    if(indexLineActive !=0){
        if(isAll){
            lineImport.clear();
            indexLineActive = 0;
            result = QString::number(indexLineActive) +","+ QString::number(weightAllLine)+ ",1";
            createList();
        }
        else{
            lineImport.removeAt(indexLineActive-1);
            indexLineActiveOld = indexLineActive;
            indexLineActive = lineImport.count();
            createList();
            if(indexLineActive !=0){
                result =QString::number(indexLineActiveOld)+","+ QString::number(indexLineActive) +"," + QString::number(listResultImportLine[indexLineActive-1]->weight)+ "," + QString::number(listResultImportLine[indexLineActive-1]->lineNo);
            }
            else{
                result = QString::number(indexLineActiveOld)+","+ QString::number(indexLineActive) +","+ QString::number(weightAllLine)+ ",1";
            }
        }
        this->update();
        return  result;
    }
    else{
        return "-1";
    }
}
QString GPnlMaintAdjustTimingTbl:: changeLineActive(int mouseX, int mouseY){
    QString result ="";
    for(int j= 0;j<6; j++){
        if((mouseX >= (j*80))&&(mouseX < ((j+1)*80))){
            if(mouseY<30){
                if(listResultImportLine[j]->lineNo !=0){
                    listResultImportLine[indexLineActive-1]->isSelect= false;
                    listResultImportLine[j]->isSelect= true;
                    result = QString::number(listResultImportLine[j]->lineNo) + "," + QString::number(listResultImportLine[j]->weight)+","+ QString::number(listResultImportLine[j]->importNumber);
                    indexLineActive =j+1;
                }
                else {
                    result = QString::number(0);
                }
            }
            else{
                if(listResultImportLine[j+6]->lineNo !=0){
                    listResultImportLine[indexLineActive-1]->isSelect= false;
                    listResultImportLine[j+6]->isSelect= true;
                    result = QString::number(listResultImportLine[j+6]->lineNo) + "," + QString::number(listResultImportLine[j+6]->weight)+","+ QString::number(listResultImportLine[j+6]->importNumber);
                    indexLineActive = j+7;
                }
                else{
                    result = QString::number(0);
                }
            }
            this->update();
        }
    }
    return result;
}
void GPnlMaintAdjustTimingTbl:: DrawTn(QPainter *qp,QColor color, QPoint start,QString strTn,int maxX,int preTnX){
    int offsetLocalText = 440;
    QPen asisColor(color,0.7, Qt::SolidLine);
    qp->setPen(asisColor);

    QFont font(":/Images/MS Gothic.ttf",13, QFont::Normal);
    font.setPixelSize(17);
    qp->setFont(font);
    if((start.x() > maxX)||(start.x()>=(maxX -25))){
        if (start.x() > maxX){
            start.setX(maxX);
        }
        qp->drawLine(start.x(),start.y()-102,start.x(),start.y()-425);
        qp->drawLine(start.x(),start.y(),start.x(),start.y()-86);
        if(strTn == "T1"){
            qp->drawLine(start.x(),start.y()-425,start.x()-90,start.y()-436);
            QPen textColor(Qt::white, 1, Qt::SolidLine);
            qp->setPen(textColor);
            qp->drawText(start.x()-100,start.y()-offsetLocalText,strTn);
        }
        else if(strTn == "T2"){
            qp->drawLine(start.x(),start.y()-425,start.x()-70,start.y()-436);
            QPen textColor(Qt::white, 1, Qt::SolidLine);
            qp->setPen(textColor);
            qp->drawText(start.x()-80,start.y()-offsetLocalText,strTn);
        }
        else if(strTn == "T3"){
            qp->drawLine(start.x(),start.y()-425,start.x()-50,start.y()-436);
            QPen textColor(Qt::white, 1, Qt::SolidLine);
            qp->setPen(textColor);
            qp->drawText(start.x()-60,start.y()-offsetLocalText,strTn);
        }
        else{
            qp->drawLine(start.x(),start.y()-425,start.x()-30,start.y()-436);
            QPen textColor(Qt::white, 1, Qt::SolidLine);
            qp->setPen(textColor);
            qp->drawText(start.x()-40,start.y()-offsetLocalText,strTn);
        }
    }
    else{
        if(start.x()< (maxX -25)){
            if((start.x()- preTnX)<25)
            {
                qp->drawLine(start.x(),start.y()-102,start.x(),start.y()-425);
                qp->drawLine(start.x(),start.y(),start.x(),start.y()-86);
                if((start.x()-378)<100){
                    if(strTn == "T1"){
                        qp->drawLine(start.x(),start.y()-425,start.x()+30,start.y()-436);
                        QPen textColor(Qt::white, 1, Qt::SolidLine);
                        qp->setPen(textColor);
                        qp->drawText(start.x()+20,start.y()-offsetLocalText,strTn);
                    }
                    else if(strTn == "T2"){
                        qp->drawLine(start.x(),start.y()-425,start.x()+50,start.y()-436);
                        QPen textColor(Qt::white, 1, Qt::SolidLine);
                        qp->setPen(textColor);
                        qp->drawText(start.x()+40,start.y()-offsetLocalText,strTn);
                    }
                    else if(strTn == "T3"){
                        qp->drawLine(start.x(),start.y()-425,start.x()+70,start.y()-436);
                        QPen textColor(Qt::white, 1, Qt::SolidLine);
                        qp->setPen(textColor);
                        qp->drawText(start.x()+60,start.y()-offsetLocalText,strTn);
                    }
                    else{
                        qp->drawLine(start.x(),start.y()-425,start.x()+90,start.y()-436);
                        QPen textColor(Qt::white, 1, Qt::SolidLine);
                        qp->setPen(textColor);
                        qp->drawText(start.x()+80,start.y()-offsetLocalText,strTn);
                    }
                }
                else{
                    qp->drawLine(start.x(),start.y()-425,start.x()+10,start.y()-436);
                    QPen textColor(Qt::white, 1, Qt::SolidLine);
                    qp->setPen(textColor);
                    qp->drawText(start.x(),start.y()-offsetLocalText,strTn);
                }
            }
            else{
                qp->drawLine(start.x(),start.y()-102,start.x(),start.y()-436);
                qp->drawLine(start.x(),start.y(),start.x(),start.y()-86);
                QPen textColor(Qt::white, 1, Qt::SolidLine);
                qp->setPen(textColor);
                qp->drawText(start.x()-10,start.y()-offsetLocalText,strTn);
            }
        }
    }
}
