#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t' # The IFS variable - which stands for Internal Field Separator 

usage() {
  cat <<EOF
Usage: ./$(basename "$0") [-h] [-V] 
Bash kitchen sink
IMG and output is hardcoded in script; 

Options:

-h, --help      Print this help and exit
-V, --version   Print version
EOF
  exit
}

version() {
  cat <<EOF
v0.1.3
EOF
  exit 0
}

parse_params() {
  while :; do
    case "${1-}" in
    -h | --help) usage ;;
    -V | --version) version ;;
    *) break ;;
    esac
    shift
  done
  return 0
}

parse_params "$@"

echo "-------------------------------"
echo "       bash kitchen "
echo "-------------------------------"
# ~ is not converted when not specifying bin bash?
SRCDIR='/home/kurt/Pictures/'
TRTDIR='/home/kurt/MEGA/transferstation/'
SRCIMG='WALK-XI-2021-01-27-Mariakerke.png'
TRTIMG='d-'$SRCIMG
DSRC=$SRCDIR$SRCIMG
TSRC=$TRTDIR$TRTIMG
echo $DSRC
echo $TSRC
convert $DSRC -dither FloydSteinberg -remap colortable/colortable-green-8c.gif $TSRC

