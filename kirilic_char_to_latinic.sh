#!/bin/bash

#main_path='/mnt/FN05/MB_LS'
cd E:/mosarchiv/mb_ls/

for folder in *
do

  # sed-ом заменяем символы латиницы на символы кирилицы
  TRS=`echo $folder | sed "y/абвгдеёзийлмнопруф/abvgdeeziilmnopruf/"`
  TRS=`echo $TRS  | sed "y/АБВГДЕЁЗИЙЛМНОПРУФ/ABVGDEEZIILMNOPRUF/"`
  TRS=${TRS//ж/zh};
  TRS=${TRS//х/kh};
  TRS=${TRS//ч/ch};
  TRS=${TRS//ш/sh};
  TRS=${TRS//щ/sch};
  TRS=${TRS//ю/yu};
  TRS=${TRS//я/ya};
  TRS=${TRS//ц/tc};
  TRS=${TRS//с/s};
  TRS=${TRS//к/k};
  TRS=${TRS//к/K};
  TRS=${TRS//э/e};
  TRS=${TRS//т/t};

  # переименовываем
  mv -v "$folder" "$TRS"

done