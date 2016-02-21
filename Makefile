## Makefile -- regenerate the bootstrap script
## Written by Gary V. Vaughan, 2014
##
## This is free software.  There is NO warranty; not even for
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
##
## Copyright (C) 2010-2016 Bootstrap Authors
##
## This file is dual licensed under the terms of the MIT license
## <https://opensource.org/license/MIT>, and GPL version 2 or later
## <http://www.gnu.org/licenses/gpl-2.0.html>.  You must apply one of
## these licenses when using or redistributing this software or any of
## the files within it.  See the URLs above, or the file `LICENSE`
## included in the Bootstrap distribution for the full license texts.
##
## Please report bugs or propose patches to:
## <https://github.com/gnulib-modules/bootstrap/issues>
#####

build_aux	= build-aux

inline_source = $(build_aux)/inline-source
bootstrap_in  = $(build_aux)/bootstrap.in

prog_SCRIPTS = bootstrap

bootstrap_SOURCES =			\
	$(bootstrap_in)			\
	$(build_aux)/extract-trace	\
	$(build_aux)/funclib.sh		\
	$(build_aux)/options-parser	\
	$(NOTHING_ELSE)

all: $(prog_SCRIPTS)

bootstrap: $(bootstrap_SOURCES)
	'$(inline_source)' '$(bootstrap_in)' > '$@'
