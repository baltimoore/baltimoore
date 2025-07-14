#! /bin/sh

# Backlight interface
BrPath='/sys/class/backlight/intel_backlight'
BrNow="$BrPath/brightness"
BrMin=0
BrMax=$(cat ${BrPath}/max_brightness)

# Check if value is passed &  what's passed is a number
if [ -z "$1" ] || ! [ "$1" -eq "$1" ]; then
	echo "$0 <percentage>"
	exit 0
fi

# New brightness calculation
# Division is last, to conserve max precision
BrNew=$((BrMax * $1 / 100))
# Making sure brightness is within allowed values
BrNew=$(test "$BrMin" -gt "$BrNew" && echo $BrMin || echo $BrNew)
BrNew=$(test "$BrMax" -lt "$BrNew" && echo $BrMax || echo $BrNew)

# Applying new brightness
echo "$BrNew" > "$BrNow"
