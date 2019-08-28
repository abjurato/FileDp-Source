SDK=/var/theos/sdks/iPhoneOS10.3.sdk/
CC=clang
AFLAGS= -arch armv7s -Os -Wimplicit
CFLAGS=-isysroot $(SDK)
CFLAGS_IOKIT=$(CFLAGS) -framework IOKit -framework Foundation -framework Security -framework CoreFoundation 

simple: 
	$(CC) main.m -o FileDP $(CFLAGS_IOKIT)

