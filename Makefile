# Compile the wxWidgets "Hello, World" sample program
# using the i686-w64-mingw32-g++ cross-compiler under cygwin.
#
# This makefile was written by David Hovemeyer <david.hovemeyer@gmail.com>
# and is placed in the public domain.  Please use it however you see fit.

# Path to wx-config-3.0
WX_CONFIG = /usr/i686-w64-mingw32/sys-root/mingw/bin/wx-config-3.0

# Options to pass to wx-config-3.0
WX_CONFIG_OPTS = --unicode --static

# Which wxWindows libraries to use
WX_LIBS := base,core

# Compiler and linker flags to use
WX_CXXFLAGS := $(shell $(WX_CONFIG) $(WX_CONFIG_OPTS) --cxxflags)
WX_LDFLAGS := -static-libgcc -static-libstdc++ $(shell $(WX_CONFIG) $(WX_CONFIG_OPTS) --libs $(WX_LIBS))

# C++ compiler to use
CXX := $(shell $(WX_CONFIG) $(WX_CONFIG_OPTS) --cxx)

# Full C++ compiler flags
CXXFLAGS = $(WX_CXXFLAGS) -g -Wall

# Rule to compile C++ code
%.o : %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $*.o

all : Hello.exe

# Link the .exe file.
# Note that despite using the --static flag, it will depend
# on DLLs in /usr/i686-w64-mingw32/sys-root/mingw/bin,
# so you'll need to run it using the command
#
#   PATH=/usr/i686-w64-mingw32/sys-root/mingw/bin:$PATH ./Hello.exe
#
Hello.exe : Hello.o
	$(CXX) -o $@ Hello.o $(WX_LDFLAGS)

clean :
	rm -f *.o Hello.exe
