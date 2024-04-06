#!/bin/env bash

clear; ROKU_DEV_TARGET="$(echo 'grabing the ip!' 1>&2; nmap -sn 192.168.1.1/24 | grep 'SullysTv' | awk '{print $6}' | sed 's/(//; s/)//')"

clear; echo 'Roku'

dombo=1

asdf() {
while [ $dombo -le 2 ]; do
  curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/home"
  ((dombo=dombo+1))
done

dombo=1

sleep 1

while [ $dombo -le $sombo ]; do
  curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/right"
  ((dombo=dombo+1))
done

dombo=1

while [ $dombo -le $rombo ]; do
  curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/down"
  ((dombo=dombo+1))
done

curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/select"
dombo=1
}

fdsa() {
while [ $dombo -le 5 ]; do
    curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/up"
    sleep 1
    curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/up"
    sleep 2
    curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/down"
    sleep 1
    curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/down"
    sleep 2
    curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/left"
    sleep 1
    curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/right"
    sleep 2
    curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/left"
    sleep 1
    curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/right"
    sleep 5
    ((dombo=dombo+1))
done

sleep 120

curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/home"

sleep 60

curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/powerOff"
dombo=1
}

while read -r crack; do
  dumb='Roku'
  case "$crack" in
    w) curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/up"
    ;;
    s) curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/down"
    ;;
    a) curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/left"
    ;;
    d) curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/right"
    ;;
    0) curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/volumeup"
    ;;
    9) curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/volumedown"
    ;;
    j) curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/select"
    ;;
    k) curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/enter"
    ;;
    b) curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/back"
    ;;
    h) curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/home"
    ;;
    m) curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/volumemute"
    ;;
    t) curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/search"
    ;;
    e) curl "http://$ROKU_DEV_TARGET:8060/query/media-player"; sleep 5
    ;;
    i) curl -s "http://$ROKU_DEV_TARGET:8060/query/device-info" > Roku-info.txt; clear; echo 'Saved info!' 1>&2; sleep 3
    ;;
    c) curl "http://$ROKU_DEV_TARGET:8060/query/chanperf"; sleep 5
    ;;
    l) read -p 'Keyboard: ' -r lit; echo "$lit" | sed 's/./\0\n/g' | xargs -I {} curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/Lit_{}"
    ;;
    pn) curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/powerOn"
    ;;
    pf) curl -d '' "http://$ROKU_DEV_TARGET:8060/keypress/powerOff"
    ;;
    ap) read -p 'Row 1: ' -r sombo; read -p 'Row 2: ' -r rombo; asdf
    ;;
   pr) fdsa
    ;;
    q) clear; exit 1
    ;;
    *) dumb="No dumb ass."
    ;;
  esac
  clear
  echo "$dumb"
done
exit 1
