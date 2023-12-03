#!/usr/bin/env bash

home_path='/home/sup3r'
file_name="list_of_services.txt"

file_location="$home_path/$file_name"

while read -r line
do
    arrIn=(${line//=/ })

    service_name=${arrIn[0]}
    status=${arrIn[1]}
    systemctl $status $service_name
done < "$file_location"
