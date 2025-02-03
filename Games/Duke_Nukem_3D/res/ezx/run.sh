#!/bin/sh
mypath=${0%/*}
LIBDIR1=/ezxlocal/download/mystuff/games/lib
LIBDIR2=/mmc/mmca1/games/lib
LIBDIR3=$mypath/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LIBDIR1:$LIBDIR2:$LIBDIR3
export HOME=$mypath
# export SDL_QT_INVERT_ROTATION=1
cd $mypath
sleep 1

# Show FPS in game.
export BUILD_FPS=1

exec $mypath/duke3d
