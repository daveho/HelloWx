# Compile the wxWidgets "Hello, World" sample program
# using the i686-w64-mingw32-g++ cross-compiler under cygwin.
# TODO: use wx-config-3.0

MINGW = /usr/i686-w64-mingw32/sys-root/mingw
WX_INC = -I$(MINGW)/lib/wx/include/i686-w64-mingw32-msw-unicode-static-3.0 \
	-I$(MINGW)/include/wx-3.0

CXX = i686-w64-mingw32-g++

WX_LDFLAGS =  -static-libgcc -static-libstdc++ -L$(MINGW)/lib

CXXFLAGS = $(WX_INC) -g -Wall
#CXXFLAGS = -g -Wall

%.o : %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $*.o

all : Hello.exe

Hello.exe : Hello.o
	$(CXX) -o $@ Hello.o $(WX_LDFLAGS) -lwx_baseu-3.0-i686-w64-mingw32 -lwx_mswu_core-3.0-i686-w64-mingw32 -lmingw32

clean :
	rm -f *.o
