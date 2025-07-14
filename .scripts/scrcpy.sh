#!/bin/bash
echo ""
echo "scrcpy manager (of sorts)"

### Reading: defined flags in memory
while getopts ":d:m:" flag
do 
  case "${flag}" in
    d)
      device_id=${OPTARG};;
    m)
      device_mode=${OPTARG};;
    *)
      echo "Unknown flag provided; Aborting"
      exit;;
  esac
done

### Selecting: Device by ID
case "${device_id}" in
  mi) ;&
  redmi)
    echo "Selected Redmi Note 4; Checking mode... ";
    comm_id="--serial=19e6a4550604"
    case "${device_mode}" in
      vnc-one)
        echo "Mode: Landscape one-to-one"
	comm_spec="--lock-video-orientation=1 --crop=1080:1380:0:530"
        ;;
      vnc-fit)
        echo "Mode: Landscape fit screen"
	comm_spec="--lock-video-orientation=1 --crop=1025:1240:46:340"
	;;
      vnc-zoom)
	echo "Mode: Portrait zoom"
	comm_spec="--lock-video-orientation=0"
	;;
      cog)
	echo "Mode: ChoiceScript game"
	comm_spec="--lock-video-orientation=0 --crop=1080:1729:0:62"
	;;
      '')
	echo "Mode not defined; Executing default configuration"
	comm_spec="--lock-video-orientation"
	;;
      *)
	echo "Mode unrecognised; No additional configuration set";;
    esac
    ;;
  bw) ;&
  blackview)
    echo "Selected Blackview; Checking mode... ";
    comm_id="--serial=BVA30W1250036699"
    case "${device_mode}" in
      tach) ;&
      tachi) ;&
      yomi) ;&
      comic) ;&
      tachiyomi)
        echo "Mode: Tachiyomi reader"
	comm_spec="--lock-video-orientation=0 --crop=536:1088:0:44"
	;;
      '')
	echo "Mode not defined; Executing default configuration"
	comm_spec="--lock-video-orientation"
	;;
      *)
	echo "Mode unrecognised; No additional configuration set";;
    esac
    ;;
  '')
    echo "No device specified";;
  *)
    echo "Device unrecognised";;
esac

### Executing: compiled "full" scrcpy command
comm_base="scrcpy -Sw --window-borderless"
comm_full=$comm_base' '$comm_id' '$comm_spec
echo ""
echo "Executing: "$comm_full
echo ""
eval $comm_full
