#include "bufferedgraphicspanel.h"

BufferedGraphicsPanel::BufferedGraphicsPanel()
{
    m_Image = QImage(_WIDTH_SCREEN, _HEIGHT_SCREEN, QImage::Format_RGB32);
    m_Painter = new QPainter(&m_Image);

    m_Timer = new QTimer();
    connect(m_Timer, SIGNAL(timeout()), this, SLOT(refreshPanel()));
    m_Timer->start(m_Frequence);
}

BufferedGraphicsPanel::~BufferedGraphicsPanel()
{
    m_Timer->stop();
    delete m_Painter;
    delete m_Timer;
}

void BufferedGraphicsPanel::paint(QPainter *painter)
{
    painter->drawImage(this->boundingRect(), m_Image);
}

void BufferedGraphicsPanel::refreshPanel()
{
    m_Painter->fillRect(0, 0, _WIDTH_SCREEN, _HEIGHT_SCREEN, QColor(0, 0, 0));
    emit signalDrawControl(m_Painter);
    this->update();
}

void BufferedGraphicsPanel::setFrequence(const int frequence)
{
    m_Frequence = frequence;
    m_Timer->start(m_Frequence);
}

int BufferedGraphicsPanel::getFrequence() const
{
    return m_Frequence;
}

void BufferedGraphicsPanel::updateBufferedGraphisPanel()
{
    this->update();
}
