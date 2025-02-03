#!/bin/bash

grp="duke3d.grp"
duke="../src/duke3d"
out="DukeNukem3D_MAGX"

if [ ! -f "$grp" ]; then
	echo "Error: $grp does not exist! Please place $grp near to this script."
	exit 1
fi

if [ ! -f "$duke" ]; then
	echo "Error: $duke does not exist! Please build project first."
	exit 1
fi

mkdir -p "$out"
echo -e "\nCopying files to $out directory..."
cp "$grp" "$out"
cp "$duke" "$out"
cp -avR "cons_atomic" "$out"
cp -avR "cons_general" "$out"
cp -avR magx/* "$out"
cp "readme.txt" "$out"

echo -e "\nCreate package..."
7za a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on "$out".7z "$out"
mv "$out".7z "$out".mgx

echo -e "\nClean out $out directory..."
rm -Rf "$out"

ls -al "$out".mgx
echo -e "\nDone."
