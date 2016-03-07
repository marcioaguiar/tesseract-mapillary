mkdir coord
for i in *jpg ; do
    echo "Converting coordinates $i"
    convert $i -crop $1 coord/$i
done
