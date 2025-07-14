#!/bin/bash
source $(dirname "$0")/string_format.sh

# Some global 'constants'
IMG_TMP_PATH=/tmp/pollinations.png
IMG_SAV_PATH=$HOME/Pictures/pollinations.ai
IMG_SAV_EXT='.png'

# Get a list of prompts from the user
function prompt_image() {
  # Get the user's art requests in sections
  read -p "Enter a description of the scene you want to generate: " \
    -e -i "$img_scene"              img_scene
  read -p "Enter a description of the character you want to create: " \
    -e -i "$img_character"          img_character
  read -p "Enter a description of their pose/outfit/whatever: " \
    -e -i "$img_character_plus"     img_character_plus
  read -p "Enter a description of the style you want to be used: " \
    -e -i "$img_style"              img_style
  read -p "Enter a list of the artists you'd like to emulate: " \
    -e -i "${img_artist:-art by }"  img_artist

  # The large, combined text that's actually used in the API call
  img_description="$img_scene,$img_character,$img_character_plus,$img_style,$img_artist"

  # Prompt the user for optional parameters
  read -p "Enter the width of the image (optional): " \
    -e -i "${img_width:-1400}"  img_width
  read -p "Enter the height of the image (optional): " \
    -e -i "${img_height:-1920}" img_height
  read -p "Enter the seed for the image (optional): " \
    -e -i "${img_seed}"         img_seed
}

# Gets the image from the Pollinations.ai API
function get_image() {
  curl -o "$IMG_TMP_PATH" \
    --data-urlencode "width=${img_width:-1400}" \
    --data-urlencode "height=${img_height:-1920}" \
    --data-urlencode "seed=${img_seed:=$RANDOM}" \
    --data-urlencode "nologo=true" \
    --get https://image.pollinations.ai/prompt/$(url_encode $img_description)
}

# Controls that there is only one continuous feh instance
function show_image() {
  if ! pgrep -f "feh $IMG_TMP_PATH" > /dev/null; then
    feh $IMG_TMP_PATH &
  fi
}

# Copies the generated image to a safer location
function save_image() {
  # Getting the save file spaces
  local default_save=$(save_image_path_default)
  local user_save=$(save_image_path_user "$default_save")
  local save_path="${user_save:-$default_save}"

  # Check if the file directory exists
  local save_path_dir=$(dirname "$save_path")
  if [ ! -d "$save_path_dir" ]; then
    mkdir -p "$save_path_dir"
  fi

  # Making sure existing images don't get accidentally overwritten
#  local count=1
#  local filename=$(basename "$save_path")
#  local extension="${filename##*.}"
#  local filename="${filename%.*}"
#  while [ -e "$save_path" ]; do
#    save_path="$(filepath_encode "$save_path_dir" "$filename" "$count.$extension")"
#    count=$((count + 1))
#  done
  
  # Actually doing the file saving now
  cp "$IMG_TMP_PATH" "$save_path"
  echo "Image saved successfully at: '$save_path'"
}

# Generate the default save path
function save_image_path_default() {
  local default_name="[$img_seed] $img_description"
  echo "$(filepath_encode "$IMG_SAV_PATH" "$default_name" "$IMG_SAV_EXT")"
}

# Prompt the user for their custom path
function save_image_path_user() {
  local default_save="$1"

  # Prompt the user for their custom file path
  read -p "Enter the location you want to save the image: " \
    -e -i "$default_save" save_path

  # Rechecking and restyling the filepath, since the user could've mucked it up
  local save_path_dir=$(dirname "$save_path")
  local save_path_file=$(basename "${save_path:-$default_save}")
  local save_path_name=${save_path_file%.*}
  local save_path_ext=${save_path_file##*.}
  [ "$save_path_ext" = "$save_path_file" ] && save_path_ext="" # If there's no extension
  local save_path_complete=$(filepath_encode            \
      "${save_path_dir:-$IMG_SAV_PATH}"                 \
      "${save_path_name:-$(basename $default_save)}"    \
      "${save_path_ext:-$IMG_SAV_EXT}"                  \
  )

  echo "$save_path_complete"
}

# The main function calling all the shots
main() {
  while true; do
    # Do all the logic bits
    prompt_image
    get_image
    show_image
    read -p "Do you wish to save the image permanently? [y/N] " response
    if [[ $response == "Y" || $response == "y" ]]; then
      save_image
    fi

    # Continue the loop or naw?
    echo
    read -p "Do you want to generate another image? [Y/n] " continue_response
    if [[ $continue_response == "N" || $continue_response == "n" ]]; then
      break
    fi
  done
}

# Actually execute this thing, ffs
main

