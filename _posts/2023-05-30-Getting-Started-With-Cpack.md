---
title: 'Getting started with Cpack'
tags: [Cpack, Cmake, Packaging]
style: border
color: primary
description: This post explains basics of Cpack, a packaging tool by Cmake.
---

# Cpack

## What is packaging?

Packaging is the process of generating and populating a directory structure that contains everything a third-party project will need to use our code.  The following terms will be used:

- **Source Tree**, File system location of the project source code.
- **Build Tree**, File system location where the actual building and linking of code occurs.
- **Install Tree**, File system location where the packaging happens. After build process, the files are moved from build-tree to install-tree.
- **Package**, Contents of install tree. 
- **Target**, binaries, object files, module file, header-files which are kept in install tree.

## Introduction to Cpack

We may need packaging in following situations: 

1. Sometimes, the user of our program may not want to build the software in to install it. 
2. Our program may be closed source
3. The program may take a long time to compile
4. The users may not have the skill or the tools to build the application. 

In above-mentioned cases, we may want to build the software on one machine, and then move the install tree to a different machine. 

One of the ways to do this task is to use the DESTDIR environment variable to install the software into a temporary location, then to tar or zip up that directory and move it to another machine. However, this approach is not portable to different OS. 

Another more powerful approach is to use CPack, which is already included in CMake. 

- CPack is a tool for creating the installers and packages for projects. 
- CPack can create two basic types of packages, source and binary. 
- *Cpack provides a single interface to a variety of tools.* Currently, CPack supports the following:
  - The creation of Windows installers using NullSoft installer NSIS or WiX
  - Mac OS X PackageMaker tool
  - OS X Drag and Drop
  - OS X X11 Drag and Drop
  - Cygwin Setup packages
  - Debian packages
  - RPMs
  - .tar.gz
  - .sh (self extracting .tar.gz files)
  - and .zip compressed files. 
- For each type of packaging tool supported, there is a CPack generator written in C++ that is used to run the native tool and create the package. 
- For simple tar based packages, CPack includes a library version of tar and does not require tar to be installed on the system.
- For many of the other installers, native tools must be present for CPack to function.

With source packages, CPack makes a copy of the source tree and creates a zip or tar file. 

For binary packages, the use of CPack is tied to the install commands working correctly for a project. When setting up install commands, the first step is to make sure the files go into the correct directory structure with the correct permissions. The next step is to make sure the software is relocatable and can run in an installed tree. CPack installs the software into a temporary directory, and copies the install tree into the format of the native packaging tool. Once the install commands have been added to a project, enabling CPack in the simplest case is done by including the CPack.cmake file into the project.

## Simple example

The most basic CPack project would look like this

```cmake
CMAKE_MINIMUM_REQUIRED(VERSION 3.20.0 FATAL_ERROR)
SET(PROJECT_NAME "helloWorld")
SET(PROJECT_SRC_PATH "./")
PROJECT(${PROJECT_NAME})
ENABLE_LANGUAGE(Fortran)
SET(TARGET_NAME ${PROJECT_NAME})
ADD_EXECUTABLE(${TARGET_NAME} main.F90)
INSTALL(TARGETS ${TARGET_NAME} RUNTIME DESTINATION bin)
INCLUDE(CPack)
```

- In the `helloWorld` project, an executable is created and installed into the directory bin. 
- Then the CPack file is included by the project. 
- At this point project `helloWorld` will have CPack enabled. 
- To run CPack for `helloWorld`, we first build the project as usual. 
- CPack adds several targets to the generated project. These targets in Makefiles are `package` and `package_source`, and PACKAGE in Visual Studio and Xcode. 
- For example, to build a source and binary package for helloWorld using a Makefile generator we  run the following commands:

```bash
mkdir build
cd build
cmake ..
make
make package
make package_source
```

This would create a source zip file called `helloWorld-0.1.1-Source.zip`, a NSIS installer called `helloWorld-0.1.1-win32.exe`, and a binary zip file `helloWorld-0.1.1-win32.zip`. The same thing could be done using the CPack command line.

```bash
cd build
cpack --config CPackConfig.cmake
cpack --config CPackSourceConfig.cmake
```

## Some explanation

When the `include(CPack)` command is executed, the `CPack.cmake` file is included into the project. By default this will use the [`configure_file`](https://cmake.org/cmake/help/latest/command/configure_file.html#command:configure_file "(in CMake v3.26.0)") command to create `CPackConfig.cmake` and `CPackSourceConfig.cmake` in the binary tree of the project. These files contain a series of set commands that set variables for use when CPack is run during the packaging step. The names of the files that are configured by the `CPack.cmake` file can be customized with these two variables; `CPACK_OUTPUT_CONFIG_FILE` which defaults to `CPackConfig.cmake` and `CPACK_SOURCE_OUTPUT_CONFIG_FILE` which defaults to `CPackSourceConfig.cmake`.

If the project contains the file `CPackConfig.cmake.in` in the top level of the source tree, that file will be used instead of the file in the Templates directory. If the project contains the file `CPackSourceConfig.cmake.in`, then that file will be used for the creation of `CPackSourceConfig.cmake`.

### CPack Source Packages

Source packages in CPack simply copy the entire source tree for a project into a package file. Out of source builds should be used to avoid having extra binary stuff polluting the source package. If you have files or directories in your source tree that are not wanted in the source package, you can use the variable [`CPACK_SOURCE_IGNORE_FILES`](https://cmake.org/cmake/help/latest/module/CPack.html#variable:CPACK_SOURCE_IGNORE_FILES "(in CMake v3.26.0)") to exclude things from the package. This variable contains a list of regular expressions. Any file or directory that matches a regular expression in that list will be excluded from the sources. The default setting is as follows:

```bash
"/CVS/;/\\\\\\\\.svn/;\\\\\\\\.swp$;\\\\\\\\.#;/#"
```

There are many levels of escapes used in the default value as this variable is parsed by CMake once and CPack again. It is important to realize that the source tree will not use any install commands, it will simply copy the entire source tree minus the files it is told to ignore into the package.

 To avoid the multiple levels of escape, the file referenced by [`CPACK_PROJECT_CONFIG_FILE`](https://cmake.org/cmake/help/latest/module/CPack.html#variable:CPACK_PROJECT_CONFIG_FILE "(in CMake v3.26.0)") should be used to set this variable. The expression is a regular expression and not a wild card statement.

### CPack and DESTDIR

By default CPack does not use the [`DESTDIR`](https://cmake.org/cmake/help/latest/envvar/DESTDIR.html#envvar:DESTDIR "(in CMake v3.26.0)") option during the installation phase. Instead it sets the [`CMAKE_INSTALL_PREFIX`](https://cmake.org/cmake/help/latest/variable/CMAKE_INSTALL_PREFIX.html#variable:CMAKE_INSTALL_PREFIX "(in CMake v3.26.0)") to the full path of the temporary directory being used by CPack to stage the install package. 

This can be changed by setting [`CPACK_SET_DESTDIR`](https://cmake.org/cmake/help/latest/variable/CPACK_SET_DESTDIR.html#variable:CPACK_SET_DESTDIR "(in CMake v3.26.0)") to on. If the [`CPACK_SET_DESTDIR`](https://cmake.org/cmake/help/latest/variable/CPACK_SET_DESTDIR.html#variable:CPACK_SET_DESTDIR "(in CMake v3.26.0)") option is on, CPack will use the project’s cache value for `CPACK_INSTALL_PREFIX`, and set [`DESTDIR`](https://cmake.org/cmake/help/latest/envvar/DESTDIR.html#envvar:DESTDIR "(in CMake v3.26.0)") to the temporary staging area. This allows absolute paths to be installed under the temporary directory. Relative paths are installed into `DESTDIR/${project's CMAKE_INSTALL_PREFIX}` where [`DESTDIR`](https://cmake.org/cmake/help/latest/envvar/DESTDIR.html#envvar:DESTDIR "(in CMake v3.26.0)") is set to the temporary staging area.

As noted earlier, the [`DESTDIR`](https://cmake.org/cmake/help/latest/envvar/DESTDIR.html#envvar:DESTDIR "(in CMake v3.26.0)") approach does not work when the install rules reference files by Windows full paths beginning with drive letters `(C:/)`.

When doing a non-[`DESTDIR`](https://cmake.org/cmake/help/latest/envvar/DESTDIR.html#envvar:DESTDIR "(in CMake v3.26.0)") install for packaging, which is the default, any absolute paths are installed into absolute directories, and not into the package. 
Therefore, projects that do not use the [`DESTDIR`](https://cmake.org/cmake/help/latest/envvar/DESTDIR.html#envvar:DESTDIR "(in CMake v3.26.0)") option, must not use any absolute paths in install rules. 
Conversely, projects that use absolute paths, must use the [`DESTDIR`](https://cmake.org/cmake/help/latest/envvar/DESTDIR.html#envvar:DESTDIR "(in CMake v3.26.0)") option.

One other variable can be used to control the root path projects are installed into, the [`CPACK_PACKAGING_INSTALL_PREFIX`](https://cmake.org/cmake/help/latest/variable/CPACK_PACKAGING_INSTALL_PREFIX.html#variable:CPACK_PACKAGING_INSTALL_PREFIX "(in CMake v3.26.0)"). By default many of the generators install into the directory `/usr`. That variable can be used to change that to any directory, including just `/`.

## Adding Custom CPack Options

- To avoid the escaping problem a project specific CPack configure file can be specified. 
- This file will be loaded by CPack after `CPackConfig.cmake` or `CPackSourceConfig.cmake` is loaded, and [`CPACK_GENERATOR`](https://cmake.org/cmake/help/latest/module/CPack.html#variable:CPACK_GENERATOR "(in CMake v3.26.0)") will be set to the CPack generator being run. 
- Variables set in this file only require one level of CMake escapes. 
- This file can be configured or not, and contains regular CMake code. 
- In the example above, you could move `CPACK_FOOBAR` into a file `MyCPackOptions.cmake.in` and configure that file into the build tree of the project. Then set the project configuration file path like this:

## CPack for Debian Packages

A Debian package `.deb` is simply an “ar” archive. 
CPack includes the code for the BSD style `ar` that is required by Debian packages. 
The Debian packager uses the standard set of CPack variables to initialize a set of Debian specific variables. 
These can be overridden in the `CPACK_PROJECT_CONFIG_FILE`; the name of the generator is “DEB”. 
The variables used by the DEB generator are as follows:

- **CPACK_DEBIAN_PACKAGE_NAME**, defaults to lower case of `CPACK_PACKAGE_NAME`.
- **CPACK_DEBIAN_PACKAGE_ARCHITECTURE**, defaults to `i386`.
- **CPACK_DEBIAN_PACKAGE_DEPENDS**, This must be set to other packages that this package depends on, and if empty a warning is emitted.
- **CPACK_DEBIAN_PACKAGE_MAINTAINER**, defaults to value of `CPACK_PACKAGE_CONTACT`
- **CPACK_DEBIAN_PACKAGE_DESCRIPTION**, defaults to value of `CPACK_PACKAGE_DESCRIPTION_SUMMARY`
- **CPACK_DEBIAN_PACKAGE_SECTION**, defaults to `devl`
- **CPACK_DEBIAN_PACKAGE_PRIORITY**, defaults to `optional`

## CPack for RPM

CPack has support for creating Linux RPM files. The name of the generator as set in `CPACK_GENERATOR` is “RPM”. The RPM package capability requires that `rpmbuild` is installed on the machine and is in PATH. The RPM packager uses the standard set of CPack variables to initialize RPM specific variables. The RPM specific variables are as follows:

- **CPACK_RPM_PACKAGE_SUMMARY** defaults to value of `CPACK_PACKAGE_DESCRIPTION_SUMMARY`.
- **CPACK_RPM_PACKAGE_NAME**, defaults to lower case of `CPACK_PACKAGE_NAME`.
- **CPACK_RPM_PACKAGE_VERSION**, defaults to value of `CPACK_PACKAGE_VERSION`.
- **CPACK_RPM_PACKAGE_ARCHITECTURE**, defaults to `i386`.
- **CPACK_RPM_PACKAGE_RELEASE**, defaults to `1`. This is the version of the RPM file, not the version of the software being packaged.
- **CPACK_RPM_PACKAGE_GROUP**, defaults to `none`.
- **CPACK_RPM_PACKAGE_VENDOR**, defaults to value of `CPACK_PACKAGE_VENDOR`.

## Target packages and package_source

If CMake is run with the Makefile, Ninja, or Xcode generator, then `include(CPack)` generates a target `package`. 
This makes it possible to build a binary installer from CMake, Make, or Ninja: Instead of `cpack`, one may call `cmake --build . --target package` or `make package` or `ninja package`. 
The VS generator creates an uppercase target `PACKAGE`.

```bash
cmake --build . --target package
# or
make package
# or
ninja package
```

If CMake is run with the Makefile or Ninja generator, then `include(CPack)` also generates a target `package_source`. 
To build a source package, instead of `cpack -G TGZ --config CPackSourceConfig.cmake` one may call 

```bash
cmake --build . --target package_source
# or
make package_source
# or
ninja package_source
```

## CPackComponent

Certain binary installers (especially the graphical installers) generated by CPack allow users to select individual application _components_ to install. This module allows developers to configure the packaging of such components.

Certain kinds of binary installers can be configured such that users can select individual application components to install. See the [`CPackComponent`](https://cmake.org/cmake/help/latest/module/CPackComponent.html#module:CPackComponent "CPackComponent") module for further details.


## Commands

Step-1: Configure
Step-2: Build

Method:1

```bash
cmake --build build/dir/path --target package
cmake --build build/dir/path --target package_source
```

Method:2

```bash
cpack --config CPackConfig.cmake
cpack --config CPackSourceConfig.cmake
```

## References

https://decovar.dev/blog/2021/09/23/cmake-cpack-package-deb-apt/
