#!/bin/sh
mypath="${0%/*}"
LIBDIR1="/ezxlocal/download/mystuff/games/lib"
LIBDIR2="/mmc/mmca1/games/lib"
LIBDIR3="$mypath/lib"

export HOME="$mypath"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$LIBDIR1:$LIBDIR2:$LIBDIR3"
# export SDL_QT_INVERT_ROTATION=1
# Show FPS in game.
export BUILD_FPS=1

cd "$mypath" || exit 1
sleep 1

exec "$mypath/duke3d"
