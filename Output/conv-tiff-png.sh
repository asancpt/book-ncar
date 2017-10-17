for file in *.tiff; do
  magick -density 300 "$file" "${file%.tiff}.png"
done
