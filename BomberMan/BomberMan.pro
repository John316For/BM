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
TARGET = BomberMan

CONFIG += sailfishapp

SOURCES += src/BomberMan.cpp

OTHER_FILES += qml/BomberMan.qml \
    qml/cover/CoverPage.qml \
    qml/pages/SecondPage.qml \
    rpm/BomberMan.changes.in \
    rpm/BomberMan.spec \
    rpm/BomberMan.yaml \
    translations/*.ts \
    BomberMan.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/BomberMan-de.ts

DISTFILES += \
    image/mainMenu960x540.jpg \
    icons/108x108/BomberMan.png \
    icons/128x128/BomberMan.png \
    icons/256x256/BomberMan.png \
    icons/86x86/BomberMan.png \
    rpm/BomberMan.spec \
    qml/pages/image/mainMenu960x540.jpg \
    qml/pages/MenuPage.qml \
    qml/pages/FieldPage.qml \
    qml/pages/Scene.js \
    qml/pages/Field.qml \
    qml/pages/Mario.qml \
    qml/pages/Stone.qml \
    qml/pages/Actor.qml
