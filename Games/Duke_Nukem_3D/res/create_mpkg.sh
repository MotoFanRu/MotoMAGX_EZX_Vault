#!/bin/bash

grp="duke3d.grp"
duke="../src/duke3d"
out="DukeNukem3D_EZX"

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
cp -avR ezx/* "$out"
cp "readme.txt" "$out"

echo -e "\nCreate package..."
tar --numeric-owner --owner=2000 --group=233 -cvf "$out".uncompressed "$out"
gzip -9f "$out".uncompressed
mv "$out".uncompressed.gz "$out".mpkg

echo -e "\nClean out $out directory..."
rm -Rf "$out"

ls -al "$out".mpkg
echo -e "\nDone."
