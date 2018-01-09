import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.2

Frame {
    signal btnLoginClicked()

    Pane {
        id: loginPageContent

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        width: 400
        height: 200

        Material.elevation: 6

        TextField {
            id: txtLogin
            text: qsTr("")
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 10
            antialiasing: false
            rotation: 0
            horizontalAlignment: Text.AlignHCenter
        }

        TextField {
            id: txtPassword
            text: qsTr("")
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: txtLogin.bottom
            anchors.topMargin: 10
            horizontalAlignment: Text.AlignHCenter

            echoMode: TextInput.Password
        }

        RowLayout {
            spacing: 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter

            Button {
                id: btnLogin
                text: "Sing In"

                onClicked: {
//                    if(coffeeVisual.singIn(txtLogin.text, txtPassword.text))
//                    {
                        btnLoginClicked()
//                    }
                }

//                Material.foreground: Material.Pink
            }

            Button {
                id: btnCancel
                text: "Cancel"

                onClicked: {
                    close()
                }
            }
        }
    }
}
