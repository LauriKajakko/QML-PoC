.pragma library

function up(repeater) {
    if (repeater.currentIndex > 0) {
        repeater.currentIndex--;
        repeater.itemAt(repeater.currentIndex).focus = true;
        return true;
    }
    return false;
}
function down(repeater) {
    if (repeater.currentIndex < repeater.count - 1) {
        repeater.currentIndex++;
        repeater.itemAt(repeater.currentIndex).focus = true;
        return true;
    }
    return false;
}