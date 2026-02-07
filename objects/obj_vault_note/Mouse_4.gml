
if (anim_state == "hidden")
{
    array_push(global.inventory, note_id);
    audio_play_sound(snd_note, 10, false);
    
    anim_state = "opening";
    is_reading = true;
    global.reading_note = true;
    
    x = -1000; 
}
