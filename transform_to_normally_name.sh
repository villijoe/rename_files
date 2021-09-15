#!/bin/bash

#main_path='/mnt/FN05/MB_LS'
main_path='E:/mosarchiv/mb_ls/'

while read -r folder
do
  # попадаем в папку
  echo "$main_path""$folder"
  cd "$main_path""$folder"

  prev_name=''
  for file in `ls *`
  do
    echo "$prev_name"
    if ! [ -d $file ]
    then
      echo "$file"

      # получаем имя без расширения
      name=$(echo "$file" | cut -d'.' -f1)
      # удаляем спецсимволы -,_
      name_without_spec=${name//[^[:alnum:]]/}
      # проверяем сколько символом содержит имя файла
      count=$(echo -n "$name_without_spec" | wc -c)

      if [ $count -gt 8 ]
      then
        #echo "count"
        #echo "$count"
        new_name=$(echo $name_without_spec | head -c 8)
      elif [ $count -lt 8 ]
      then
        echo "count less"
        #echo "$count"
      else
        new_name=$name_without_spec
      fi
      #echo "$new_name"

      # переименовываем файл
      mv "$file" "${new_name}.jpg"

      # сохраняем имя предыдущего переименованного файла
      prev_name="$new_name"

    fi
  done
done < list.orig