BOOTSTRAP
=========

Run all the Autotools scripts in a sane order according to the contents
of `configure.ac` (or `configure.in`) and `Makefile.am` (if any).

This is a complete rewrite of the [GNU Gnulib][] `bootstrap` script, for
figuring out what autotools need to be run, in what order, and with what
arguments to bootstrap a newly checked out working copy. This version is
much more robust, a lot more user friendly, slightly faster, and a little
more portable than the GNU version.  It's also quite a lot larger than
the GNU implementation.

The original idea behind the rewrite is that the incumbent Gnulib
implementation was not flexible enough to bootstrap either of GNU M4,
nor GNU Libtool - and rather than copying and editing the upstream
version and merging changes back downstream as bugs were found and
squashed, I decided the neighbourly thing to do would be to rewrite the
whole messy thing with it's accreted features and piecemeal merges from
other projects with scriptable extensibility designed in from the
outset.

This version was never merged back into gnulib proper, where the feature
accreted incumbent script still resides (albeit carrying fixes to many of
the outright bugs and misfeatures fixed by this version).  However, I've
found this version considerably more reliable, and infinitely more
malleable when it comes to extending the existing functionality for the
unusual requirements of other projects that the Gnulib `bootstrap` cannot
handle.  It is very widely deployed, and extremely well tested in all of
my own projects, and many others besides.

Thanks
------

My sincere thanks to Bruno Haible, Jim Meyering and Paul Eggert on the
gnulib developers list for encouragement and input during the design and
implementation stages.

Usage
-----

There are two ways to incorporate this bootstrap into your own projects:

1. If your project already uses [GNU Gnulib], then you can add this
   entire repository as a submodule in the `gl` directory, and use that
   as an override directory by setting `local_gl_path=gl`, and adding
   `bootstrap` to `gnulib_modules` in your project's `bootstrap.conf`.

   Initialise your actual bootstrap script from the subproject with:

      gl/build-aux/inline-source gl/build-aux/bootstrap.in > bootstrap

   The resulting script will then keep track of changes to the
   subproject and warn you of upstream changes.

2. You can simply copy the top-level `bootstrap` script (which is
   pregenerated whenever the constituent scripts are updated) directly
   into the top-level directory of your project, and update it manually
   whenever necessary.

Either way, once you have installed `bootstrap`, use it to run the
appropriate project-specific autotools and customisations with
`./bootstrap`.

You can customize the behaviour of this script with a `bootstrap.conf` file,
as described in the `bootstrap.texi` documentation, and the bootstrap
script itself.


[gnu gnulib]: http://gnu.org/s/gnulib
