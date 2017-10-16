# fetch information

```
#get overview of detected soundcards
cat /proc/asound/cards

lspci -nnk | grep -iA2 audio

lsmod | grep 'snd'

#is pulseaudio running?
ps -C pulseaudio
```
