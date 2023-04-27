#!/bin/bash
echo "filename:$filename"
while read -r url;
do
    echo "Findomain"
    findomain -t $url -o $url.txt
    echo "Assetfinder"
    assetfinder --subs-only $url | tee -a $url.txt
    sort -u $url.txt -o $url.txt
    echo "Subjack"
    subjack -w $url.txt -o result_$url.txt -ssl 
done < $filename
