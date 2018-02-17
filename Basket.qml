import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
//import "qrc:/basket.js" as BasketLogic

Rectangle {
    id: basketMainRect
    ScrollView
    {
//        contentWidth: 150
//        contentHeight: 150
        clip: true
        anchors.fill: parent

        Column {
            width: basketMainRect.width
            clip: false
            spacing: 6

            Repeater {
                model: 50

                Order {
                    anchors.right: parent.right
                    anchors.left: parent.left
                }
            }
        }
    }
}
