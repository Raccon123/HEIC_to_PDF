

#!/bin/bash
#noninc

homedir=

inputimage=imageheic1

#inc
outheicconv=image2

outputpdf=out2
#noninc


compest=500k

comprest=1              # 1 is on 0 is off

rotate=1                # 1 is on 0 is off

rotate_degrees=-90

cd $inputimage 
mkdir temp
for f in *.HEIC
do
heif-convert -q 100 $f temp/$f.jpg
done

cd 

cd $homedir

mkdir $outheicconv 

mv $inputimage/temp/* $outheicconv/

rmdir $inputimage/temp/


if [ 1 == $rotate ]
then
echo "rotate"
mogrify -rotate $rotate_degrees $outheicconv/*.jpg
fi


if [ 1 == $comprest ]
then
echo "compressing"
jpegoptim --size=$compest $outheicconv/*.jpg
fi

echo "Convert to pdf"
img2pdf $outheicconv/*.jpg -o $outputpdf.pdf   --fit shrink  
echo "Done"
 