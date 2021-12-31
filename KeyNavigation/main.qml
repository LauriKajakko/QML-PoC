import QtQuick 2.15

FocusScope {
    id: root
    width: 500
    height: 500
    focus: true
    Row {
        id: row
        focus: true
        spacing: 10
        property int count: row.children.length
        property int currentIndex: 0
        property Item currentItem: row.children[currentIndex]

        Component.onCompleted: {
            currentItem.focus = true
        }

        Keys.onPressed: onPressed
        function onPressed(event) {
            if (event.key == Qt.Key_Left) {
                col1.focus = true
                event.accepted = true;
            } else if (event.key == Qt.Key_Right) {
                col2.focus = true
                event.accepted = true;
            }
        }

        NavColumn {
            id: col1
            height: 100
            listModel: ListModel {
                ListElement { name: "1Item 1" }
                ListElement { name: "1Item 2" }
                ListElement { name: "1Item 3" }
                ListElement { name: "1Item 4" }
            }
            onPressed: row.onPressed(event)
        }
        NavColumn {
            id: col2
            height: 100
            listModel: ListModel {
                ListElement { name: "2Item 1" }
                ListElement { name: "2Item 2" }
                ListElement { name: "2Item 3" }
                ListElement { name: "2Item 4" }
            }
            onPressed: row.onPressed(event)
        }
    }
}