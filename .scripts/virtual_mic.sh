#!/bin/bash

#####
# PulseAudio
# https://superuser.com/a/1687100
#####
pulseaudio() {
    # Virtual speaker for w-okada's output 
    pactl load-module module-null-sink media.class=Audio/Sink \
        sink_name=Virtual-Speak channel_map=stereo

    # Virtual microphone for converting the speaker 
    pactl load-module module-null-sink media.class=Audio/Source/Virtual \
        sink_name=Virtual-Mic   channel_map=front-left,front-right

    # Combining the virtual speaker into the virtual mic
    pactl load-module module-loopback \
        source=Virtual-Speak.monitor_FL sink=Virtual-Mic
    pactl load-module module-loopback \
        source=Virtual-Speak.monitor_FR sink=Virtual-Mic
}

#####
# PipeWire
# https://www.reddit.com/r/linux_gaming/comments/rfnmq1/creating_a_virtual_microphone_on_pipewire/
#####
pipewire() {
# Virtual speaker for w-okada's output 
# Virtual microphone for converting the speaker 
    pw-loopback -m '[FL FR]' \
        --capture-props=' media.class=Audio/Sink   node.name=VirtSpeak node.description="Virtual Speaker"' \
        --playback-props='media.class=Audio/Source node.name=VirtMic   node.description="Virtual Mic"'
}

case "$1" in
  pa)
    pulseaudio
    ;;
  pw)
    pipewire
    ;;
  *)
    echo "Usage: $0 {pa|pw}"
    # ONLY FOR COMPATIBILITY REASONS
    pipewire
    ;;
esac
