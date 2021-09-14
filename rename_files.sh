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
        # получаем имя без расширения
        name=$(echo "$file" | cut -d'.' -f1)
        # удаляем спецсимволы -,_
        name_without_spec=${name//[^[:alnum:]]/}
        # проверяем сколько символом содержит имя файла
        count=$(echo -n "$name_without_spec" | wc -c)
        # если файл последняя обложка, обычно второй файл
        if [ $cnt == 2 ]
        then
          last=$(echo `ls *.jpg | awk 'END{print $0}'`)
          last=$(echo $last | head -c 8)
          #echo 'last cover'
          last_num=$((last+1))
          count_last_num=$(echo -n "$last_num" | wc -c)
          #echo "$count_last_num"
          last_name=$last_num
          for(( c=$count_last_num; c<8; c++ ))
          do
            last_name=$(echo "0""$last_name")
            #echo "$last_name"
          done
          #echo "$last_name"
        fi

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
        prev_name="$new_name"
        #echo "$new_name"
      fi
    done
  fi
done