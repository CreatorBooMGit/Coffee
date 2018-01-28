import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import com.coffee.main 1.0
import QtQuick.Controls.Material 2.2
import "qrc:/goodItem.js" as GoodItemLogic

Frame {
    leftPadding: 0
    rightPadding: 0
    bottomPadding: 0
    topPadding: 0

    MenuItemDelegate {
        id: menuItemDelegate
    }

    Rectangle {
        id: mainToolbar

        anchors.top: parent.top;
        anchors.left: parent.left;
        anchors.right: parent.right;
        height: 75

        Image {
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 25
            }

            width: 32
            height: 32

            source: "icons/Addons/Icons/list.png"

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    drawer.open()
                }
            }
        }
    }

    Drawer {
        id: drawer
        width: 0.25 * window.width
        height: window.height

        onVisibleChanged: {
            rotationbuttonBackDrawerToolbar.start()
        }

        Rectangle {
            id: drawerToolbar

            anchors {
                top: parent.top
                right: parent.right
                left: parent.left
            }

            Material.background: Material.Dark

            height: mainToolbar.height

            Image {
                id: imageBackDrawerToolbar
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                    rightMargin: 25
                }

                width: 32
                height: 32

                source: "icons/Addons/Icons/next.png"

                MouseArea {
                    anchors.fill: parent

                    onClicked: drawer.close()
                }

                PropertyAnimation {
                    id: rotationbuttonBackDrawerToolbar

                    target: imageBackDrawerToolbar
                    properties: "rotation"
                    from: 0
                    to: -180
                    duration: 300
                }
            }
        }

        ListView {
            id: mainMenuList

            anchors {
                top: drawerToolbar.bottom
                right: parent.right
                left: parent.left
                bottom: parent.bottom
            }

            model: ListModel {
                ListElement {
                    contentFieldText: "menu1"
                }
                ListElement {
                    contentFieldText: "menu2"
                }
            }

            delegate: menuItemDelegate
            focus: true
            clip: true
        }
    }

    Rectangle {

        anchors {
            top: mainToolbar.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        GridView {
            id: goodsView

            anchors {
                top: parent.top
                left: parent.left
                bottom: parent.bottom
            }

            width: parent.width - 350

            property int countInRow: 4

            cellWidth: GoodItemLogic.getImageCardWidth(width)
            cellHeight: GoodItemLogic.getImageCardWidth(width)

            model: GoodsTableModel {
                id: goodsTableModel
            }


            delegate: GoodItem
            {
                width: goodsView.cellWidth
                height: goodsView.cellHeight
            }
        }

        Rectangle {
            id: separatorMainpage

            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: goodsView.right

            width: 2

            color: "white"
        }

        Rectangle {
            id: backetViewBox

            anchors {
                top: parent.top
                right: parent.right
                left: separatorMainpage.right
                bottom: parent.bottom

                rightMargin: 5
                bottomMargin: 5
            }

            radius: 5
            border.color: Material.color(Material.Grey)
            border.width: 1

            ListView {
                id: backetView

                anchors {
                    fill: parent
                }
            }
        }
    }
}
