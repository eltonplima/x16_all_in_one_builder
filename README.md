# x16 emulator all in one builder

This repository provides a Makefile to build the [x16 emulator](https://github.com/commanderx16/x16-emulator/) and everything else around it.

The Makefile was based on the [official instructions](https://github.com/commanderx16/x16-emulator/wiki/x16-emulator-Getting-Started#building-from-scratch-on-macos).


The Makefile basically coordinates the following steps:

* Install dependencies
* Clone and build [CC65](https://github.com/cc65/cc65.git)
* Clone and build [x16 rom](https://github.com/commanderx16/x16-rom)
* Clone and build [x16 emulator](https://github.com/commanderx16/x16-emulator)

> Only validated with MacOS. Fell free to test, improve and open a PR

## Build

```bash
make
```

## Clean

```bash
make clean
```

## Useful commands

Reduce the cpu usage of the emulator with [cputhrottle](http://www.willnolan.com/cputhrottle/cputhrottle.html).

```bash
sudo ./cputhrottle $(ps A | grep x16emu | grep -v grep | awk '{print $1}') <MAX CPU USAGE %>
```
