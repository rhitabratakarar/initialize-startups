# initialize-startups

## Description

Manage your custom list of services for systemd.

## Installation

1. Clone this repository, and `cd initialize-startups`
2. Give `initialize.sh` execute permission by executing `chmod +x initialize.sh`
3. Open `monitor.sh` and modify the `home_path` variable with your current user's $HOME (use the absolute path).
4. Do the same for `initialize.sh`.
5. Now execute `sudo bash initialize.sh` to setup the system automatically.
6. After completion, run the command `sudo chown $USER:$USER ~/list_of_services.txt`

## Usage

Hopefully you have completed the [Installation](#installation) step completely. Now mention the services with the format mentioned below under  [list_of_services.txt](#list_of_services-file-structure).

**Note:** The `list_of_services.txt` and `monitor.sh` will be located in the same directory you have mentioned in the [installation](#installation) step. So the location of the file is supposed to be `/home/$USER/list_of_services.txt` and `/home/$USER/monitor.sh`.

*Please **DO NOT** remove these files from the home directory. If you did that accidentally, run the `initialize.sh` again.*

## list_of_services file structure

This is the file where the names of your services would go.

### structure

<name_of_the_service>=<command[start|stop|enable|disable]>\

Examples:

service0=enable\
service1=disable\
service2=start\
service3=stop\
...

## How does it work?

The file `list_of_services.txt` will be monitored by the `monitor.sh` constantly and will change the status of the services based on the status mentioned in the txt file of the respective services. Both of the files would be present in the `$HOME` directory.\

## Optional

If you make changes to the file `initialize.sh` that contains the service related information, you can use systemd-analyze to verify.

```bash
systemd-analyze verify yourservice.service
```

For monitoring, you can use `journalctl -f`
