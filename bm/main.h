#ifndef MAIN_H
#define MAIN_H

#include <QObject>

class MyObject : public QObject{
   Q_OBJECT
public:
    explicit MyObject (QObject* parent = 0) : QObject(parent) {}
    Q_INVOKABLE int numInCage(){
    return 1;
    }
};


#endif // MAIN_H
