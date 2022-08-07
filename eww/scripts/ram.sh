#!/bin/sh

# FREE=$(grep "MemFree:" /proc/meminfo | awk '{print $1}')
# TOTAL=$(grep "MemTotal:" /proc/meminfo | awk '{print $1}')

# awk '{print $0/$1}' $FREE $TOTAL

FREE=$(top -l 1 -n 0 | grep "PhysMem:" | awk '{printf "%d", $2}')
