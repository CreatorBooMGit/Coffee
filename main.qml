import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import com.coffee.main 1.0
import QtQuick.Controls.Material 2.2

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 640
    title: qsTr("Coffee House")

    Material.theme: Material.Dark
    Material.accent: Material.Purple

    MainPage {
        id: mainPage

        visible: false
        enabled: false

        anchors.fill: parent
    }

    LoginPage {
        id: loginPage

        visible: true
        enabled: true

        anchors.fill: parent

        onBtnLoginClicked: {
//            console.log("click Login")
            loginPage.visible = false
            loginPage.enabled = false

            mainPage.visible = true
            mainPage.enabled = true
        }
    }
}
