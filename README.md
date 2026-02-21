# Dithering

Colortables for dithering images

## Samples

```
convert IMG_1868.JPG -dither FloydSteinberg -remap colortable-green-8c.gif  img-1868-64c8.JPG
magick img-src/Jan-Weenix-2026.jpg -dither FloydSteinberg -remap src/colortable/colortable-green-8c.gif  export/Jan-Weenix-2026-dithered.jpg
magick img-src/Jan-Weenix-2026.jpg -dither FloydSteinberg -remap src/colortable/colortable-red.gif  export/Jan-Weenix-2026-dithe-red.jpg

```

## slog

SRCDIR='~/Pictures/'
TRTDIR='~/Mega/transferstation/'
SRCIMG='WALK-XI-2021-01-27-Mariakerke.png'
TRTIMG='d-'$SRCIMG
DSRC=$SRCDIR$SRCIMG
TSRC=$TRTDIR$TRTIMG
convert $DSRC -dither FloydSteinberg -remap colortable-green-8c.gif $TSRC

