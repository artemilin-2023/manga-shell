#!/bin/bash

base_url="https://api.mangadex.org/"
base_folder="./manga-get-result"
result_file="result.json"

rm -rf $base_folder
mkdir $base_folder && cd $_

echo -e "Введите название манги для поиска (на английском):"
read manga_title

echo -e "Осуществляю поиск по названию $manga_title"

echo $(curl -X GET "${base_url}/manga?title=${manga_title}" \
     -H 'accept: application/json' \
     -D 'headers.txt' \
     -o $result_file)


jq . $result_file