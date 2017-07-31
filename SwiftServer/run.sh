#!/bin/bash
# Strart Script for Swift Server

#variables
n="SwiftServer"
counter=0

dialog --title $n --yesno "Do you want to rebuild the server?" 10 30
stat=$(echo $?)

if [ "$stat" == "0" ]
then

(
while :
do
cat <<EOF
XXX
$counter
$counter% upgraded

$stat
XXX
EOF
(( counter=${counter}+20))
sleep 10
done
) |
dialog --title $n --gauge "Building Project" 10 70 0
fi
