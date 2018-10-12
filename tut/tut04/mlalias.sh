#!/bin/sh

cat mlalias | sed "s/[[:blank:]]//g" | sed -n  '/^addresses:$/,/^owners:/p;/^owners:/q' | sed '1,1d' | sed '$d'

