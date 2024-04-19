#include "database.h"

Database::Database(QObject *parent) : QObject(parent)
{
    // Check if the database file exists
    QString dbFilePath = "VentilatorProject.db";
    //QFile dbFile(dbFilePath);

    m_db = QSqlDatabase::addDatabase("QSQLITE");
    m_db.setDatabaseName(dbFilePath);
    createTables();
    if(!m_db.open()){
        qDebug()<<"Error opening db";
    }
}

void Database::createTables()
{
    if (!m_db.open()) {
        qDebug() << "Error: could not open database creating";
        return;
    }

    QSqlQuery query;

    // Create patient_details table
    query.exec("CREATE TABLE IF NOT EXISTS patient_details ("
               "pname TEXT PRIMARY KEY, "
               "peekp INTEGER, "
               "breathrate INTEGER, "
               "spontbr INTEGER, "
               "tv INTEGER, "
               "fio2 INTEGER, "
               "ieratio INTEGER, "
               "spo2hr INTEGER, "
               "minutevol INTEGER,"
               "gaugeval INTEGER"
               ")");

    // Create ventilator_mode table
    query.exec("CREATE TABLE IF NOT EXISTS ventilator_mode ("
               "pname TEXT PRIMARY KEY, "
               "patient_type TEXT, "
               "circuit_type TEXT, "
               "vent_mode TEXT, "
               "breath_options TEXT"
               ")");

    // Create hospital_details table
    query.exec("CREATE TABLE IF NOT EXISTS hospital_details ("
               "pname TEXT PRIMARY KEY, "
               "bedid TEXT, "
               "roomid TEXT, "
               "facilityid TEXT"
               ")");

    // Create settings table
    query.exec("CREATE TABLE IF NOT EXISTS settings ("
               "pname TEXT PRIMARY KEY, "
               "peek_H INTEGER, "
               "peek_L INTEGER, "
               "Minute_vol_H INTEGER, "
               "Minute_vol_L INTEGER, "
               "breathR_H INTEGER, "
               "breathR_L INTEGER, "
               "Tidal_H INTEGER, "
               "tidal_L INTEGER, "
               "peep_H INTEGER, "
               "peep_L INTEGER, "
               "Apnea_H INTEGER, "
               "Apnea_L INTEGER, "
               "Spo2_H INTEGER, "
               "Spo2_L INTEGER, "
               "Fio2_H INTEGER, "
               "Fio2_L INTEGER, "
               "Circuit_disc_H INTEGER, "
               "Circuit_disc_L INTEGER"
               ")");

    query.exec("CREATE TABLE IF NOT EXISTS value_details ("
               "pname TEXT PRIMARY KEY, "
               "insppress INTEGER, "
               "insptime INTEGER, "
               "br INTEGER, "
               "ie INTEGER, "
               "risetime INTEGER, "
               "insptrig INTEGER, "
               "tidalvol INTEGER, "
               "minutevol INTEGER, "
               "peep INTEGER, "
               "breathrate INTEGER, "
               "presssup INTEGER"
               ")");


    // m_db.close();
}

bool Database::insertPatientDetails(QString pname, int peekp, int breathrate, int spontbr, int tv, int fio2, int ieratio, int spo2hr, int minutevol,int gaugeval)
{

    // if (!m_db.open()) {
    //     qDebug() << "Error: could not open database";
    //     return false;
    // }
    // QSqlQuery query(m_db);
    QSqlQuery query;
    query.prepare("INSERT INTO patient_details (pname, peekp, breathrate, spontbr, tv, fio2, ieratio, spo2hr, minutevol,gaugeval) "
                  "VALUES (:pname, :peekp, :breathrate, :spontbr, :tv, :fio2, :ieratio, :spo2hr, :minutevol,:gaugeval)");
    query.bindValue(":pname", pname);
    query.bindValue(":peekp", peekp);
    query.bindValue(":breathrate", breathrate);
    query.bindValue(":spontbr", spontbr);
    query.bindValue(":tv", tv);
    query.bindValue(":fio2", fio2);
    query.bindValue(":ieratio", ieratio);
    query.bindValue(":spo2hr", spo2hr);
    query.bindValue(":minutevol", minutevol);
    query.bindValue(":gaugeval", gaugeval);

    bool success = query.exec();
    // m_db.close();
    return success;
}
bool Database::updatePatientDetails(const QString &pname, int peekp, int breathrate, int spontbr, int tv, int fio2, int ieratio, int spo2hr, int minutevol, int gaugeval)
{
    // if (!m_db.open()) {
    //     qDebug() << "Error: could not open database";
    //     return false;
    // }
    qDebug() <<pname;
    qDebug() <<"inside update function ";
    QSqlQuery query(m_db);
    query.prepare("UPDATE patient_details SET peekp = :peekp, breathrate = :breathrate, spontbr = :spontbr, "
                  "tv = :tv, fio2 = :fio2, ieratio = :ieratio, spo2hr = :spo2hr, minutevol = :minutevol, gaugeval = :gaugeval "
                  "WHERE pname = :pname");
    query.bindValue(":peekp", peekp);
    query.bindValue(":breathrate", breathrate);
    query.bindValue(":spontbr", spontbr);
    query.bindValue(":tv", tv);
    query.bindValue(":fio2", fio2);
    query.bindValue(":ieratio", ieratio);
    query.bindValue(":spo2hr", spo2hr);
    query.bindValue(":minutevol", minutevol);
    query.bindValue(":gaugeval", gaugeval);
    query.bindValue(":pname", pname);

    bool success = query.exec();
    // m_db.close();
    return success;
}
bool Database::deletePatientDetails(const QString &pname)
{
    // if (!m_db.open()) {
    //     qDebug() << "Error: could not open database";
    //     return false;
    // }

    QSqlQuery query(m_db);
    query.prepare("DELETE FROM patient_details WHERE pname = :pname");
    query.bindValue(":pname", pname);

    bool success = query.exec();
    // m_db.close();
    return success;
}
QVariantMap Database::fetchPatientDetails(const QString &pname)
{
    QVariantMap patientData;

    // if (!m_db.open()) {
    //     qDebug() << "Error: could not open database";
    //     return patientData;
    // }

    QSqlQuery query(m_db);
    query.prepare("SELECT * FROM patient_details WHERE pname = :pname");
    query.bindValue(":pname", pname);
    qDebug() << "pname:" << patientData["pname"];
    if (!query.exec()) {
        qDebug() << "Error executing query:" << query.lastError().text();
        m_db.close();
        return patientData;
    }

    if (query.next()) {
        // Fetch the data from the query result
        patientData["pname"] = query.value("pname").toString();
        qDebug() << "pname:" << patientData["pname"];

        patientData["peekp"] = query.value("peekp").toInt();
        qDebug() << "peekp:" << patientData["peekp"];

        patientData["breathrate"] = query.value("breathrate").toInt();
        qDebug() << "breathrate:" << patientData["breathrate"];

        patientData["spontbr"] = query.value("spontbr").toInt();
        qDebug() << "spontbr:" << patientData["spontbr"];

        patientData["tv"] = query.value("tv").toInt();
        qDebug() << "tv:" << patientData["tv"];

        patientData["fio2"] = query.value("fio2").toInt();
        qDebug() << "fio2:" << patientData["fio2"];

        patientData["ieratio"] = query.value("ieratio").toInt();
        qDebug() << "ieratio:" << patientData["ieratio"];

        patientData["spo2hr"] = query.value("spo2hr").toInt();
        qDebug() << "spo2hr:" << patientData["spo2hr"];

        patientData["minutevol"] = query.value("minutevol").toInt();
        qDebug() << "minutevol:" << patientData["minutevol"];

        patientData["gaugeval"] = query.value("gaugeval").toInt();
        qDebug() << "gaugeval:" << patientData["gaugeval"];


    }

    return patientData;
}
QStringList Database::getPNames() {
    QStringList pNames;

    // if (!m_db.open()) {
    //     qDebug() << "Error: could not open database";
    //     //return pNames;
    // }

    QSqlQuery query("SELECT pname FROM patient_details");
    while (query.next()) {
        pNames.append(query.value(0).toString());
    }

    // m_db.close();
    return pNames;
}
bool Database::insertVentilatorMode(QString pname, QString patientType, QString circuitType, QString ventMode, QString breathOptions)
{
    // if (!m_db.open()) {
    //     qDebug() << "Error: could not open database";
    //     return false;
    // }

    QSqlQuery query;
    query.prepare("INSERT INTO ventilator_mode (pname, patient_type, circuit_type, vent_mode, breath_options) "
                  "VALUES (:pname, :patientType, :circuitType, :ventMode, :breathOptions)");
    query.bindValue(":pname", pname);
    query.bindValue(":patientType", patientType);
    query.bindValue(":circuitType", circuitType);
    query.bindValue(":ventMode", ventMode);
    query.bindValue(":breathOptions", breathOptions);

    bool success = query.exec();
    // m_db.close();
    return success;
}
bool Database::deleteVentilatorMode(QString pname)
{
    QSqlQuery query;
    query.prepare("DELETE FROM ventilator_mode WHERE pname = :pname");
    query.bindValue(":pname", pname);

    bool success = query.exec();
    return success;
}
bool Database::updateVentilatorMode(QString pname, QString newPatientType, QString newCircuitType, QString newVentMode, QString newBreathOptions)
{
    QSqlQuery query;
    query.prepare("UPDATE ventilator_mode SET patient_type = :newPatientType, circuit_type = :newCircuitType, "
                  "vent_mode = :newVentMode, breath_options = :newBreathOptions WHERE pname = :pname");
    query.bindValue(":newPatientType", newPatientType);
    query.bindValue(":newCircuitType", newCircuitType);
    query.bindValue(":newVentMode", newVentMode);
    query.bindValue(":newBreathOptions", newBreathOptions);
    query.bindValue(":pname", pname);

    bool success = query.exec();
    return success;
}
QVariantMap Database::fetchVentilatorMode(const QString &pname)
{
    QVariantMap ventilatorModeData;
    // // Check if the database is open
    // if (!m_db.isOpen() && !m_db.open()) {
    //     qDebug() << "Error: could not open database";
    //     return ventilatorModeData;
    // }
    QSqlQuery query(m_db);
    query.prepare("SELECT * FROM ventilator_mode WHERE pname = :pname");
    query.bindValue(":pname", pname);

    if (!query.exec()) {
        qDebug() << "Error executing query:" << query.lastError().text();
        m_db.close();
        return ventilatorModeData;
    }
    if (query.next()) {
        // Fetch the data from the query result
        ventilatorModeData["pname"] = query.value("pname").toString();
        ventilatorModeData["patientType"] = query.value("patient_type").toInt();
        ventilatorModeData["circuitType"] = query.value("circuit_type").toInt();
        ventilatorModeData["ventMode"] = query.value("vent_mode").toInt();
        ventilatorModeData["breathOptions"] = query.value("breath_options").toInt();
    }
    return ventilatorModeData;
}

bool Database::insertHospitalDetails(QString pname, QString bedId, QString roomId, QString facilityId)
{
    // if (!m_db.open()) {
    //     qDebug() << "Error: could not open database";
    //     return false;
    // }
    qDebug() << "inserting hospital details";
    QSqlQuery query;
    query.prepare("INSERT INTO hospital_details (pname, bedid, roomid, facilityid) "
                  "VALUES (:pname, :bedId, :roomId, :facilityId)");
    query.bindValue(":pname", pname);
    query.bindValue(":bedId", bedId);
    query.bindValue(":roomId", roomId);
    query.bindValue(":facilityId", facilityId);
    qDebug() << "inserted hospital details";
    bool success = query.exec();
    // m_db.close();
    return success;
}
bool Database::updateHospitalDetails(const QString &pname, const QString &bedId, const QString &roomId, const QString &facilityId)
{
    // if (!m_db.open()) {
    //     qDebug() << "Error: could not open database";
    //     return false;
    // }
    qDebug() << "updatingting hospital details";
    QSqlQuery query;
    query.prepare("UPDATE hospital_details SET bedid = :bedId, roomid = :roomId, facilityid = :facilityId WHERE pname = :pname");
    query.bindValue(":pname", pname);
    query.bindValue(":bedId", bedId);
    query.bindValue(":roomId", roomId);
    query.bindValue(":facilityId", facilityId);
    qDebug() << "updated hospital details";
    bool success = query.exec();
    // m_db.close();
    return success;
}
bool Database::deleteHospitalDetails(const QString &pname)
{
    // if (!m_db.open()) {
    //     qDebug() << "Error: could not open database";
    //     return false;
    // }

    QSqlQuery query;
    query.prepare("DELETE FROM hospital_details WHERE pname = :pname");
    query.bindValue(":pname", pname);

    bool success = query.exec();
    //m_db.close();
    return success;
}

bool Database::insertSettings(QString pname, int peekH, int peekL, int minuteVolH, int minuteVolL, int breathRH, int breathRL, int tidalH, int tidalL, int peepH, int peepL, int apneaH, int apneaL, int spo2H, int spo2L, int fio2H, int fio2L, int circuitDiscH, int circuitDiscL)
{
    // if (!m_db.open()) {
    //     qDebug() << "Error: could not open database";
    //     return false;
    // }

    QSqlQuery query;
    query.prepare("INSERT INTO settings (pname, peek_H, peek_L, Minute_vol_H, Minute_vol_L, breathR_H, breathR_L, Tidal_H, tidal_L, peep_H, peep_L, Apnea_H, Apnea_L, Spo2_H, Spo2_L, Fio2_H, Fio2_L, Circuit_disc_H, Circuit_disc_L) "
                  "VALUES (:pname, :peekH, :peekL, :minuteVolH, :minuteVolL, :breathRH, :breathRL, :tidalH, :tidalL, :peepH, :peepL, :apneaH, :apneaL, :spo2H, :spo2L, :fio2H, :fio2L, :circuitDiscH, :circuitDiscL)");
    query.bindValue(":pname", pname);
    query.bindValue(":peekH", peekH);
    query.bindValue(":peekL", peekL);
    query.bindValue(":minuteVolH", minuteVolH);
    query.bindValue(":minuteVolL", minuteVolL);
    query.bindValue(":breathRH", breathRH);
    query.bindValue(":breathRL", breathRL);
    query.bindValue(":tidalH", tidalH);
    query.bindValue(":tidalL", tidalL);
    query.bindValue(":peepH", peepH);
    query.bindValue(":peepL", peepL);
    query.bindValue(":apneaH", apneaH);
    query.bindValue(":apneaL", apneaL);
    query.bindValue(":spo2H", spo2H);
    query.bindValue(":spo2L", spo2L);
    query.bindValue(":fio2H", fio2H);
    query.bindValue(":fio2L", fio2L);
    query.bindValue(":circuitDiscH", circuitDiscH);
    query.bindValue(":circuitDiscL", circuitDiscL);

    bool success = query.exec();
    // m_db.close();
    return success;
}
bool Database::updateSettings(const QString &pname, int peekH, int peekL, int minuteVolH, int minuteVolL, int breathRH, int breathRL, int tidalH, int tidalL, int peepH, int peepL, int apneaH, int apneaL, int spo2H, int spo2L, int fio2H, int fio2L, int circuitDiscH, int circuitDiscL)
{
    // if (!m_db.open()) {
    //     qDebug() << "Error: could not open database";
    //     return false;
    // }

    QSqlQuery query;
    query.prepare("UPDATE settings SET peek_H = :peekH, peek_L = :peekL, Minute_vol_H = :minuteVolH, Minute_vol_L = :minuteVolL, breathR_H = :breathRH, breathR_L = :breathRL, Tidal_H = :tidalH, tidal_L = :tidalL, peep_H = :peepH, peep_L = :peepL, Apnea_H = :apneaH, Apnea_L = :apneaL, Spo2_H = :spo2H, Spo2_L = :spo2L, Fio2_H = :fio2H, Fio2_L = :fio2L, Circuit_disc_H = :circuitDiscH, Circuit_disc_L = :circuitDiscL WHERE pname = :pname");
    query.bindValue(":pname", pname);
    query.bindValue(":peekH", peekH);
    query.bindValue(":peekL", peekL);
    query.bindValue(":minuteVolH", minuteVolH);
    query.bindValue(":minuteVolL", minuteVolL);
    query.bindValue(":breathRH", breathRH);
    query.bindValue(":breathRL", breathRL);
    query.bindValue(":tidalH", tidalH);
    query.bindValue(":tidalL", tidalL);
    query.bindValue(":peepH", peepH);
    query.bindValue(":peepL", peepL);
    query.bindValue(":apneaH", apneaH);
    query.bindValue(":apneaL", apneaL);
    query.bindValue(":spo2H", spo2H);
    query.bindValue(":spo2L", spo2L);
    query.bindValue(":fio2H", fio2H);
    query.bindValue(":fio2L", fio2L);
    query.bindValue(":circuitDiscH", circuitDiscH);
    query.bindValue(":circuitDiscL", circuitDiscL);

    bool success = query.exec();
    //m_db.close();
    return success;
}
bool Database::deleteSettings(const QString &pname)
{
    // if (!m_db.open()) {
    //     qDebug() << "Error: could not open database";
    //     return false;
    // }

    QSqlQuery query;
    query.prepare("DELETE FROM settings WHERE pname = :pname");
    query.bindValue(":pname", pname);

    bool success = query.exec();
    //m_db.close();
    return success;
}
bool Database::isPnameExists(const QString &pname) {
    // QSqlDatabase db = QSqlDatabase::database();
    // if (!db.isOpen() && !db.open()) {
    //     qDebug() << "Error: could not open database";
    //     return false;
    // }

    QSqlQuery query(m_db);
    query.prepare("SELECT COUNT(*) FROM patient_details WHERE pname = :pname");
    query.bindValue(":pname", pname);
    qDebug() <<pname;
    if (!query.exec()) {
        qDebug() << "Error executing query:" << query.lastError().text();
        // db.close(); // Close the database connection
        return false; // Query execution failed
    }

    if (query.next()) {
        int count = query.value(0).toInt();
        //db.close(); // Close the database connection

        if (count > 0) {
            qDebug() << "Pname" << pname << "exists in the details table";
            return true; // Pname exists
        } else {
            qDebug() << "Pname" << pname << "does not exist in the details table";
            return false; // Pname does not exist
        }
    } else {
        qDebug() << "No result returned by query";
        //db.close(); // Close the database connection
        return false;
    }
}
QVariantMap Database::fetchSettings(const QString &pname)
{
    QVariantMap settingsData;

    // if (!m_db.open()) {
    //     qDebug() << "Error: could not open database";
    //     return settingsData;
    // }

    QSqlQuery query(m_db);
    query.prepare("SELECT * FROM settings WHERE pname = :pname");
    query.bindValue(":pname", pname);

    if (!query.exec()) {
        qDebug() << "Error executing query:" << query.lastError().text();
        m_db.close();
        return settingsData;
    }

    if (query.next()) {
        // Fetch the data from the query result
        settingsData["pname"] = query.value("pname");
        settingsData["peekH"] = query.value("peek_H").toInt();
        settingsData["peekL"] = query.value("peek_L").toInt();
        settingsData["minuteVolH"] = query.value("Minute_vol_H").toInt();
        settingsData["minuteVolL"] = query.value("Minute_vol_L").toInt();
        settingsData["breathRH"] = query.value("breathR_H").toInt();
        settingsData["breathRL"] = query.value("breathR_L").toInt();
        settingsData["tidalH"] = query.value("Tidal_H").toInt();
        settingsData["tidalL"] = query.value("tidal_L").toInt();
        settingsData["peepH"] = query.value("peep_H").toInt();
        settingsData["peepL"] = query.value("peep_L").toInt();
        settingsData["apneaH"] = query.value("Apnea_H").toInt();
        settingsData["apneaL"] = query.value("Apnea_L").toInt();
        settingsData["spo2H"] = query.value("Spo2_H").toInt();
        settingsData["spo2L"] = query.value("Spo2_L").toInt();
        settingsData["fio2H"] = query.value("Fio2_H").toInt();
        settingsData["fio2L"] = query.value("Fio2_L").toInt();
        settingsData["circuitDiscH"] = query.value("Circuit_disc_H").toInt();
        settingsData["circuitDiscL"] = query.value("Circuit_disc_L").toInt();
    }

    return settingsData;
}
bool Database::insertValueDetails(QString pname, int insppress, int insptime, int br, int ie, int risetime, int insptrig, int tidalvol, int minutevol, int peep,int breathrate, int presssup)
{
    QSqlQuery query;
    query.prepare("INSERT INTO value_details (pname, insppress, insptime, br, ie, risetime, insptrig, tidalvol, minutevol, peep,breathrate, presssup) "
                  "VALUES (:pname, :insppress, :insptime, :br, :ie, :risetime, :insptrig, :tidalvol, :minutevol, :peep,:breathrate, :presssup)");
    query.bindValue(":pname", pname);
    query.bindValue(":insppress", insppress);
    query.bindValue(":insptime", insptime);
    query.bindValue(":br", br);
    query.bindValue(":ie", ie);
    query.bindValue(":risetime", risetime);
    query.bindValue(":insptrig", insptrig);
    query.bindValue(":tidalvol", tidalvol);
    query.bindValue(":minutevol", minutevol);
    query.bindValue(":peep", peep);
    query.bindValue(":breathrate",breathrate);
    query.bindValue(":presssup", presssup);

    bool success = query.exec();
    return success;
}

bool Database::updateValueDetails(const QString &pname, int insppress, int insptime, int br, int ie, int risetime, int insptrig, int tidalvol, int minutevol, int peep,int breathrate, int presssup)
{
    QSqlQuery query;
    query.prepare("UPDATE value_details SET insppress = :insppress, insptime = :insptime, br = :br, ie = :ie, risetime = :risetime, insptrig = :insptrig, tidalvol = :tidalvol, minutevol = :minutevol, peep = :peep,breathrate=:breathrate, presssup = :presssup "
                  "WHERE pname = :pname");
    query.bindValue(":insppress", insppress);
    query.bindValue(":insptime", insptime);
    query.bindValue(":br", br);
    query.bindValue(":ie", ie);
    query.bindValue(":risetime", risetime);
    query.bindValue(":insptrig", insptrig);
    query.bindValue(":tidalvol", tidalvol);
    query.bindValue(":minutevol", minutevol);
    query.bindValue(":peep", peep);
    query.bindValue(":presssup", presssup);
    query.bindValue(":breathrate",breathrate);
    query.bindValue(":pname", pname);

    bool success = query.exec();
    return success;
}

bool Database::deleteValueDetails(const QString &pname)
{
    QSqlQuery query;
    query.prepare("DELETE FROM value_details WHERE pname = :pname");
    query.bindValue(":pname", pname);

    bool success = query.exec();
    return success;
}

QVariantMap Database::fetchValueDetails(const QString &pname)
{
    QVariantMap valueDetails;

    QSqlQuery query;
    query.prepare("SELECT * FROM value_details WHERE pname = :pname");
    query.bindValue(":pname", pname);

    if (!query.exec()) {
        qDebug() << "Error executing query:" << query.lastError().text();
        return valueDetails;
    }

    if (query.next()) {
        valueDetails["pname"] = query.value("pname").toString();
        valueDetails["insppress"] = query.value("insppress").toInt();
        valueDetails["insptime"] = query.value("insptime").toInt();
        valueDetails["br"] = query.value("br").toInt();
        valueDetails["ie"] = query.value("ie").toInt();
        valueDetails["risetime"] = query.value("risetime").toInt();
        valueDetails["insptrig"] = query.value("insptrig").toInt();
        valueDetails["tidalvol"] = query.value("tidalvol").toInt();
        valueDetails["minutevol"] = query.value("minutevol").toInt();
        valueDetails["peep"] = query.value("peep").toInt();
        valueDetails["breathrate"] = query.value("breathrate").toInt();
        valueDetails["presssup"] = query.value("presssup").toInt();
    }

    return valueDetails;
}
