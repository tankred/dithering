#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t' # The IFS variable

usage() {
  cat <<EOF
Usage: ./$(basename "$0") [-h] [-V] 
dithering images
Generated dithered image in same dir with .dit. suffix
colortable is hardcoded in script; 

Options:

-h, --help      Print this help and exit
-V, --version   Print version
-f, --file      File to dither required

Sample:
./$(basename "$0") -f <file>
EOF
  exit
}

version() {
  cat <<EOF
v0.2.2
EOF
  exit 0
}

main() {
  # ~ is not converted when not specifying bin bash
  DSRC=$file
  echo $DSRC
  base="${file%.[^.]*}";
  dirname="${file%/*}" # get directory/path name
  filename=$(basename -- "$file")
  extension="${filename##*.}"
  #  echo "b: $base"
  #  echo "d: $dirname"
  #  echo "f: $filename"
  #  echo "e: $extension"
  TSRC=$dirname"/"$(basename -- "$file" .$extension).dit.$extension
  echo $TSRC
  magick $DSRC -dither FloydSteinberg -remap colortable/colortable-green-8c.gif $TSRC
}

msg() {
  echo >&2 -e "${1-}"
}

catch() {
  local msg=$1
  local code=${2-1} # default exit status 1
  msg "$msg"
  exit "$code"
}

parse_params() {
  while :; do
    case "${1-}" in
    -h | --help) usage ;;
    -V | --version) version ;;
    -f | --file) 
      file="${2-}"
      shift
      ;;
    *) break ;;
    esac
    shift
  done
  [[ -z "${file-}" ]] && catch "Missing required parameter: file"
  return 0
}

parse_params "$@"

main

