#ifndef FIELD_H
#define FIELD_H

#include <QDeclarativeItem>
#include <QMainWindow>
#include <QObject>
#include <QQuickItem>
#include <QSharedDataPointer>
#include <QWidget>

class fieldData;

class field : public QObject
{
    Q_OBJECT
public:
    field();
    field(const field &);
    field &operator=(const field &);
    ~field();

private:
    QSharedDataPointer<fieldData> data;
};

#endif // FIELD_H
