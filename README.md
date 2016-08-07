# Compile wxWidgets "Hello World" for Windows using Cygwin

Cygwin includes a cross compiler (i686-w64-mingw32-g++) capable of producing native Windows binaries.  It also includes a complete precompiled version of wxWidgets 3.0.  This makes Cygwin, in my opinion, *by far* the best way to build wxWidgets programs for Windows.  Here's why: if you want to use MinGW (possibly with MSYS), you'll need to compile wxWidgets from source.  Trust me when I tell you that this is a time-consuming and frustrating experience.  Using Cygwin, you could be building a native Windows GUI program in the next few minutes.

Anyway, just make sure that the following Cygwin packages are installed:

* mingw64-i686-gcc-core
* mingw64-i686-gcc-g++
* mingw64-i686-wxWidgets3.0

You could install the `mingw64-x86_64-` variants of these packages if you want to build 64 bit programs, but I didn't try this.

Next, run the commands

    make

to build `Hello.exe` and

    PATH=/usr/i686-w64-mingw32/sys-root/mingw/bin:$PATH ./Hello.exe

to run it. That's it!  (The path thing is because there are some DLLs needed.)

## License

I don't know what license the "Hello World" program is under, but I found it here: <http://docs.wxwidgets.org/trunk/overview_helloworld.html>.

The Makefile (which I wrote) is public domain.  Please use it however you see fit.
