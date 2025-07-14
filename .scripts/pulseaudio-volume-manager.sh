#!/bin/bash

# Default volume step
DEFAULT_VOLUME_STEP=10

# Function to display usage message
function display_usage() {
    echo "Usage: $0 [+-](/d){1,2} | up | down"
    echo "Options:"
    echo "  [+-]?(/d){1,2}    Set volume with a specific value (e.g., +10, -5)"
    echo "  up               Increase volume by default step ($DEFAULT_VOLUME_STEP)"
    echo "  down             Decrease volume by default step ($DEFAULT_VOLUME_STEP)"
    echo "  (no arguments)   Get the current volume"
}

# Function to set volume with a specific value
function set_volume() {
    pactl set-sink-volume 0 "$1%"
}

# Check if no arguments provided, in that case, get the current volume
if [ $# -eq 0 ]; then
    pactl get-sink-volume 0
    exit 0
fi

# Parse the command-line arguments
case "$1" in
    [+-]?([0-9]|[1-9][0-9])) # Matches values like "+10", "-3", "50"
        set_volume "$1"
        ;;
    up)
        set_volume "+$DEFAULT_VOLUME_STEP"
        ;;
    down)
        set_volume "-$DEFAULT_VOLUME_STEP"
        ;;
    *) # If an invalid argument is provided, display usage message
        display_usage
        exit 1
        ;;
esac

exit 0

