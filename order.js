.import QtQuick 2.7 as QML

var heightOrderTop = 30;
var heightOrderBottom = 20;
var heightOrderPosition = 30;
var countOrderPosition = 0;

var order = null;
var orderPositionsList = null;

function calcHeight()
{
    return countOrderPosition * heightOrderPosition + heightOrderTop + heightOrderBottom;
}

function getCountOrderPosition()
{
    return countOrderPosition;
}

function setHeightOrderPosition(value)
{
    heightOrderPosition = value;
}

function setOrder(obj)
{
    order = obj;
}

function changeOrderHeight()
{
    order.height = calcHeight()
}

function setOrderPositionsList(list)
{
    orderPositionsList = list;
}

function addOrderPosition()
{
    var newOrderPosition = Qt.createComponent("qrc:/OrderPosition.qml")
    if (newOrderPosition.status === QML.Component.Ready) {
        var childRec = newOrderPosition.createObject(orderPositionsList)

        countOrderPosition++;
        changeOrderHeight();
    }
}
