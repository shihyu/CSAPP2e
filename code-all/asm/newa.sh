#!/bin/sh
# Create initial versions of .32{s,d}a files from .32{s,d} files

for nam in $*; do
  if [ -f $nam"a" ];
  then echo "a file for $nam exists";
  else cp $nam $nam"a";
fi
done

