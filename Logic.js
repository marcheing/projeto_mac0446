function manage_speed(event, timer_id) {
    var max = 3000
    var min = 200
    if(event.key === Qt.Key_Up && root.menuSpeed > min)
    {
        root.menuSpeed -= 100;
        speedIndicator.state = "showing"
    }
    else if(event.key === Qt.Key_Down && root.menuSpeed < max)
    {
        root.menuSpeed += 100;
        speedIndicator.state = "showing"
    }
    timer_id.interval = root.menuSpeed;
}


function reset_timer(timer_id, button_to_lose_focus)
{
    timer_id.interval = 1;
    button_to_lose_focus.focus = false;
    timer_id.restart();
}
