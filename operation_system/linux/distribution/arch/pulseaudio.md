# Pulseaudio

## Install

```
pacman -S libcanberra-pulse pavucontrol pulseaudio pulseaudio-equalizer pulseaudio-alsa lib32-libpulse  lib32-alsa-plugins
```

## Equalizer

* pulseeffects

## Enable lookback

Usefull if you want to hear your own voice through your microphone and with a latency of 1 seconds.

```bash
#this loads the loopback module with a delay of 1 second
pactl load-module module-loopback latency_msec=1000

#next steps
#   open pavucontrol
#   set your microphone as default input source
#   unmute it
#   maybe mute other input sources
```

## Link

* https://wiki.archlinux.org/index.php/PulseAudio
* [Listen to your own microphone on Linux](https://bytee.net/misc/listen-to-your-own-microphone-on-linux) - 20221216

