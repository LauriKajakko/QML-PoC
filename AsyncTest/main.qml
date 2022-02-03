import QtQuick 2.15

Rectangle {
    width: 200
    height: 200
    color: "red"
    anchors.fill: parent
    Sender {
        width: 100
        height: 100
        onSend: {
            for (let i = 0; i < 100000000; i++) {
                
            }
            console.log("done")
        }
    }
}