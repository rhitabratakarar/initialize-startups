# initialize-startups

## Description

Manage your custom list of services for systemd.

## Usage

After cloning this repository, give `initialize.sh` with execute permission and execute:\

```bash
    chmod +x ./initialize.sh
```

```bash
    ./initialize.sh
```

Mention the services with the format mentioned below under  [list_of_services.txt](#list_of_services-file-structure).\
**Note:** The `list_of_services.txt` will be located in the `$HOME` directory. So the location of the file would be `/home/$USER/list_of_services.txt`.

## list_of_services file structure

This is the file where the names of your services would go.

### structure

<name_of_the_service>=enable\
<name_of_the_service>=disable\
<name_of_the_service>=stop\
<name_of_the_service>=start\
...

## working

The file `list_of_services.txt` will be monitored by the `initialize.sh` constantly and will change the status of the services based on the status mentioned in the txt file.
