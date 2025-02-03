#!/bin/sh
mypath="${0%/*}"
LIBDIR1="/ezxlocal/download/mystuff/games/lib"
LIBDIR2="/mmc/mmca1/games/lib"
LIBDIR3="$mypath/lib"

export HOME="$mypath"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$LIBDIR1:$LIBDIR2:$LIBDIR3"
export SDL_QT_INVERT_ROTATION=1
# Show FPS in game.
export BUILD_FPS=1

# Check PearlMod libraries and replace them with new ones.
MLIBDIR="/usr/mlib/SDL"
if [ -d "$MLIBDIR" ]; then
	if [ -d "$LIBDIR2" ]; then
		echo "Mounting "$LIBDIR2" to "$MLIBDIR"..."
		busybox mount -o bind "$LIBDIR2" "$MLIBDIR"
	else
		echo "Mounting "$LIBDIR1" to "$MLIBDIR"..."
		busybox mount -o bind "$LIBDIR1" "$MLIBDIR"
	fi
fi

cd "$mypath" || exit 1
sleep 1

# Execute!
"$mypath/duke3d"

if [ -d "$MLIBDIR" ]; then
	echo "Unmounting "$MLIBDIR"..."
	busybox umount "$MLIBDIR"
fi
