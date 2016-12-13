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

License
-------
This firmware, as well as the LUFA library used are licensed under an
older version of the MIT license. Its terms are as follows:

> Copyright 2010  Dean Camera (dean [at] fourwalledcubicle [dot] com)
>
> Permission to use, copy, modify, distribute, and sell this
> software and its documentation for any purpose is hereby granted
> without fee, provided that the above copyright notice appear in
> all copies and that both that the copyright notice and this
> permission notice and warranty disclaimer appear in supporting
> documentation, and that the name of the author not be used in
> advertising or publicity pertaining to distribution of the
> software without specific, written prior permission.
>
> The author disclaim all warranties with regard to this
> software, including all implied warranties of merchantability
> and fitness.  In no event shall the author be liable for any
> special, indirect or consequential damages or any damages
> whatsoever resulting from loss of use, data or profits, whether
> in an action of contract, negligence or other tortious action,
> arising out of or in connection with the use or performance of
> this software.
