# oneshell
Shell framework example for shell project, include:
- Command options, eg. -t|--target {value}
- Pretty logs, print time and the script name, friendly for shell script trouble shooting
- Properties configurations, export variables in properties file to env, support comment by #
- Module and script structure

## Usage example

### Command options
Command example:
```
Usage:
    . Create:
      ./main.sh create -t|--target target [-d|--dryrun true|false]
    . Delete:
      ./main.sh delete  -t|--target target [-d|--dryrun true|false]
    . Show help:
      ./main.sh -h|--help

    Options:
        -t|--target: action target: all|lab, split by ',' for multiple target
        -d|--dryrun:
            true : Dry run
            false: Default value, Real run

```

### Pretty logs
Log command:
```
info "Start to create configuration..."
info "check_env_parameters..."
warn "LAB_ID not set, use default."
error "Not found Openstack lab vars file: /opt/oneshell/runtime/lab_vars.sh!"
```
The logs example:
```
2020-08-24 03:17:06 | /opt/oneshell/main.sh | INFO | Start to create configuration...
2020-08-24 03:17:07 | /opt/oneshell/main.sh | INFO | check_env_parameters...
2020-08-24 03:17:07 | /opt/oneshell/main.sh | WARN | LAB_ID not set, use default.
2020-08-24 03:17:07 | /opt/oneshell/main.sh | ERROR | Not found Openstack lab vars file: /opt/oneshell/runtime/lab_vars.sh!

```