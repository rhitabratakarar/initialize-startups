#!usr/bin/bash

file_name="list_of_services.txt"
file_location="$(realpath $HOME)/$file_name"

while read -r line
do
    arrIn=(${line//=/ })

    service_name=${arrIn[0]}
    status=${arrIn[1]}
    systemctl $status $service_name
done < "$file_location"
