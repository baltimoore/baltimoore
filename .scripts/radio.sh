#!/bin/bash

# The required packages for this radio script to work
REQUIRED_PACKAGES=("pipewire" "ffmpeg" "yt-dlp")
MISSING_PACKAGES=()
# Set log file path
LOG_FILE="radio.log"

# This is a more distribution-agnostic way of checking if everything is installed
for pkg in "${REQUIRED_PACKAGES[@]}"; do
    if ! command -v "$pkg" &> /dev/null; then
        MISSING_PACKAGES+=("$pkg")
    fi
done

if [[ ${#MISSING_PACKAGES[@]} -gt 0 ]]; then
    echo "Missing required packages: ${MISSING_PACKAGES[*]}"
    echo "Please install them with your distribution's package manager"
    exit 1
fi

# Check if a video stream link is provided
if [[ -z $1 ]]; then
    echo "Please provide a video stream link."
    exit 1
fi

# Start Pipewire audio server if not already active
if ! pgrep -x "pipewire" > /dev/null; then
    pipewire &
fi

# Get the video title from the link
VIDEO_TITLE=$(yt-dlp -e "$1")

# Stream the audio and log system messages
ffmpeg -i "$(yt-dlp -g -f bestaudio "$1")" -f pulse "Radio: $VIDEO_TITLE" \
    2>&1 | tee "$LOG_FILE"
