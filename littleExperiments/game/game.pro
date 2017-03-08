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
TARGET = game

CONFIG += sailfishapp

SOURCES += src/game.cpp

OTHER_FILES += qml/game.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SecondPage.qml \
    rpm/game.changes.in \
    rpm/game.spec \
    rpm/game.yaml \
    translations/*.ts \
    game.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/game-de.ts

DISTFILES += \
    qml/pages/Actor.qml \
    qml/pages/Enemy.qml \
    qml/pages/EnemyManager.qml \
    qml/pages/back.jpg \
    qml/pages/enemy.png \
    qml/pages/sheet.png \
    qml/pages/glass.wav \
    qml/pages/Scene.js \
    qml/pages/box.qml \
    qml/pages/Field.qml
