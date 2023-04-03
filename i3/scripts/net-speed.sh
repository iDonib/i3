#!/bin/bash

# Get current network usage
rx=$(ifstat -i wlp1s0 -q 1 1 | tail -n 1 | awk '{print $1}')
tx=$(ifstat -i wlp1s0 -q 1 1 | tail -n 1 | awk '{print $2}')

# Convert to human-readable format
rx_human=$(echo "$rx/1024/1024" | bc -l | xargs printf "%.2f")
tx_human=$(echo "$tx/1024/1024" | bc -l | xargs printf "%.2f")

# Update the i3wm status bar with the network speed
echo "↓ $rx_human MB/s ↑ $tx_human MB/s"

