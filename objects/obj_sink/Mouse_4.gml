

if (global.phone_blocking_input || global.wallet_blocking_input) {
    exit;
}



is_on = !is_on;
if (is_on)
{
    audio_play_sound(snd_sink_on, 10, false);
    running_audio_id = audio_play_sound(snd_sink_running, 9, true);
} else {
    audio_play_sound(snd_sink_off, 10, false);
    if (audio_is_playing(running_audio_id)) {
        audio_stop_sound(running_audio_id);
    }
    image_index = 0;
}
