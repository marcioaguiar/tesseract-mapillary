cd coord

for i in *jpg ; do
    ./negative2positive $i ./enhanced/$i
    ./textcleaner -p 10 -g -e stretch -f 10 -t 20 ./enhanced/$i ./enhanced/2/$i
done
cd enhanced/2
for i in *jpg ; do
    tesseract $i $i -l dsdigital --tessdata-dir /home/marcio/dev/open-source/tesseract-mapillary/tessdata/ -psm 6 --user-patterns /home/marcio/dev/open-source/tesseract-mapillary/tessdata/latlng.user-patterns -c tessedit_char_whitelist=-,0123456789 -c tosp_min_sane_kn_sp=8
done
for i in *txt ; do
    tr '\n' ' ' < $i > temp.txt && mv temp.txt $i
    echo -e '\n' >> $i
done

cat *.txt >> all.txt

