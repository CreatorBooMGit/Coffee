.pragma library

.import QtQuick 2.7 as QML

var activeOrder = null

var basketList = null
var orderPositionsArray = []

function setActiveOrder(value) {
    if(activeOrder !== null)
        activeOrder.active = false

    activeOrder = value
    activeOrder.active = true
}

function getActiveOrder() {
    return activeOrder
}

function clearActiveOrder() {
    setActiveOrder(null)
}

function addGoodToActiveOrder(id) {
    if(activeOrder === null)
    {
        var newOrderComponent = Qt.createComponent("qrc:/Order.qml")
        if (newOrderComponent.status === QML.Component.Ready) {
            var newOrder = newOrderComponent.createObject(basketList)
            newOrder.active = true

            activeOrder = newOrder
        }
    }

    activeOrder.addOrderPosition(id)
}

function setBasketList(value) {
    basketList = value
}

function restoreDefaultOrderPosition(position)
{
    for(var i = 0; i < orderPositionsArray.length; i++)
        orderPositionsArray[i].positionOrderFocusOff(position)
}
