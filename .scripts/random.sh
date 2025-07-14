#!/bin/bash

# Default values
DEFAULT_SIZE=128

# Function to generate a random numeric value
generate_numeric() {
  local floor=1
  local ceiling=$DEFAULT_SIZE

  if [[ $# -eq 1 ]]; then
    ceiling=$1
  elif [[ $# -ge 2 ]]; then
    floor=$1
    ceiling=$2
  # No need to check for 0 values being passed,
  # since the default local already takes care of that
  fi

  echo $(( RANDOM % (ceiling - floor + 1) + floor ))
}

# Function to generate a random string
generate_string() {
  local characters=""
  local string_size=${2:-${1:-$DEFAULT_SIZE}}

  # Figure out the randomness type asked
  local string_type="${1,,}"
  case "$string_type" in
    'num')
      characters="[:digit:]"
      ;;
    'alpha')
      characters="[:alpha:]"
      ;;
    'alnum')
      characters="[:alnum:]"
      ;;
    *)
      characters="[:graph:]"
      ;;
  esac

  cat /dev/urandom | tr -dc "$characters" | fold -w "${string_size}" | head -n 1
}

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    -n|--numeric)
      shift
      generate_numeric "$@"
      exit
      ;;
    -s|--string)
      shift
      generate_string "$@"
      exit
      ;;
    *)
      echo "Invalid option: $1"
      exit 1
      ;;
  esac
done

# Default behavior: Generate random numeric value between 1 and 128
generate_numeric
