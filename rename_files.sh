#!/bin/bash

#main_path='/mnt/FN05/MB_LS'
main_path='E:/mosarchiv/mb_ls/'

for folder in `find $main_path -type d`
do
  # попадаем в папку
  #cd "$main_path""$folder"
  if [ "$folder" != "$main_path" ]
  then
    cd "$folder"

    for file in `ls *`
    do
      if [ -d $file ]
      then
        echo "is directory"
      else
        echo "is file"
        # меняем расширение
        if [[ $file == *.JPG ]]
        then
          mv "$file" "${file%.JPG}.jpg"
        fi
        # получаем имя без расширения
        name=$(echo "$file" | cut -d'.' -f1)
        # удаляем спецсимволы -,_
        name_without_spec=${name//[^[:alnum:]]/}
        # проверяем сколько символом содержит имя файла
        count=$(echo -n "$name" | wc -c)
        if [[ count -gt 8 ]]
        then
          echo "count"
          echo "$count"
        fi
      fi
    done
  fi
done