# LTK-Tablelist

## Usage

## Installation

### Installation of LTK - a Lisp binding to the Tk toolkit by Peter Herth

[www.peter-herth.de](http://www.peter-herth.de/ltk/ltkdoc/ltkdoc.html)

Tk is a graphics toolkit for the tcl programming language developed by John
Ousterhout. Initially developed for the X-Window system, it has been ported to a
wide selection of operating systems, including Windows and MacOs. Due to ist
ubiquous nature, its an ideal candidate to write a portable GUI library for
Lisp. 

Ltk supports the following Lisp systems: Allegro, CMUCL, CLisp, ECL, LispWorks,
OpenMCL, SBCL. Ltk was successfully tested using Lispworks, CLisp, CMUCL, SBCL
under Linux and Lispworks, CLisp, and SBCL using Mac OS X, CLisp, Allegro and
Lispworks using Windows.

Ltk can be installed by Quicklisp

`(ql:quickload "ltk")`

### Installation of Tablelist - The Multi-Column Listbox by Csaba Nemethi

[www.nemethi.de](http://www.nemethi.de)

Install the package as a subdirectory of one of the directories given by the
auto\_path variable. For example, you can install it as a directory at the same
level as the Tcl and Tk script libraries. The locations of these library
directories are given by the tcl\_library and tk\_library variables, respectively.

`puts $auto_path`

For instance, the package could be installed at

`/Users/ulrivo/Library/Tcl/`

with

`tar -zxf tablelist6.11.tar.gz`

In directory 

`/Users/ulrivo/Library/Tcl/tablelist6.11/demos`

start *wish* and do

`source dirViewer.tcl`




