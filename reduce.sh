#!/bin/bash

# Get the current resolution and refresh rate using xrandr
current_resolution=$(xrandr | grep -w connected | awk '{print $3}')
current_refresh_rate=$(xrandr | grep -w connected | awk '{print $4}' | tr -d ',')

# Calculate the new resolution by reducing the zoom factor (e.g., 0.8 for 80% zoom)
zoom_factor=0.8
new_resolution=$(awk -v factor=$zoom_factor 'BEGIN{ printf "%.0f", '$current_resolution' * factor}')

# Set the new resolution with xrandr
xrandr --output $(xrandr | grep -w connected | awk '{print $1}') --mode $new_resolution"x"$current_refresh_rate
