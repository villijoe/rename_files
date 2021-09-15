#!/bin/bash

#main_path='/mnt/FN05/MB_LS'
main_path='E:/mosarchiv/mb_ls/'

while read -r folder
do
  # попадаем в папку
  echo "$main_path""$folder"
  cd "$main_path""$folder"

  for file in `ls *`
  do
    if ! [ -d $file ]
    then
      echo "$file"
      # меняем расширение
      if [[ $file == *.JPG ]]
      then
        mv "$file" "${file%.JPG}.jpg"
      fi

    fi
  done
done < list.orig