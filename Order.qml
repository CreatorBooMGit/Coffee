import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import com.coffee.main 1.0
import QtQuick.Controls.Material 2.2
import "qrc:/order.js" as OrderLogic
import "qrc:/parameters.js" as Parameters
import "qrc:/basket.js" as BasketLogic

Rectangle {
    id: order
    height: OrderLogic.calcHeight()

    property bool active: false
    property double sum: 0

    anchors.left: parent.left
    anchors.right: parent.right

    Component.onCompleted: {
        OrderLogic.setOrder(order)
        OrderLogic.setOrderPositionsList(orderPositionsList)
        OrderLogic.setOrderContent(orderContent)
    }

    function addOrderPosition(value) {
        OrderLogic.addOrderPosition(value)
    }

    onActiveChanged: {
        OrderLogic.changeOrderPositionActive(active)
    }

    MouseArea {
        clip: false
        anchors.fill: parent

        onClicked: {
            console.log(order.height)
            BasketLogic.setActiveOrder(order)
        }
    }

    Rectangle {
        id: rectOrderTop

        height: 30
        color: active ? Parameters.OrderActiveColor : Parameters.OrderColor
        z: 1

        anchors {
            left: parent.left
            top: parent.top
            right: parent.right
        }

//        Text {
//            id: orderNumber
//            y: 6

//            anchors {
//                verticalCenter: parent.verticalCenter
//                left: parent.left
//                leftMargin: 5
//            }

//            fontSizeMode: Text.FixedSize
//            font.pixelSize: 16
//            text: OrderNumberText
//        }

        ColumnLayout {
            id: columnLayout

            anchors.top: parent.top
            anchors.topMargin: 1
            anchors.right: parent.right
            anchors.rightMargin: 3
            spacing: 0

            Text {
                id: orderDate
                text: orderContent.getDate()
                Layout.fillWidth: false
                Layout.alignment: Qt.AlignRight | Qt.AlignBottom
                visible: true
            }

            Text {
                id: orderTime

                text: orderContent.getTime()
                Layout.rowSpan: 1
                Layout.alignment: Qt.AlignRight | Qt.AlignTop

                font.pixelSize: 12
            }
        }
    }

    Rectangle {
        id: rectOrderBottom

        height: 30
        color: active ? Parameters.OrderActiveColor : Parameters.OrderColor
        z: 1

        anchors {
            top: orderPositionsList.bottom
            left: parent.left
            right: parent.right
        }

        Text {
            id: rectOrderBottomSumLabel

            width: 60

            anchors {
                bottom: rectOrderBottomSum.bottom

                right: rectOrderBottomSum.left
                rightMargin: 5
            }

            font.pixelSize: 16
            text: qsTr("Sum:")
        }

        Text {
            id: rectOrderBottomSum

            anchors {
                bottom: parent.bottom
                bottomMargin: 3

                right: parent.right
                rightMargin: 10
            }

            font.pixelSize: 16
            text: sum
        }

        Text {
            id: rectOrderBottomSumDiscount

            anchors {
                bottom: rectOrderBottomSum.top
                right: rectOrderBottomSum.right

                bottomMargin: -3
                rightMargin: -5
            }

            visible: orderContent.getDiscount()

            color: "#717171"
            font.pixelSize: 8
            text: (orderContent.getDiscount() - orderContent.getSumPDV() * orderContent.getDiscount()) + "%"
        }
    }

    ColumnLayout {
        id: orderPositionsList
        spacing: 0
        clip: true

        anchors {
            top: rectOrderTop.bottom
            left: parent.left
            right: parent.right
        }
    }

    OrderContent {
        id: orderContent
    }
}

