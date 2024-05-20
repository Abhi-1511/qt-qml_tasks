#ifndef FINDROUTE_H
#define FINDROUTE_H

#include <QObject>
#include <QStringList>

struct RouteInfo {
    QString serialNumber;
    QString routeNumber;
    QString driverMessage;
    QString routeFolder;
};

class FindRoute : public QObject
{
    Q_OBJECT
public:
    explicit FindRoute(QObject *parent = nullptr);

    Q_INVOKABLE QStringList getRouteInfo() const;
    Q_INVOKABLE QString getRouteDetails(const QString &routeName);
    //Q_INVOKABLE QString getAudioFilePath(const QString &fileName);
    Q_INVOKABLE QString getAudioFile(int rtSrNo);
    Q_INVOKABLE QString getAudioFilez(const QString &routeName, const QString &stopName) ;

private:
    QList<RouteInfo> routeList;
};

#endif // FINDROUTE_H
