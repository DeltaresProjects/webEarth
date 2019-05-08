[![Build Status](https://travis-ci.org/csdms/bmi-cxx.svg?branch=master)](https://travis-ci.org/csdms/bmi-cxx)

# bmi-cxx

C++ bindings for the
[Basic Model Interface](http://csdms.colorado.edu/wiki/BMI_Description).

Build
-----
To build the BMI C++ bindings and tests,

    $ mkdir _build && cd _build
    $ cmake ../ -DCMAKE_INSTALL_PREFIX=<path-to-installation>
    $ make

where `<path-to-installation>` is the base directory where you want
to install things (`/usr/local` is the default).

To test,

    $ make test

To install,

    $ make install
