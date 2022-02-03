import QtQuick 2.15

Rectangle {
    id: root
    signal send
    MouseArea {
        anchors.fill: parent
        onClicked: {
            send()
            console.log("pressed")
        }
    }
}