#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>
#include <QFile>
#include <QVariantList>

class Database : public QObject
{
    Q_OBJECT

public:
    explicit Database(QObject *parent = nullptr);

    Q_INVOKABLE void createTables();
    Q_INVOKABLE bool insertPatientDetails(QString pname, int peekp, int breathrate, int spontbr, int tv, int fio2, int ieratio, int spo2hr, int minutevol, int gaugeval);  
    Q_INVOKABLE bool isPnameExists(const QString &pname);
    Q_INVOKABLE bool updatePatientDetails(const QString &pname, int peekp, int breathrate, int spontbr, int tv, int fio2, int ieratio, int spo2hr, int minutevol, int gaugeval);
    Q_INVOKABLE bool deletePatientDetails(const QString &pname);
    Q_INVOKABLE QStringList getPNames();
    Q_INVOKABLE QVariantMap fetchPatientDetails(const QString &pname);

    Q_INVOKABLE bool insertHospitalDetails(QString pname, QString bedId, QString roomId, QString facilityId);
    Q_INVOKABLE bool updateHospitalDetails(const QString &pname, const QString &bedId, const QString &roomId, const QString &facilityId);
    Q_INVOKABLE bool deleteHospitalDetails(const QString &pname);

    Q_INVOKABLE bool insertSettings(QString pname, int peekH, int peekL, int minuteVolH, int minuteVolL, int breathRH, int breathRL, int tidalH, int tidalL, int peepH, int peepL, int apneaH, int apneaL, int spo2H, int spo2L, int fio2H, int fio2L, int circuitDiscH, int circuitDiscL);
    Q_INVOKABLE bool updateSettings(const QString &pname, int peekH, int peekL, int minuteVolH, int minuteVolL, int breathRH, int breathRL, int tidalH, int tidalL, int peepH, int peepL, int apneaH, int apneaL, int spo2H, int spo2L, int fio2H, int fio2L, int circuitDiscH, int circuitDiscL);
    Q_INVOKABLE bool deleteSettings(const QString &pname);
    Q_INVOKABLE QVariantMap fetchSettings(const QString &pname);

    Q_INVOKABLE bool insertVentilatorMode(QString pname, QString patientType, QString circuitType, QString ventMode, QString breathOptions);
    Q_INVOKABLE bool deleteVentilatorMode(QString pname);
    Q_INVOKABLE bool updateVentilatorMode(QString pname, QString newPatientType, QString newCircuitType, QString newVentMode, QString newBreathOptions);
    Q_INVOKABLE QVariantMap fetchVentilatorMode(const QString &pname);


    Q_INVOKABLE bool insertValueDetails(QString pname, int insppress, int insptime, int br, int ie, int risetime, int insptrig, int tidalvol, int minutevol, int peep, int breathrate, int presssup);
    Q_INVOKABLE bool updateValueDetails(const QString &pname, int insppress, int insptime, int br, int ie, int risetime, int insptrig, int tidalvol, int minutevol, int peep,int breathrate, int presssup);
    Q_INVOKABLE bool deleteValueDetails(const QString &pname);
    Q_INVOKABLE QVariantMap fetchValueDetails(const QString &pname);
private:
    QSqlDatabase m_db;
};

#endif // DATABASE_H
