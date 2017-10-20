for file in *.tiff; do mv "$file" `echo $file | tr ' ' '_'` ; done
for file in *.tiff; do magick -density 300 "$file" "${file%.tiff}.png"; done
