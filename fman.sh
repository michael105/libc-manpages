#!/bin/sh
cat db/man-names.txt | ./bin/fzy -l max -x ./scripts/man.sh
