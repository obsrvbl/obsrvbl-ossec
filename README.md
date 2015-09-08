## Introduction

This project contains code to build .deb and .rpm packages for the [OSSEC](http://www.ossec.net/) host-based IDS.
The package will install the "local" flavor of OSSEC and is designed to be compatible with the Observable Networks monitoring service.

## Building packages

In order to build the .deb and .rpm packages you will need:

* `gcc`
* `ruby` and the `fpm`
* `rpm`

Issue `make build` to compile OSSEC and then `make deb` or `make rpm` to create packages.

## Credits and licenses

OSSEC is licensed under the GNU General Public License (version 2). See the [OSSEC license](https://github.com/ossec/ossec-hids/blob/master/LICENSE) for more information.

This project was originally based on Nicolas Zin's [ossec-deb](https://github.com/nzin/ossec-deb). The packaging work is licensed under the GNU General Public License (version 3). See the [the original](https://github.com/nzin/ossec-deb/blob/0f84c47c226c1f8003af319b7976391fcad1b3f2/ossec-hids-local-2.8.0/debian/copyright) for more information.
