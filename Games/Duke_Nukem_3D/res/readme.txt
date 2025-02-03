Duke3D for the gp2x
Version 0.04
Ported by Woogal from the icculus sdl port.
Source available at http://sector808.org
Please see http://sector808.org and http://wiki.gp2x.org/wiki/Duke2X for lastest information.

Installation
------------

Place duke3d.gpe anywhere. Additional files needed from either a shareware or retail
version of Duke3D are duke3d.cfg and duke3d.grp. These files should be in the same
folder as duke3d.gpe. If you are using the Atomic Edition then you will also need the
files defs.con, game.con and user.con from the CD. If you are using version 1.3 then
use the .con files included in this zip. Using any other version of the .con files with
1.3 will almost certainly cause strange problems, as will using the included .con files
with the Atomic Edition. .con files should also be in the same folder as duke3d.gpe

To get music you will need to install the timidity instruments by downloading
http://www.libsdl.org/projects/SDL_mixer/timidity/timidity.tar.gz and extracting it somewhere.
Then copy timidity.cfg to the duke folder and add this line at the start -

dir /mnt/sd/timidity/

The assumes the timidity folder is at the base of the sd card. If it is somewhere else
edit the dir line (eg, dir /mnt/sd/duke2x/timidity/).

Controls
--------

Press the stick or B to select menu items, A to go back.
Press Start+Select together to return to the menu when in the game. 
Game controls can be defined from the options screen.

Misc
----

To save options, make sure you exit from Duke3D. After exiting or saving a game, wait
a few seconds before switching off or removing the SD card to ensure details are saved
correctly.

Changes
-------

0.04
Cutscene movies now work (used to cause black screen crashes before).
Because movies work, this means episode 4 (The Birth) is now playable.
Function of A and B buttons switched to match other software.
Pressing 'back' (was B, now A) on the main menu no longer locks the game out.
Music and sound device settings hard coded as there is only one possible sound device.

0.03

Works on readonly firmwares 
Save bug fixed (hopefully)

0.02

Music added.
Problems solved with version 1.3 (jump and other gravity problems should be fixed).
Version 1.5 now works.
B can be assigned from options screen.

woogal@sector808.org
http://sector808.org
