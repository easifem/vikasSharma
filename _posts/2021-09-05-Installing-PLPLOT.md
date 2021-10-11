---
title: 'Using PLPLOT with Fortran'
tags: [PLPLOT, Fortran]
style: border
color: primary
description: In this note I have explained about how to install PLPLOT graph plotting library and use with Fortran.
---

# PLPLOT

## Introduction

PLplot is a software package for creating scientific plots . It is cross-platform ❤, which means it will work on Windows, Unix, and Linux system. The PLplot software, which is primarily licensed under [the LGPL](http://www.gnu.org/licenses/lgpl.html) 🔥. It is primarily written in C language, and it has  [bindings](http://plplot.sourceforge.net/index.php#bindings) 🔗 for several other language including Fortran 🖥️ .

The PLplot core library can be used to create 

- 💥standard x-y plots 
- 🔥semi-log plots
- 🚀log-log plots
- 🌤contour plots
- 🌹3D surface plots
- 🌩mesh plots
- 🦁bar charts
- 🥧pie charts. 

You can find more about PLPLOT  [➡️🖱](http://plplot.sourceforge.net/index.php)

## Historical remark

A small history of PLPLOT taken from the [official documentation](http://plplot.sourceforge.net/docbook-manual/plplot-html-5.15.0/plplot-plotting-library.html) is given below.

PLplot was originally developed by **Sze Tan** of the *University of Auckland* in **Fortran-77**. Many of the underlying concepts used in the PLplot package are based on ideas used in Tim Pearson's PGPLOT package. Sze Tan writes:

> I'm rather amazed how far PLPLOT has travelled given its origins etc. I first used PGPLOT on the Starlink VAX computers while I was a graduate student at the Mullard Radio Astronomy Observatory in Cambridge from 1983-1987. At the beginning of 1986, I was to give a seminar within the department at which I wanted to have a computer graphics demonstration on an IBM PC which was connected to a completely non-standard graphics card. Having about a week to do this and not having any drivers for the card, I started from the back end and designed PLPLOT to be such that one only needed to be able to draw a line or a dot on the screen in order to do arbitrary graphics. The application programmer's interface was made as similar as possible to PGPLOT so that I could easily port my programs from the VAX to the PC. The kernel of PLPLOT was modelled on PGPLOT but the code is not derived from it.

The C version of PLplot was originally developed by **Tony Richardson** on a Commodore Amiga. That version has been improved and expanded ever since first by **Geoffrey Furnish** and **Maurice Lebrun** in the 1990's and later (after the project was registered at SourceForge on 2000-02-23) [with a much-expanded development team.](http://plplot.org/credits.php)

## Installation of binary packages

Ubuntu 🍻

```bash
sudo apt-get install libplplot-dev libplplotfortran0
```


MacOS 🍎

```bash
brew install plplot
```


## Building from source

### Download the source code

```bash
git clone https://git.code.sf.net/p/plplot/plplot plplot-plplot
```

extra libs

```bash
sudo apt install libcairo-dev libglu1-mesa-dev freeglut3-dev mesa-common-dev
pip3 install pyqt5 pyqt5-tools 
```


### Building

After downloading the source code, run following command in terminal

```bash
cd plplot-plplot
git branch $(whoami)
git checkout $(whoami)
```

We will use `-DCMAKE_INSTALL_PREFIX` to define where we want to install `PLplot`. 


```sh
cmake -S ./ -B ./build DCMAKE_INSTALL_PREFIX=~/.easifem/extpkgs  -G "Unix Makefiles"
cmake --build ./build --target all
cmake --build ./build --target install
```

My Configuration:

In my case, I want to install it in `~/.easifem/extpkgs`. I have already set an environment variable `export EASIFEM_EXTPKGS=~/.easifem/extpkgs`, so I will use `${EASIFEM_EXTPKGS}`, but you can specify the path explicitly. There are several options. 

- `-DCMAKE_INSTALL_PREFIX:PATH=~/.easifem/extpkgs`
- `-DCMAKE_BUILD_TYPE:STRING=Release`, other option is `Debug`
- `-DBUILD_SHARED_LIBS:BOOL=ON`, set `OFF` if shared lib are not desired
- `-DBUILD_TEST:BOOL=ON`, set `OFF` you dont want to build the tests
-  `-DENABLE_fortran:BOOL=ON`, set `OFF`, if you dont want fortran bindings
-  `-DENABLE_lua:BOOL=ON`, set `OFF` if you do not want lua bindings


```sh
cmake -S ./ -B ~/temp/easifem-extpkgs/plplot/build -G "Unix Makefiles"  -DCMAKE_INSTALL_PREFIX=${EASIFEM_EXTPKGS} -DCMAKE_BUILD_TYPE:STRING=Release -DBUILD_SHARED_LIBS:BOOL=ON  -DBUILD_TEST:BOOL=ON -DENABLE_fortran:BOOL=ON -DENABLE_lua:BOOL=ON

cmake --build ~/temp/easifem-extpkgs/plplot/build --target all
```

Now you can go to `$EASIFEM_EXTPKGS`

```sh
├── bin
├── include/plplot
├── lib
├── man
└── share
```

contents of `/bin`

```sh
/bin
├── plserver
├── pltcl
└── pltek
```

contents of `/include/plplot`

```sh
├── csadll.h
├── csa.h
├── disptab.h
├── drivers.h
├── pdf.h
├── plConfig.h
├── pldebug.h
├── plDevs.h
├── pldll.h
├── plevent.h
├── plplot.h
├── plplotP.h
├── plstream.h
├── plstrm.h
├── pltcl.h
├── pltk.h
├── plxwd.h
├── qsastimedll.h
├── qsastime.h
├── qt.h
└── tclMatrix.h
```

contents of `/lib`

```sh
├── cmake
├── fortran
├── libcsirocsa.so -> libcsirocsa.so.0
├── libcsirocsa.so.0 -> libcsirocsa.so.0.0.1
├── libcsirocsa.so.0.0.1
├── libplfortrandemolib.a
├── libplplotcxx.so -> libplplotcxx.so.15
├── libplplotcxx.so.15 -> libplplotcxx.so.15.0.0
├── libplplotcxx.so.15.0.0
├── libplplotfortran.so -> libplplotfortran.so.0
├── libplplotfortran.so.0 -> libplplotfortran.so.0.2.0
├── libplplotfortran.so.0.2.0
├── libplplotqt.so -> libplplotqt.so.2
├── libplplotqt.so.2 -> libplplotqt.so.2.0.3
├── libplplotqt.so.2.0.3
├── libplplot.so -> libplplot.so.17
├── libplplot.so.17 -> libplplot.so.17.0.0
├── libplplot.so.17.0.0
├── libplplottcltk_Main.so -> libplplottcltk_Main.so.1
├── libplplottcltk_Main.so.1 -> libplplottcltk_Main.so.1.0.1
├── libplplottcltk_Main.so.1.0.1
├── libplplottcltk.so -> libplplottcltk.so.14
├── libplplottcltk.so.14 -> libplplottcltk.so.14.1.0
├── libplplottcltk.so.14.1.0
├── libqsastime.so -> libqsastime.so.0
├── libqsastime.so.0 -> libqsastime.so.0.0.1
├── libqsastime.so.0.0.1
├── libtclmatrix.so -> libtclmatrix.so.10
├── libtclmatrix.so.10 -> libtclmatrix.so.10.3.0
├── libtclmatrix.so.10.3.0
├── pkgconfig
└── plplot5.15.0
-plplot5.15.0
└── drivers
    ├── mem.driver_info
    ├── mem.so
    ├── ntk.driver_info
    ├── ntk.so
    ├── null.driver_info
    ├── null.so
    ├── ps.driver_info
    ├── ps.so
    ├── qt.driver_info
    ├── qt.so
    ├── svg.driver_info
    ├── svg.so
    ├── tk.driver_info
    ├── tk.so
    ├── tkwin.driver_info
    ├── tkwin.so
    ├── xfig.driver_info
    ├── xfig.so
    ├── xwin.driver_info
    └── xwin.so
```

The `lib/cmake` directory contains file necessary for using plplot with CMake. The contents of this dir are given below. 

```sh
├── export_csirocsa.cmake
├── export_csirocsa-release.cmake
├── export_mem.cmake
├── export_mem-release.cmake
├── export_ntk.cmake
├── export_ntk-release.cmake
├── export_null.cmake
├── export_null-release.cmake
├── export_plfortrandemolib.cmake
├── export_plfortrandemolib-release.cmake
├── export_plplot.cmake
├── export_plplotcxx.cmake
├── export_plplotcxx-release.cmake
├── export_plplotfortran.cmake
├── export_plplotfortran-release.cmake
├── export_plplotqt.cmake
├── export_plplotqt-release.cmake
├── export_plplot-release.cmake
├── export_plplottcltk.cmake
├── export_plplottcltk_Main.cmake
├── export_plplottcltk_Main-release.cmake
├── export_plplottcltk-release.cmake
├── export_plserver.cmake
├── export_plserver-release.cmake
├── export_pltcl.cmake
├── export_pltcl-release.cmake
├── export_pltek.cmake
├── export_pltek-release.cmake
├── export_ps.cmake
├── export_ps-release.cmake
├── export_qsastime.cmake
├── export_qsastime-release.cmake
├── export_qt.cmake
├── export_qt-release.cmake
├── export_svg.cmake
├── export_svg-release.cmake
├── export_tclmatrix.cmake
├── export_tclmatrix-release.cmake
├── export_tk.cmake
├── export_tk-release.cmake
├── export_tkwin.cmake
├── export_tkwin-release.cmake
├── export_xfig.cmake
├── export_xfig-release.cmake
├── export_xwin.cmake
├── export_xwin-release.cmake
├── plplotConfig.cmake
├── plplotConfigVersion.cmake
└── plplot_exports.cmake
```

The `lib/pkgconfig` directory contains files necessary for finding plplot using pkgconfig in CMake prokects. The contents of this dir are given below. 

```sh
├── plplot-c++.pc
├── plplot-fortran.pc
├── plplot.pc
├── plplot-qt.pc
├── plplot-tcl_Main.pc
└── plplot-tcl.pc
```

The `lib/fortran/modules/plplot` directory contains fortran module files as shown below.

```sh
├── plfortrandemolib.mod
├── plplot_double.mod
├── plplot_graphics.mod
├── plplot.mod
├── plplot_private_exposed.mod
├── plplot_private_utilities.mod
├── plplot_single.mod
└── plplot_types.mod
```

contents of `/share`

```sh
.
├── examples
├── ss
└── tcl
```

After a successful build open your `.bashrc` or `.zshrc` and add following lines to it

```sh
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:${EASIFEM_EXTPKGS}/lib/pkgconfig"
```

and then in the terminal run

```sh
source ~/.bashrc
```
 
or

```sh
source ~/.zshrc 
```