# initialize-startups

## Description

Small project to manage your custom list of services for systemd init.

## Usage

Mention the services with the format mentioned below insid list_of_services.txt.

## list_of_services.txt

This is the file where the names of your services would go.

### structure

<name_of_the_service>=enable
<name_of_the_service>=disable
<name_of_the_service>=stop
<name_of_the_service>=start
...

## working

The file `list_of_services.txt` will be monitored by the `initialize.sh` constantly and will change the status of the services based on the status mentioned in the txt file.
