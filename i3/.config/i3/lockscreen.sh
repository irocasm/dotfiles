#!/bin/bash



#scrot /tmp/screen.png
#convert /tmp/screen.png -filter Gaussian -resize 10% -define filter:sigma=1 -resize 1000% /tmp/screen.png
#convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
#cp ~/.config/wallpaper/winter-willow.png /tmp/screen.png


cp ~/.config/wallpaper/skyline_hm.png /tmp/screen.png
if [[ -f ~/.config/i3/lock.png ]] && false
then
    # placement x/y
    PX=0
    PY=0
    # lockscreen image info
    R=$(file -L ~/.config/i3/lock.png | grep -o '[0-9]* x [0-9]*')
    RX=$(echo $R | cut -d' ' -f 1)
    RY=$(echo $R | cut -d' ' -f 3)

    SR=$(xrandr --query | grep ' connected' | sed 's/primary //' | cut -f3 -d' ')
    for RES in $SR
    do
        # monitor position/offset
        SRX=$(echo $RES | cut -d'x' -f 1)                   # x pos
        SRY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 1)  # y pos
        SROX=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 2) # x offset
        SROY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 3) # y offset
        PX=$(($SROX + $SRX/2 - $RX/2))
        PY=$(($SROY + $SRY/2 - $RY/2))

        convert /tmp/screen.png ~/.config/i3/lock.png -geometry +$PX+$PY -composite -matte /tmp/screen.png
        echo "done"
    done
fi
i3lock -e -f -c 000000 -i /tmp/screen.png && sleep 1
#rm -f /tmp/screen.png
