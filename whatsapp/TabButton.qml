import QtQuick 2.0
import QtQuick.Controls 2.12

TabButton {
    id: tab
    height: 40
    anchors.bottom: parent.bottom

    contentItem: Text {
        text: tab.text
        font.family: "Roboto"
        font.pixelSize: 15
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignHCenter
        color: tab.checked ? "#fff" : "#A5BAB7"
    }

    background: Rectangle {
        color: "#fff"
        width: parent.width
        height: 3
        visible: tab.checked
        anchors.bottom: parent.bottom
    }
}
