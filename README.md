# obsrvbl-ossec

This project contains code to build a Debian package for the [OSSEC](http://www.ossec.net/) host-based IDS.
The package will install the "local" flavor of OSSEC and is designed to be compatible with the Observable Networks monitoring service.

Originally based on [nzin/ossec-deb](https://github.com/nzin/ossec-deb), this project now uses [fpm](https://github.com/jordansissel/fpm) for packaging.

To build, first install `fpm` and then issue the `make deb` command.
