#include "findroute.h"
#include <QFile>
#include <QXmlStreamReader>
#include <QDebug>
#include <QDir>

FindRoute::FindRoute(QObject *parent) : QObject(parent)
{
    QFile file("C:/Users/Abhi/Downloads/iRoute_Folder/iRoute/RouteList.xml");
    if (!file.open(QFile::ReadOnly | QFile::Text)) {
        qDebug() << "Error: Cannot read file";
        return;
    }

    // Parse XML
    QXmlStreamReader xml(&file);

    while (!xml.atEnd() && !xml.hasError()) {
        QXmlStreamReader::TokenType token = xml.readNext();
        if (token == QXmlStreamReader::StartElement ) {
            RouteInfo route;
            route.driverMessage = xml.attributes().value("DriverMessage").toString();
            routeList.append(route);
        }
    }

    if (xml.hasError()) {
        qDebug() << "Error: Failed to parse XML:" << xml.errorString();
        return;
    }

    // Close file
    file.close();
}

QStringList FindRoute::getRouteInfo() const
{
    QStringList result;
    for (const auto& route : routeList) {
        result.append(route.driverMessage  );
    }
    return result;
}
QString FindRoute::getRouteDetails(const QString &routeName)
{
    // qDebug()<<"routename is "+routeName;
    QString filePath;
    if (routeName == "LONG ROUTE") {
        filePath ="C:/Users/Abhi/Downloads/iRoute_Folder/iRoute/0001_LONG_ROUTE/0001_LONG_ROUTE.xml";
    } else if (routeName == "BANDRA") {
        filePath = "C:/Users/Abhi/Downloads/iRoute_Folder/iRoute/0105_BANDRA/0105_BANDRA.xml";
    } else if (routeName == "VASHI") {
        filePath = "C:/Users/Abhi/Downloads/iRoute_Folder/iRoute/0105_VASHI/0105_VASHI.xml";
    } else if (routeName == "BORIVALI") {
        filePath = "C:/Users/Abhi/Downloads/iRoute_Folder/iRoute/0123_BORIVALI/0123_BORIVALI.xml";
    } else if (routeName == "VIVEKANAND NAGAR CBD") {
        filePath = "C:/Users/Abhi/Downloads/iRoute_Folder/iRoute/0123_VIVEKANAND NAGAR CBD/0123_VIVEKANAND NAGAR CBD.xml";
    } else if (routeName == "VASHI NAKA MMRDA COLONY") {
        filePath = "C:/Users/Abhi/Downloads/iRoute_Folder/iRoute/0161_VASHI NAKA MMRDA COLONY/0161_VASHI NAKA MMRDA COLONY.xml";
    } else {
        return "Unknown route";
    }

    QFile file(filePath);
    if (!file.open(QFile::ReadOnly | QFile::Text)) {
        qDebug() << "Error: Cannot read file" << filePath;
        return "Error: Cannot read file";
    }

    QXmlStreamReader xml(&file);
    QStringList stopNames;

    while (!xml.atEnd() && !xml.hasError()) {
        QXmlStreamReader::TokenType token = xml.readNext();
        if (token == QXmlStreamReader::StartElement) {
            QString stopName = xml.attributes().value("StopName").toString();
            // qDebug()<<"stopnmaa out"+stopName;
            if (!stopName.isEmpty()) {
                stopNames.append(stopName);
                // qDebug()<<"stopnmaa"+stopName;
            }
        }
    }

    if (xml.hasError()) {
        qDebug() << "Error: Failed to parse XML:" << xml.errorString();
        return "Error: Failed to parse XML";
    }

    file.close();
    return stopNames.join(", ");
}
//media

// QString FindRoute::getAudioFilePath(const QString &fileName) {
//     QString basePath = "C:/Users/Abhi/Downloads/iRoute_Folder/iRoute/";
//     QString audioFilePath = basePath + fileName;
//     return audioFilePath;
// }
QString FindRoute::getAudioFile(int rtSrNo) {
    QString audioFile;

    QDir audioDir("C:/Users/Abhi/Downloads/iRoute_Folder/iRoute/Audio");
    QStringList nameFilters;
    nameFilters << "*.wav" << "*.mp4"; // Add more formats if needed
    QStringList fileList = audioDir.entryList(nameFilters, QDir::Files);

    // Assuming the audio files have a naming convention where the route serial number is part of their names
    QString rtSrNoString = QString::number(rtSrNo);

    foreach(const QString &file, fileList) {
        if (file.contains(rtSrNoString) && file.contains("AUDCurrent1")) {
            audioFile = file;
            break; // Stop searching once we find the desired audio file
        }
    }
    qDebug()<<audioFile;
    return audioFile;
}
QString FindRoute::getAudioFilez(const QString &routeName, const QString &stopName) {
    QString audioFile;

    // Load XML data
    QString filePath;
    if (routeName == "LONG ROUTE") {
        filePath ="C:/Users/Abhi/Downloads/iRoute_Folder/iRoute/0001_LONG_ROUTE/0001_LONG_ROUTE.xml";
    } else if (routeName == "BANDRA") {
        filePath = "C:/Users/Abhi/Downloads/iRoute_Folder/iRoute/0105_BANDRA/0105_BANDRA.xml";
    } else if (routeName == "VASHI") {
        filePath = "C:/Users/Abhi/Downloads/iRoute_Folder/iRoute/0105_VASHI/0105_VASHI.xml";
    } else if (routeName == "BORIVALI") {
        filePath = "C:/Users/Abhi/Downloads/iRoute_Folder/iRoute/0123_BORIVALI/0123_BORIVALI.xml";
    } else if (routeName == "VIVEKANAND NAGAR CBD") {
        filePath = "C:/Users/Abhi/Downloads/iRoute_Folder/iRoute/0123_VIVEKANAND NAGAR CBD/0123_VIVEKANAND NAGAR CBD.xml";
    } else if (routeName == "VASHI NAKA MMRDA COLONY") {
        filePath = "C:/Users/Abhi/Downloads/iRoute_Folder/iRoute/0161_VASHI NAKA MMRDA COLONY/0161_VASHI NAKA MMRDA COLONY.xml";
    } else {
        return "Unknown route";
    }

    QFile file(filePath);
    if (!file.open(QFile::ReadOnly | QFile::Text)) {
        qDebug() << "Error: Cannot read file";
        return audioFile;
    }

    // Create a XML stream reader
    QXmlStreamReader xml(&file);

    // Iterate through the XML elements
    while (!xml.atEnd() && !xml.hasError()) {
        if (xml.isStartElement()) {
            QXmlStreamAttributes routeInfoAttributes = xml.attributes();
            if (routeInfoAttributes.value("routename").toString() == routeName) {
                while (!(xml.tokenType() == QXmlStreamReader::EndElement && xml.name() == "iRoute:Routeinfo")) {
                    xml.readNext();
                    if (xml.isStartElement()) {
                        QXmlStreamAttributes busStopAttributes = xml.attributes();
                        if (busStopAttributes.value("StopName").toString() == stopName) {
                            audioFile = busStopAttributes.value("AUDCurrent1").toString();
                            break; // Stop searching once we find the desired stop
                        }
                    }
                }
                break; // Stop searching once we find the desired route
            }
        }
        xml.readNext();
    }

    if (xml.hasError()) {
        qDebug() << "Error: Failed to parse XML:" << xml.errorString();
    }

    file.close();
    return audioFile;
}

