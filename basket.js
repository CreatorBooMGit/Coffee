.pragma library

var activeOrder = null

var basketModel = null

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

function addGoodToActiveOrder() {
    if(activeOrder === null)
    {
        basketModel.append({'active': 'true'})
    }

    activeOrder.addOrderPosition()
}

function setBasketModel(value) {
    basketModel = value
}
