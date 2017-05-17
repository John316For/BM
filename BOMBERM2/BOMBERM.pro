# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = BOMBERM

CONFIG += sailfishapp

SOURCES += src/BOMBERM.cpp

OTHER_FILES += qml/BOMBERM.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SecondPage.qml \
    rpm/BOMBERM.changes.in \
    rpm/BOMBERM.spec \
    rpm/BOMBERM.yaml \
    translations/*.ts \
    BOMBERM.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/BOMBERM-de.ts

DISTFILES += \
    qml/pages/Scene.js \
    qml/pages/Actor.qml \
    qml/pages/Box.qml \
    qml/pages/Field.qml \
    qml/pages/FieldPage.qml \
    qml/pages/Mario.qml \
    qml/pages/MenuPage.qml \
    qml/pages/Stone.qml \
    qml/pages/Bomb.qml \
    qml/pages/Lfpoint.qml \
    qml/pages/PauseMenu.qml \
    qml/pages/GameOver.qml \
    qml/pages/image/pause.jpg \
    qml/pages/image/0fgj.jpg \
    qml/pages/Enemy.qml \
    qml/pages/Mario1.qml \
    qml/pages/Enemy1.qml \
    qml/pages/Enemy2.qml \
    qml/pages/Enemy3.qml \
    qml/pages/Boom.qml
