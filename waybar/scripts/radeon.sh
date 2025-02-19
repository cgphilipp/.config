#!/usr/bin/env bash

radeontop -d - -l1 | grep -o -P "gpu \K\d*"
