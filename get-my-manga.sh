#!/bin/bash

base_url="https://api.mangadex.org/"
base_folder="./manga-get-result"
result_file="result.json"

rm -rf $base_folder
mkdir $base_folder && cd $_

echo -e "Введите название манги для поиска (на английском):"
read manga_title

echo -e "Осуществляю поиск по названию $manga_title"

#try
{
response=$(curl -X GET "${base_url}/manga?title=${manga_title}" \
                -H 'accept: application/json' \
                -D 'headers.txt' \
                -o $result_file \
                -w "%{http_code}")
} || { #catch
     echo "Ошибка! Попробуйте не вводить пробелы =)"
     exit 1
}

if [ $response = '200' ]; then
     jq . $result_file
else
     echo "Упс! Что-то пошло не так. Сервер ответил с кодом $response."
     echo "Более подробную информацию можно посмотреть в файлах каталога $base_folder"
fi








