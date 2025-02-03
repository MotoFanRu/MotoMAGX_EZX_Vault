#!/bin/sh
mypath="${0%/*}"
LIBDIR1="/ezxlocal/download/mystuff/games/lib"
LIBDIR2="/mmc/mmca1/games/lib"
LIBDIR3="$mypath/lib"

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$LIBDIR1:$LIBDIR2:$LIBDIR3"
export HOME="$mypath"
export SDL_QT_INVERT_ROTATION=1

cd "$mypath" || exit 1
sleep 1

# Show FPS in game.
export BUILD_FPS=1

# Check PearlMod libraries and replace them with new ones.
MLIBDIR="/usr/mlib/SDL"
if [ -d "$MLIBDIR" ]; then
	if [ -d "$LIBDIR2" ]; then
		busybox mount -o bind "$LIBDIR2" "$MLIBDIR"
	else
		busybox mount -o bind "$LIBDIR1" "$MLIBDIR"
	fi
fi

# Execute the game
exec "$mypath/duke3d"

# Unmount the library directory if exec fails
if [ -d "$MLIBDIR" ]; then
	echo 'Unmounting "$MLIBDIR"...'
	busybox umount "$MLIBDIR"
fi
