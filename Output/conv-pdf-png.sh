for file in *.pdf; do
  magick -density 300 "$file" "${file%.pdf}%02d.png"
done
