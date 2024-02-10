#!/bin/bash
base_url="https://api.mangadex.org/"
base_folder="./manga-get-result"

if [ -d $base_folder ]; then
     rm -rf $base_folder
fi
 
mkdir manga-get-result && cd $_
touch headers.txt result.json

echo -e "Введите название манги для поиска:"
read manga_title

echo -e "Осуществляю поиск по названию $manga_title"

curl -X GET "${base_url}/manga?title=\"${manga_title}\"" \
     -H 'accept: application/json' \
     -D 'headers.txt' \
     -o 'result.json'


jq . result.json
