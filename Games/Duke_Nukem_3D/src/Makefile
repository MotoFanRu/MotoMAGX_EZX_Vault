#-----------------------------------------------------------------------------#
# Duke3D makefile.
#-----------------------------------------------------------------------------#

linux_ppc := false
beos := false
macosx := false
freebsd := false
solaris := false
shareware := false
controls_menu := true
use_asm := false
STRIP?=strip
MODERN_GCC?=false

#-----------------------------------------------------------------------------#
# If this makefile fails to detect Cygwin correctly, or you want to force
#  the build process's behaviour, set it to "true" or "false" (w/o quotes).
#-----------------------------------------------------------------------------#
#cygwin := true
#cygwin := false
cygwin := autodetect

# you only need to set these for Cygwin at the moment.
SDL_INC_DIR = /cygdrive/c/SDL/include
SDL_LIB_DIR = /cygdrive/c/SDL/lib

# need this for now.
ifeq ($(strip $(beos)),true)
  use_asm := false
endif

# Don't touch anything below this line unless you know what you're doing.
ifeq ($(strip $(cygwin)),autodetect)
  ifneq ($(strip $(shell gcc -v 2>&1 |grep "cygwin")),)
    cygwin := true
  else
    cygwin := false
  endif
endif

ifeq ($(strip $(cygwin)),true)
  ifeq ($(strip $(SDL_INC_DIR)),please_set_me_cygwin_users)
    $(error Cygwin users need to set the SDL_INC_DIR envr var.)
  else
    SDL_CFLAGS := -I$(SDL_INC_DIR)
  endif

  ifeq ($(strip $(SDL_LIB_DIR)),please_set_me_cygwin_users)
    $(error Cygwin users need to set the SDL_LIB_DIR envr var.)
  else
    SDL_LDFLAGS := -L$(SDL_LIB_DIR) -lSDL
  endif

else
  ifneq ($(strip $(freebsd)),true)
    SDL_CFLAGS := $(shell sdl-config --cflags)
    SDL_LDFLAGS := $(shell sdl-config --libs) -L.
  endif
endif

ifeq ($(strip $(macosx)),true)
  EXTRACFLAGS += -DPLATFORM_MACOSX=1
  EXTRALDFLAGS += -lSDLmain
endif

ifeq ($(strip $(freebsd)),true)
  EXTRACFLAGS += -DPLATFORM_FREEBSD=1
  SDL_CFLAGS := $(shell sdl11-config --cflags)
  SDL_LDFLAGS := $(shell sdl11-config --libs) -L.
endif

ifeq ($(strip $(linux_ppc)),true)
  EXTRACFLAGS += -DPLATFORM_LINUXPPC=1
endif

ifneq ($(strip $(cygwin)),true)
  ifneq ($(strip $(macosx)),true)
    ifneq ($(strip $(beos)),true)
      EXTRACFLAGS += -DUSE_EXECINFO=1
    endif
  endif
endif

ifeq ($(strip $(solaris)),true)
  EXTRALDFLAGS += -lsocket -lnsl
endif

ifeq ($(strip $(shareware)),true)
  EXTRACFLAGS += -DVOLUMEONE
else
  EXTRACFLAGS += -DVOLUMEALL
endif

ifeq ($(strip $(controls_menu)),true)
  EXTRACFLAGS += -DCONTROLS_CONFIG_MENU=1
endif

# check out buildengine in this directory:
#  cvs -z3 -d:pserver:anonymous@cvs.icculus.org:/cvs/cvsroot login
#   (password is "anonymous", without the quotes.)
#  cvs -z3 -d:pserver:anonymous@cvs.icculus.org:/cvs/cvsroot co buildengine
#  cd buildengine
#  make
#  cd ..
#  This sucks. We'll figure out something better.
BUILDOBJS := \
	buildengine/cache1d.o \
	buildengine/engine.o \
	buildengine/sdl_driver.o \
	buildengine/mmulti.o \
	buildengine/pragmas.o \
	buildengine/unix_compat.o

ifeq ($(strip $(use_asm)),true)
	BUILDOBJS += buildengine/a_gnu.o buildengine/a_nasm.o
else
	BUILDOBJS += buildengine/a.o
endif

# EXL, 03-Feb-2025: Use environment for this.
#CC =  gcc
#LD =  g++
#CC = /usr/local/open2x/bin/arm-linux-gnu-gcc

CFLAGS = -c -g $(SDL_CFLAGS) -DUSE_SDL=1 -DPLATFORM_UNIX=1 -DUDP_NETWORKING=1
CFLAGS += -Wall -Wno-unused
CFLAGS += $(EXTRACFLAGS)
ifeq ($(strip $(MODERN_GCC)),true)
CFLAGS += -Wno-unused-result -Wno-pointer-sign -Wno-stringop-overflow
endif
CFLAGS += $(FLAGS)

# EXL, 03-Feb-2025: We can't use `-O3` on EZX and probably MotoMAGX plaform since `-finline-functions` option is buggy.
ifeq ($(strip $(macosx)),true)
OPTIMIZE = -O3 -mdynamic-no-pic -falign-loops=16
else
OPTIMIZE = -O2 -pipe -ffast-math -frename-registers
endif

# Always turn OFF strict aliasing, even when optimizing. Otherwise, this is
#  just an accident waiting to happen...  --ryan.
CFLAGS += -fno-strict-aliasing -funsigned-char

# Uncomment this to compile with the Intel compiler (v6.0)
#CC = icc
#CFLAGS = -g $(SDL_CFLAGS) -DUSE_SDL=1 -DPLATFORM_UNIX=1 -DUSE_I386_ASM=1 $(EXTRACFLAGS) -O2

LDLIBS = $(SDL_LDFLAGS) -lSDL -lSDL_mixer $(EXTRALDFLAGS)

ifeq ($(strip $(freebsd)),true)
LDLIBS = $(SDL_LDFLAGS) -lSDL_mixer $(EXTRALDFLAGS)
endif

# !!! FIXME: Do we even need this? It doesn't fly on MacOS X.  --ryan.
#LDLIBS += -Wl,-E

all: duke3d

%.o : %.c
	$(CC) $(CFLAGS) $(OPTIMIZE) -o $@ $<

# Animation playback crashes due to optimization error on MacOS X. --ryan.
ifeq ($(strip $(macosx)),true)
animlib.o : animlib.c
	$(CC) $(CFLAGS) -o $@ $<
endif

# Animation playback crashes due to optimization error on Linux PPC. --Felipe Barriga.
ifeq ($(strip $(linux_ppc)),true)
animlib.o : animlib.c
	$(CC) $(CFLAGS) -o $@ $<
endif

# EXL, 03-Feb-2025: Disable audiolib building and linking.
#audiolib/audiolib.a:
#	$(MAKE) -C audiolib CC="$(CC)" CFLAGS="$(CFLAGS)" LDLIBS="$(LDLIBS)"

duke3d: \
	actors.o \
	animlib.o \
	control.o \
	config.o \
	game.o \
	gamedef.o \
	global.o \
	keyboard.o \
	menues.o \
	player.o \
	premap.o \
	rts.o \
	scriplib.o \
	sector.o \
	sounds.o \
	fx_man.o \
	$(BUILDOBJS)
	$(CC) $^ $(LDLIBS) -o $@
	$(STRIP) -s duke3d

build: astub.o
	$(CC) $^ $(BUILDOBJS) buildengine/build.o $(LDLIBS) -o $@

clean:
#	$(MAKE) -C audiolib clean
#	rm -rf duke3d.gpe
	rm -rf duke3d build *.o
	rm -rf buildengine/*.o

distclean: clean
#	$(MAKE) -C audiolib distclean
	rm -rf *~

#install: duke3d.gpe
#	mount /mnt/flash
#	cp duke3d.gpe /mnt/flash/duke3d/duke3d.gpe
#	umount /mnt/flash
