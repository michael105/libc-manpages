#!/bin/sh
man -l man/`echo $1 | sed -E 's/(\S*).*/\1/'`
