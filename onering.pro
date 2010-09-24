######################################################################
# Automatically generated by qmake (2.01a) Thu Aug 19 21:40:02 2010
######################################################################

TEMPLATE = lib
TARGET = OneRing
DEPENDPATH += . include src
INCLUDEPATH += . include
QT += script webkit network
RESOURCES = onering.qrc
CONFIG += shared
DEFINES += ONERING_LIBRARY
VERSION = 1
macx {
	CONFIG += lib_bundle
	FRAMEWORK_HEADERS.version = Versions
	FRAMEWORK_HEADERS.files = include/onering.h
	FRAMEWORK_HEADERS.path = Headers
	QMAKE_BUNDLE_DATA += FRAMEWORK_HEADERS
	QMAKE_FRAMEWORK_BUNDLE_NAME = OneRing
	QMAKE_FRAMEWORK_VERSION = $$VERSION
}

debug {
	DEFINES += DEBUG
}

# Input
HEADERS += include/onering.h \
	   src/oneringview.h \
	   src/networkaccessmanager.h \
           src/app.h \
	   src/appreply.h \
	   src/jsapi.h \
	   src/oneringapp.h \
	   src/systemtrayicon.h \
	   src/menu.h
SOURCES += src/onering.cpp \
	   src/oneringview.cpp \
	   src/networkaccessmanager.cpp \
	   src/app.cpp \
	   src/appreply.cpp \
	   src/jsapi.cpp \
	   src/oneringapp.cpp \
	   src/systemtrayicon.cpp \
	   src/menu.cpp

defineReplace( nc  ) { 
    return( $$escape_expand(\n\t)$$1 ) 
}

macx {
	deploy.target = deploy
	deploy.depends = deploy_libraries deploy_plugins
	deploy_libraries.target = deploy_libraries
	deploy_libraries.commands = ./fix_install_names $(DESTDIR)$(TARGETD) --location="Libraries/"
	deploy_plugins.target = deploy_plugins
	deploy_plugins.commands += $$nc( rm -rf `dirname $(DESTDIR)$(TARGETD)`/Plugins)
	deploy_plugins.commands += $$nc( mkdir `dirname $(DESTDIR)$(TARGETD)`/Plugins )
	deploy_plugins.commands += $$nc( cp -r /Developer/Applications/Qt/plugins/phonon_backend/ `dirname $(DESTDIR)$(TARGETD)`/Plugins )
	deploy_plugins.commands += $$nc( ./fix_install_names `dirname $(DESTDIR)$(TARGETD)`/Plugins/*/*.dylib --location="../../Libraries/" )
	QMAKE_EXTRA_TARGETS += deploy deploy_libraries deploy_plugins
}

win32 {
	deploy.target = deploy
	deploy.depends = deploy_demo

	deploy_demo.target = deploy_demo
	deploy_demo.depends = deploy_demo_radio

	deploy_demo_radio.target = deploy_demo_radio
	dlls = QtCore4.dll QtGui4.dll QtNetwork4.dll QtScript4.dll QtWebKit4.dll QtXmlPatterns4.dll
	for(dll, dlls) {
		deploy_demo_radio.commands += $$nc( $(COPY) $$[QT_INSTALL_BINS]\\$${dll} demo\\radio\\ )
	}
	deploy_demo_radio.commands += $$nc( $(COPY) release\\OneRing1.dll demo\\radio\\ )

	QMAKE_EXTRA_TARGETS += deploy deploy_demo deploy_demo_radio
}
