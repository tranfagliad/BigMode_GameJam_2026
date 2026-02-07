// Text Message Related Functions



// General messages
function receive_message(_text, _sender = "Don Cheedle")
{
    with (obj_phone)
	{
        var _total_seconds = floor(get_timer() / 1000000); 
        var _minutes_passed = floor(_total_seconds / 60);
        var _display_hour = 12;
        var _display_min = _minutes_passed % 60;
        var _min_str = (_display_min < 10) ? "0" + string(_display_min) : string(_display_min);
        var _time_stamp = string(_display_hour) + ":" + _min_str;

        // Add the sender to our struct
        var _msg_data = {
            text: _text,
            time: _time_stamp,
            sender: _sender
        };
        
        array_insert(messages, 0, _msg_data);
        
        if (array_length(messages) > max_messages) {
            array_pop(messages);
        }
        
        has_new_messages = true;
        flash_timer = flash_duration;

        if (audio_exists(snd_phone_vibrate)) {
            audio_play_sound(snd_phone_vibrate, 10, false);
        }
    }
}



function receive_message_once(_id, _text, _sender = "Don Cheedle")
{
    if (!struct_exists(global.sent_messages, _id))
	{
        receive_message(_text, _sender);
        struct_set(global.sent_messages, _id, true);
    }
}
