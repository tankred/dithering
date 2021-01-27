
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

