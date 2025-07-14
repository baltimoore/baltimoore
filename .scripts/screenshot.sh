#!/bin/bash

SCREENSHOT_DIR="${HOME}/Pictures/Screenshots"
# Just to make sure the screenshot folder always exists
mkdir -p $SCREENSHOT_DIR

# Generate the filename for the screenshot
filename=$(date +%d-%m-%Y_%H:%M:%S).png

# Take the screenshot using ImageMagick
# By default, snap the entire screen
default="-window root"
import ${1:-$default} $SCREENSHOT_DIR/$filename

# Show off the screenshot
feh $SCREENSHOT_DIR/$filename
