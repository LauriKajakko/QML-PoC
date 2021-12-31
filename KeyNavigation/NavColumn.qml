import QtQuick 2.15
import "repeaterHelper.js" as ListHelper

Column {
    id: root
    signal pressed(var event)
    property alias currentIndex: repeater.currentIndex
    required property ListModel listModel
    
    onActiveFocusChanged: {
        repeater.itemAt(repeater.currentIndex).focus = true
    }

    Component.onCompleted: {
        repeater.itemAt(0).focus = true
    }

    Keys.onPressed: {
        if (event.key == Qt.Key_Up) {
            if (!ListHelper.up(repeater)) root.pressed(event.key)
            event.accepted = true;
        } else if (event.key == Qt.Key_Down) {
            if (!ListHelper.down(repeater)) root.pressed(event.key)
            event.accepted = true;
        } else if (event.key == Qt.Key_Left) {
            root.pressed(event)
            event.accepted = true;
        } else if (event.key == Qt.Key_Right) {
            root.pressed(event)
            event.accepted = true;
        } else if (event.key == Qt.Key_Return) {
            repeater.itemAt(repeater.currentIndex).select()
            event.accepted = true;
        }
    }

    Repeater {
        id: repeater
        model: root.listModel
        property int currentIndex: 0
        delegate: Rectangle {
            id: delegate
            required property string name
            width: 100
            height: 20
            color: activeFocus ? "red" : "white"
            border {
                color: "black"
                width: 1
            }
            Text {
                anchors.centerIn: parent
                text: name
            }
            function select() {
                console.log("clicked", delegate.name)
            }
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                onClicked: {
                    delegate.select()
                }
            }
        }
    }
}
