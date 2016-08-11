3Devo USB-to-serial firmware
============================
This repository contains the sources for the USB-to-serial firmware
running in the Devoboard's 16u2. This is mostly a verbatim copy of the
code used by Arduino, consisting of a simple serial interface combined
with a USB serial (CDC) interface using the LUFA library. This uses an
old version of the LUFA library, just like Arduino, since that one has
been proven to work.

The USB identifier used by this code is one purchased from a third
party, so the vendor id is not owned by 3Devo. This vidpid is expected
to be used for all variants and (future) revisions of the filament
extruder. Further subdivision is made using the USB descriptor strings,
which list the SKU of a particular machine. The serial number exposed
through USB is just the internal serial number of the 16u2 chip, which
only ensures uniqueness, this number is not related to the serial number
of the machine itself.

To build the code, run "make". To program it, including setting the
fuses, run "make program". See the Makefile for details on the fuse
settings used.

Binaries
--------
Binaries of the released versions are also stored in this repository,
but the commits adding them are only present in the tags, not in any
branch (so see the tags for binaries).

Windows driver
--------------
This repository also contains a Windows "driver" for the virtual serial
port. To install it, download the .inf file (make sure to keep the name
as it is), right-click this file and select "install". This is not a
full-fledged driver, it just tells Windows to use the builtin CDC serial
driver for this USB id.

On Linux and OSX, no installation should be needed, the CDC class
identifier in the USB descriptor is automatically detected and the
appropriate driver loaded.
