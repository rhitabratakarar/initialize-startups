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

In order to use this project, you simply have to modify the list_of_services file. The file should be present in the home directly if you did everything correctly and you have to write the name of your service and the command that you want to send to that service. Commands like `enable`, `disable`, `start`, `stop` will follow the same functionality as they does in the `systemctl` command. The [file structure](#list_of_services-file-structure) will provide you with information.

**Note:** The `list_of_services.txt` and `monitor.sh` will be located in the same directory you have mentioned in the [installation](#installation) step. So the location of the file is supposed to be `/home/$USER/list_of_services.txt` and `/home/$USER/monitor.sh`.

*Please **DO NOT** remove these files from the home directory. If you did that accidentally, run the `initialize.sh` again.*

## list_of_services file structure

This is the file where the names of your services would go along with their command seperated by `=`.

### structure

<name_of_the_service>=<command[start|stop|enable|disable]>\

Examples:

service0=enable\
service1=disable\
service2=start\
service3=stop

**Explanation:** If you're using the above format for filling the `list_of_services` file, for `service0`, this project will `enable` the service to get loaded during the system boot. while `service1`, `service2` and `service3` will follow their assigned commands. The behavior would be the same as your `systemctl` verb.

For example: `service0=enable` is the same as `systemctl enable service0`.

## How does it work?

The file `list_of_services.txt` will be monitored by the `monitor.sh` constantly and will change the status of the services based on the status mentioned in the txt file of the respective services. Both of the files would be present in the `$HOME` directory.\

## Optional

If you make changes to the file `initialize.sh` that contains the service related information, you can use systemd-analyze to verify.

```bash
systemd-analyze verify yourservice.service
```

For monitoring, you can use `journalctl -f`
