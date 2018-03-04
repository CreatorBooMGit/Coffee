.import QtQuick 2.7 as QML
.import "basket.js" as Basket

var heightOrderTop = 30;
var heightOrderBottom = 30;
var heightOrderPosition = 30;
var countOrderPosition = 0;

var order = null;
var orderContent = null;
var orderPositionsList = null;
var orderPositionsArray = [];

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

function setOrderContent(obj)
{
    orderContent = obj;
}

function changeOrderHeight()
{
    order.height = calcHeight()
}

function setOrderPositionsList(list)
{
    orderPositionsList = list;
}

function addOrderPosition(id)
{
    var newOrderPosition = Qt.createComponent("qrc:/OrderPosition.qml")
    if (newOrderPosition.status === QML.Component.Ready) {
        var childRec = newOrderPosition.createObject(orderPositionsList)
        childRec.parentActive = order.active

        var positionInfo = orderContent.appendPosition(id)

        childRec.goodPositionId = positionInfo.index
        childRec.goodPositionNameValue = positionInfo.name
        childRec.goodPositionPriceValue = positionInfo.price_pdv

        order.sum = orderContent.getSumPDV()

        countOrderPosition++;

        changeOrderHeight();
        orderPositionsArray.push(childRec);
        Basket.orderPositionsArray.push(childRec);
    }
}

function deleteOrderPosition(id) {
    orderPositionsArray.splice(id, 1)
}

// Chande active in order
function changeOrderPositionActive(value) {
    for(var i = 0; i < orderPositionsArray.length; i++)
        orderPositionsArray[i].parentActive = value
}
