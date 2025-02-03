Duke Nukem 3D
=============

Duke Nukem 3D is a classic first-person shooter originally developed by 3D Realms. For a full description, please refer to the [Wiki article](https://en.wikipedia.org/wiki/Duke_Nukem_3D) about Duke Nukem 3D. This project aims to bring the GP2X port of Duke Nukem 3D by Woogal, known as Duke2X 03/07/07 Version 0.04, to EZX and MotoMAGX phones by Motorola.

## Screenshots

![Duke Nukem 3D Screenshot 01 from Motorola VE66, MotoMAGX phone](pic/Duke_Nukem_3D_MotoMAGX_VE66_01.png) ![Duke Nukem 3D Screenshot 02 from Motorola VE66, MotoMAGX phone](pic/Duke_Nukem_3D_MotoMAGX_VE66_02.png) ![Duke Nukem 3D Screenshot 03 from Motorola VE66, MotoMAGX phone](pic/Duke_Nukem_3D_MotoMAGX_VE66_03.png) ![Duke Nukem 3D Screenshot 04 from Motorola VE66, MotoMAGX phone](pic/Duke_Nukem_3D_MotoMAGX_VE66_04.png)

![Duke Nukem 3D Screenshot 05 from Motorola VE66, MotoMAGX phone](pic/Duke_Nukem_3D_MotoMAGX_VE66_05.png) ![Duke Nukem 3D Screenshot 06 from Motorola VE66, MotoMAGX phone](pic/Duke_Nukem_3D_MotoMAGX_VE66_06.png) ![Duke Nukem 3D Screenshot 07 from Motorola VE66, MotoMAGX phone](pic/Duke_Nukem_3D_MotoMAGX_VE66_07.png) ![Duke Nukem 3D Screenshot 08 from Motorola VE66, MotoMAGX phone](pic/Duke_Nukem_3D_MotoMAGX_VE66_08.png)

## Build for PC (Testing Purposes)

```bash
cd src

# 32-bit SDL_mixer library is needed.
cp /usr/lib/i386-linux-gnu/libSDL_mixer-1.2.so.0.12.0 libSDL_mixer.so

CC='gcc -m32' MODERN_GCC=true make

# Run string example.
BUILD_FPS=1 BUILD_NOMOUSEGRAB=1 BUILD_WINDOWED=1 ./duke3d
```

## Build for EZX

```bash
cd src

. /opt/toolchains/motoezx/setenv-a1200.sh

FLAGS='-DEZX -mcpu=iwmmxt -mtune=iwmmxt' make
```

```bash
cd res

./create_mgx.sh
```

## Build for MotoMAGX

```
cd src

. /opt/toolchains/motomagx/setenv-z6.sh

FLAGS='-DMAGX -march=armv6j -mtune=arm1136jf-s -mfpu=vfp' make
```

```bash
cd res

./create_mpkg.sh
```

## Credits

- Original Duke Nukem 3D by 3D Realms.
- icculus port to UNIX-like system.
- GP2X port (Duke2X) by Woogal at [Sector808](http://www.sector808.org/gp2x/duke-nukem-3d-duke2x/).
- EZX and MotoMAGX port by EXL.
