#!/bin/sh
file=man/`echo $1 | sed -E 's/(\S*).*/\1/'`
echo $file
export MANPATH=$PWD/man/`echo $1 | sed -E 's/\/.*//'`
echo $MANPATH
STTY=`stty -g`
pinfo -r $file
if [ "$?" != "0" ]; then
		# pinfo exited ungratefully. Try torestore terminal settings.
		reset
		stty $STTY
fi
