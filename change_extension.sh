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

    cnt=0
    prev_name=''
    for file in `ls *`
    do
      echo "$prev_name"
      cnt=$((cnt+1))
      if [ -d $file ]
      then
        echo "is directory"
      else
        #echo "is file"
        # меняем расширение
        if [[ $file == *.JPG ]]
        then
          mv "$file" "${file%.JPG}.jpg"
        fi

      fi
    done
  fi
done