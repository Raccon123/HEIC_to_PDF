

#!/bin/bash
#noninc

homedir=~
inputimage=in


#inc
outheicconv=outimg

outputpdf=
#noninc


compest=500k

Strip_exif=false            # true false

comprest=false              # true false

rotate=false                # true false

Pdf=false                   # true false

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


if [ $rotate == true ]
then
echo "rotate"
mogrify -rotate $rotate_degrees $outheicconv/*.jpg
echo "Done rotate"
fi


if [ $comprest == true ]
then
echo "compressing"
jpegoptim --size=$compest $outheicconv/*.jpg
echo "Done compressing"
fi

if [ $Strip_exif == true ]
then
echo "Strip exif start"
mogrify -strip $outheicconv/*.jpg  
echo "Strip exif Done"
fi


if [ $Pdf  == true ]
then
echo "Convert to pdf"
img2pdf $outheicconv/*.jpg -o $outputpdf.pdf   --fit shrink  
echo "Convert to pdf Done"
fi

  
echo "Done Done"
 