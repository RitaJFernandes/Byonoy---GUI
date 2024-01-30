#ifndef INTERFACE_H
#define INTERFACE_H

#include <QObject>
#include <QUrl>

class Interface : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(Interface)

    Q_PROPERTY(int pwmDefault READ pwmDefault CONSTANT)
    Q_PROPERTY(int pwmMax READ pwmMax CONSTANT)
    Q_PROPERTY(int pwmMin READ pwmMin CONSTANT)
    Q_PROPERTY(int pwmMaxStep READ pwmMaxStep CONSTANT)
    Q_PROPERTY(int pwmMinStep READ pwmMinStep CONSTANT)

    Q_PROPERTY(int dacMax READ dacMax CONSTANT)
    Q_PROPERTY(int dacMin READ dacMin CONSTANT)
    Q_PROPERTY(int dacMaxStep READ dacMaxStep CONSTANT)
    Q_PROPERTY(int dacMinStep READ dacMinStep CONSTANT)

    Q_PROPERTY(double pwmKp READ pwmKp WRITE setPwmKp NOTIFY pwmKpChanged)
    Q_PROPERTY(double dacKp READ dacKp WRITE setDacKp NOTIFY dacKpChanged)
    Q_PROPERTY(int pwmStep READ pwmStep WRITE setPwmStep NOTIFY pwmStepChanged)
    Q_PROPERTY(int dacStep READ dacStep WRITE setDacStep NOTIFY dacStepChanged)
    Q_PROPERTY(QString logFilePath READ logFilePath WRITE setLogFilePath NOTIFY logFilePathChanged)


public:
    explicit Interface(QObject *parent = nullptr);

    // Getters
    // pwm
    int pwmDefault() const;
    int pwmMax() const;
    int pwmMin() const;
    int pwmMaxStep() const;
    int pwmMinStep() const;

    double pwmKp() const;
    int pwmStep() const;

    // dac
    int dacMax() const;
    int dacMin() const;
    int dacMaxStep() const;
    int dacMinStep() const;

    double dacKp() const;
    int dacStep() const;

    QString logFilePath() const;

public slots:
    // Setters
    void setPwmKp(double newValue);
    void setDacKp(double newValue);
    void setPwmStep(int newValue);
    void setDacStep(int newValue);
    void setLogFilePath(QUrl url);

signals:
    void pwmKpChanged();
    void dacKpChanged();
    void pwmStepChanged();
    void dacStepChanged();
    void logFilePathChanged();

private:
    int m_pwmDefault; 
    int m_pwmMax;
    int m_pwmMin;
    int m_pwmMaxStep;
    int m_pwmMinStep;

    int m_dacMax;
    int m_dacMin;
    int m_dacMaxStep;
    int m_dacMinStep;

    double m_pwmKp; // gain1
    double m_dacKp; // gain2
    int m_pwmStep; // step1
    int m_dacStep; // step2

    QString m_logFilePath;
};

#endif // INTERFACE_H
