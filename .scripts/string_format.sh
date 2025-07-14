#!/bin/bash

# A sed-based url encoder
# https://gist.github.com/jaytaylor/5a90c49e0976aadfe0726a847ce58736
function url_encode() {
  echo "$@" \
  | sed \
    -e 's/%/%25/g' \
    -e 's/ /%20/g' \
    -e 's/!/%21/g' \
    -e 's/"/%22/g' \
    -e "s/'/%27/g" \
    -e 's/#/%23/g' \
    -e 's/(/%28/g' \
    -e 's/)/%29/g' \
    -e 's/+/%2b/g' \
    -e 's/-/%2d/g' \
    -e 's/:/%3a/g' \
    -e 's/;/%3b/g' \
    -e 's/?/%3f/g' \
    -e 's/@/%40/g' \
    -e 's/\$/%24/g' \
    -e 's/\&/%26/g' \
    -e 's/\*/%2a/g' \
    -e 's/\//%2f/g' \
    -e 's/\[/%5b/g' \
    -e 's/\\/%5c/g' \
    -e 's/\]/%5d/g' \
    -e 's/\^/%5e/g' \
    -e 's/_/%5f/g' \
    -e 's/`/%60/g' \
    -e 's/{/%7b/g' \
    -e 's/|/%7c/g' \
    -e 's/}/%7d/g' \
    -e 's/~/%7e/g'
}

# A sed-based filepath encoder
# Inspired by: https://stackoverflow.com/a/49832505
function filepath_encode() { 
  local file_directory="$1"
  local file_name="$2"
  local file_extension="$3"

  # Remove any leading periods from the extension
  local file_extension="${file_extension#*.}"

  # Rewrite non-alphanumerical characters with underscores
  local file_name_encoded="${file_name//[^0-9a-zA-Z\.\[\]\{\}\(\)_-]/_}"
  # Remove double underscores
  file_name_encoded="${file_name_encoded//__/_}"
  # Remove trailing periods and slashes
  file_name_encoded="${file_name_encoded%"${file_name_encoded##*[!_\.]*}"}"
  # Shrink the filename to a computable size
  file_name_encoded="${file_name_encoded:0:250 - ${#file_extension}}"

  echo "${file_directory}/${file_name_encoded}.${file_extension}"
}

