# dithering
Colortables for dithering images

## samples

convert IMG_1868.JPG -dither FloydSteinberg -remap colortable-green-8c.gif  img-1868-64c8.JPG

## slog

SRCDIR='~/Pictures/'
TRTDIR='~/Mega/transferstation/'
SRCIMG='WALK-XI-2021-01-27-Mariakerke.png'
TRTIMG='d-'$SRCIMG
DSRC=$SRCDIR$SRCIMG
TSRC=$TRTDIR$TRTIMG
convert $DSRC -dither FloydSteinberg -remap colortable-green-8c.gif $TSRC

