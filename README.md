# Python Binary RPM Packager


This automation tooling generates a single file binary from a given Python
application using [pyInstaller](https://www.pyinstaller.org/), it then moves the
binary to its expected path (`/opt/example/binary`), and using
[fpm](https://github.com/jordansissel/fpm), a package (`.rpm`) is generated
containing basic metadata (as defined in `Makefile`). In addition to that, a
temporarily local yum repository is created under `/repo` where the previously
generated `.rpm` is added to. Finally, this repository is synced with an S3
bucket.

The directory `scripts/` contains the post-install and post-uninstall actions,
this boilerplate contains all necessary set of commands so your application can
be make use of systemd service manager.

## Where to improve?

* More parameters!
* Forget about yum repo, send .rpm to private bucket instead. Have another tool
to fetch packages from this bucket and populate (incrementally) a yum repository
(another public bucket?)
* Consider more packages types (.deb?)
* Systemd support should be optional (parameterized)
