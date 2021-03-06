#ifndef ONERINGAPP_H
#define ONERINGAPP_H

#include <onering.h>
#include <QVariantMap>
#include <QSet>
#include <QByteArray>
#include <QEvent>
#include "oneringview.h"
#include "app.h"

class OneRingApp : public App
{
	Q_OBJECT

public:
	OneRingApp(const QString& appname, QObject* parent=0);

	static OneRingView* createWindow(const QVariantMap& props);

private slots:
	void windowEventOccurred(QEvent* e, const QString& type);
	void windowDestroyed(QObject *);
#ifdef Q_WS_MAC
#ifdef QT_MAC_USE_COCOA
	void dockIconClicked();
#endif
#endif

private:
       	QByteArray processCall(const QString& command, const QVariantMap& param);
	QByteArray _js;
	QSet<OneRingView *> _windows;
};

void register_onering_app(const char* appname);

#endif
