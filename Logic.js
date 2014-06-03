function manage_speed(event, timer_id) {
    var max = 2000
    var min = 20
    if(event.key === Qt.Key_Up && root.menuSpeed > min)
        root.menuSpeed -= 100;
    else if(event.key === Qt.Key_Down && root.menuSpeed < max)
        root.menuSpeed += 100;
    timer_id.interval = root.menuSpeed;
}
