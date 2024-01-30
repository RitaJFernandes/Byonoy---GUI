#include "interface.h"
#include <QDebug>
#include <QUrl>
#include <QSettings>

Interface::Interface(QObject *parent)
    : QObject{parent}
    , m_pwmDefault(850)
    , m_pwmKp(500)
    , m_pwmMax(4080)
    , m_pwmMin(100)
    , m_pwmMaxStep(200)
    , m_pwmMinStep(0)

    , m_dacKp(500)
    , m_dacMax(2047)
    , m_dacMin(0)
    , m_dacMaxStep(10)
    , m_dacMinStep(0)
{
}

// Getters
// pmw
int Interface::pwmDefault() const
{
    return m_pwmDefault;
}
int  Interface::pwmMax() const
{
    return m_pwmMax;
}
int  Interface::pwmMin() const
{
    return m_pwmMin;
}
int  Interface::pwmMaxStep() const
{
    return m_pwmMaxStep;
}
int  Interface::pwmMinStep() const
{
    return m_pwmMinStep;
}
double Interface::pwmKp() const
{
    return m_pwmKp;
}
int Interface::pwmStep() const
{
    return m_pwmStep;
}


// dac
int Interface::dacMax() const
{
    return m_dacMax;
}
int Interface::dacMin() const
{
    return m_dacMin;
}
int Interface::dacMaxStep() const
{
    return m_dacMaxStep;
}
int Interface::dacMinStep() const
{
    return m_dacMinStep;
}
double Interface::dacKp() const
{
    return m_dacKp;
}
int Interface::dacStep() const
{
    return m_dacStep;
}


QString Interface::logFilePath() const
{
    return m_logFilePath;
}

// Setters
void Interface::setPwmKp(double newValue)
{
    if (m_pwmKp != newValue) {
        m_pwmKp = newValue;
    }
}
void Interface::setDacKp(double newValue)
{
    if (m_dacKp != newValue) {
        m_dacKp = newValue;
    }
}
void  Interface::setPwmStep(int newValue)
{
    if (m_pwmStep != newValue) {
        m_pwmStep = newValue;
    }
}
void  Interface::setDacStep(int newValue)
{
    if (m_dacStep != newValue) {
        m_dacStep = newValue;
    }
}
void  Interface::setLogFilePath(QUrl url)
{
    QString urlString;
    url = url.toLocalFile();
    urlString = url.toString();

    if (m_logFilePath != urlString) {
        m_logFilePath = urlString;
    }
}
