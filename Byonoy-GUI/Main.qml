import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts


ApplicationWindow {
    width: 740
    height: 580
    visible: true
    title: qsTr("FireFlyUI")
    Material.theme: themeSwitch.checked ? Material.Light : Material.Dark

    RowLayout{
        spacing: -7
        anchors.right: parent.right
        anchors.margins: 10

        Label{
            id: dark
            text: "dark"
        }
        Switch {
            id: themeSwitch
        }
        Label{
            id: light
            text: "light"
        }
    }

    // Up to date design
    Design1_1{
        id: design1_1
        anchors.centerIn: parent
    }
}

