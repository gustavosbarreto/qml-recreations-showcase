import QtQuick 2.0

Column {
    id: header
    anchors.horizontalCenter: parent.horizontalCenter
    spacing: 10

    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10

        Image {
            id: logo
            source: "logo.png"
        }

        Text {
            text: "Gustavo"
            font.bold: true
            font.pixelSize: 17
            color: "#fff"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            height: logo.height
        }
    }

    Text {
        font.family: "Material Icons"
        font.pixelSize: 20
        text: "\ue313"
        color: "#fff"
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
    }
}
