import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import com.coffee.main 1.0
import QtQuick.Controls.Material 2.2
import "qrc:/order.js" as OrderLogic
import "qrc:/parameters.js" as Parameters
import "qrc:/basket.js" as BasketLogic

Item {
    id: order
    height: OrderLogic.calcHeight()

    property bool active: false

    Component.onCompleted: {
        OrderLogic.setOrder(order)
        OrderLogic.setOrderPositionsList(orderPositionsList)
    }

    function addOrderPosition() {
        OrderLogic.addOrderPosition()
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

        Text {
            id: text2
            y: 6

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 5
            }

            fontSizeMode: Text.FixedSize
            font.pixelSize: 16
            text: qsTr("№000000")
        }

        ColumnLayout {
            id: columnLayout

            anchors.top: parent.top
            anchors.topMargin: 1
            anchors.right: parent.right
            anchors.rightMargin: 3
            spacing: 0

            Text {
                id: text3
                text: qsTr("01/01/2018")
                Layout.fillWidth: false
                Layout.alignment: Qt.AlignRight | Qt.AlignBottom
                visible: true
            }

            Text {
                id: text4
                x: 0
                y: 0

                text: qsTr("00:00")
                Layout.rowSpan: 1
                Layout.alignment: Qt.AlignRight | Qt.AlignTop

                font.pixelSize: 12
            }
        }
    }

    Rectangle {
        id: rectOrderBottom

        height: 20
        color: active ? Parameters.OrderActiveColor : Parameters.OrderColor
        z: 1

        anchors {
            top: orderPositionsList.bottom
            left: parent.left
            right: parent.right
        }

        Text {
            id: text1

            anchors {
                left: parent.left
                leftMargin: 5
                bottom: parent.bottom
                bottomMargin: 3
                top: parent.top
                topMargin: 3
            }

            font.pixelSize: 12
            text: qsTr("Text")
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

