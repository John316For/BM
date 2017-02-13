#include "field.h"

class fieldData : public QSharedData
{
public:

};

field::field() : data(new fieldData)
{

}

field::field(const field &rhs) : data(rhs.data)
{

}

field &field::operator=(const field &rhs)
{
    if (this != &rhs)
        data.operator=(rhs.data);
    return *this;
}

field::~field()
{

}
