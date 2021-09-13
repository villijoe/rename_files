#!/bin/bash

#main_path='/mnt/FN05/MB_LS'
main_path='E:/mosarchiv/mb_ls/'

for i in `find $main_path -type d`
do
  echo $i
done