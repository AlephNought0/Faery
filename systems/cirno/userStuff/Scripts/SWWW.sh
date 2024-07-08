#!/usr/bin/env bash

export SWWW_TRANSITION_FPS=165
export SWWW_TRANSITION_STEP=90
export SWWW_TRANSITION=wipe
export SWWW_TRANSITION_ANGLE=30

sleep $((60 - $(date +%S)))

while true; do

    case $(date +%H) in (05 | 06 | 07 | 08 | 09 | 10 | 11 | 12 | 13 | 14 | 15 | 16) #If it's day

        if ! (($(date +%M) % 4)); then #Switch every 4 minutes
            img=$(ls /home/Aperius/Faery/systems/cirno/userStuff/Wallpapers/Day/* | shuf -n 1)
            swww img $img
        fi
    esac

    case $(date +%H) in (17 | 18 | 19) #If it's afternoon

        if ! (($(date +%M) % 4)); then
            img=$(ls /home/Aperius/Faery/systems/cirno/userStuff/Wallpapers/Afternoon/* | shuf -n 1)
            swww img $img
        fi
    esac

    case $(date +%H) in (20 | 21 | 22 | 23 | 00 | 01 | 02 | 03 | 04) #If it's dark
        if ! (($(date +%M) % 4)); then
            img=$(ls /home/Aperius/Faery/systems/cirno/userStuff/Wallpapers/Night/* | shuf -n 1)
            swww img $img
        fi
    esac

    sleep 60
done
