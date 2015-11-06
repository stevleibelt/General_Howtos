# control

* use alsactl (-h for help)

# record something (test if microphone is working)

    #record for 5 seconds (duration) and save into file test-mic.wav
    arecord -d 5 test-mic.wav

# place something

    aplay my-file.wav

# list available devices

    aplay -L | grep :CARD
    #or
    arecord -l
    #or
    cat /proc/asound/cards
    #or
    lspci | grep -i audio
    #or
    /sbin/lsmod | grep snd

# links

* http://www.alsa-project.org/main/index.php/Main_Page
* http://linux.die.net/man/1/alsactl
* https://wiki.archlinux.org/index.php/Advanced_Linux_Sound_Architecture
* http://en.wikipedia.org/wiki/Advanced_Linux_Sound_Architecture
