#!/bin/bash
#Should be configurable for users without a local piglatin service
# set a default hostname
HOST=localhost
# set a default port
PORT=8124
# if the .piglatinrc file exists, use this instead of the default
if [ -f ~/.piglatinrc ]; then
source ~/.piglatinrc
fi
# Since the container will only do one word at a time, parse the words out
for PIG in $@
do
if [ ${PIG:0:2} = "yt" -o ${PIG:0:2} = "xr" ]
then
	export DEMANGLE="${PIG:0:2}"
	PIG=`echo $PIG| sed -e "s/^yt/e/" -e "s/^xr/e/"`
fi
#this is the easiest way to get the correct line from the container
WORD=`printf "GET /$PIG HTTP/1.1\n\nclose\n\n"|nc $HOST $PORT|dos2unix|tail -n3|head -n1|sed "s/way$/ay/"`
RETURN=0
if [ "${WORD:0:1}" = "u" ]
then
	if [ "${WORD: -3}" = "qay" ]
	then
		echo $WORD | sed -e "s/qay/quay/" -e "s/^u//"
		RETURN=1
	fi
fi
if [ $RETURN = 0 ]
then
	if [ -n "$DEMANGLE" ]
	then
		WORD=`echo $WORD | sed -e "s/^./$DEMANGLE/"`
	fi
	echo $WORD
fi
# the container only has one worker so treat it slowly
sleep 1
# merge script output
done | tr "\n" " "|sed "s/ $//"
echo
