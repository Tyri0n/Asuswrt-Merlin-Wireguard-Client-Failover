#!/bin/sh

# rename file and edit to your own requirements...

sleep 150

# argument is the client number
/jffs/scripts/wgc-failover 1 &

sleep 60
/jffs/scripts/wgc-failover 2 &

sleep 60
# for additional arguments: see wgc-failover --help
/jffs/scripts/wgc-failover 3 -k 0 -c 0 &
