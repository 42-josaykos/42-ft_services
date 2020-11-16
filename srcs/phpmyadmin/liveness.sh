#!/bin/sh

if [ $(supervisorctl status | grep "STOPPED" | wc -l) -eq 0 ] ; then
  echo "Everything is OK !"
else
	echo "Something stopped !" && exit 1
fi
