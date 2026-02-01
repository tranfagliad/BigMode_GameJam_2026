
switch (state)
{
    case Transition.Fading_In:
        fade_alpha -= fade_speed;
        if (fade_alpha <= 0) {
            fade_alpha = 0;
            state = Transition.Idle;
        }
        break;

    case Transition.Idle:
        timer++;
        if (timer >= wait_time) {
            state = Transition.Fading_Out;
        }
        break;

    case Transition.Fading_Out:
        fade_alpha += fade_speed;
        if (fade_alpha >= 1) {
            fade_alpha = 1;
            if (room_exists(target_room)) {
                room_goto(target_room);
            }
        }
        break;
}
