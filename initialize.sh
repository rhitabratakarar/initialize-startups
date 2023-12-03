#!/usr/bin/env bash

home_path='/home/sup3r'

cp "./monitor.sh" $home_path
cp "./list_of_services.txt" $home_path

service_filepath='/etc/systemd/system/initialize-startups.service'
path_unit_filepath='/etc/systemd/system/initialize-startups.path'
touch $service_filepath


echo "
[Unit]
Description='Initialize-Startups Service'

[Service]
User=root
ExecStart=/usr/bin/bash $home_path/monitor.sh" > $service_filepath


echo "
[Unit]
Description='Monitor the $home_path/list_of_services.txt file for changes'

[Path]
PathModified=$home_path/list_of_services.txt
Unit=initialize-startups.service

[Install]
WantedBy=multi-user.target" > $path_unit_filepath


systemctl enable initialize-startups.path
systemctl start initialize-startups.path

echo "status of initialize-startups.path: " $(systemctl is-active initialize-startups.path)
