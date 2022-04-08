# dmenu version
VERSION = 5.1

# paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/man

X11INC = /usr/X11R7/include
X11LIB = /usr/X11R7/lib

# Xinerama, comment if you don't want it
XINERAMALIBS  = -lXinerama
XINERAMAFLAGS = -DXINERAMA

# freetype, modified the Inc for NetBSD
FREETYPELIBS = -lfontconfig -lXft
FREETYPEINC != freetype-config --cflags

# includes and libs
INCS = -I$(X11INC) -I$(FREETYPEINC)
LIBS = -L$(X11LIB) -lX11 $(XINERAMALIBS) $(FREETYPELIBS)

# flags
CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE=700 -D_POSIX_C_SOURCE=200809L -DVERSION=\"$(VERSION)\" $(XINERAMAFLAGS)
CFLAGS   += -std=c99 -pedantic -Wall -Os $(INCS) $(CPPFLAGS)
LDFLAGS  += $(LIBS)

# compiler and linker
CC = gcc
