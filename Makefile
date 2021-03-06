# quíck and dirty makefile to sipcmd2 to replace autotools - yugh!

CC=g++
CFLAGS=-c -Wall 
LIBS=-lopal -lpt
IFLAGS=-I/usr/include/opal -I/usr/include/ptlib -Isrc/
SOURCES=src/main.cpp src/commands.cpp src/channels.cpp
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=sipcmd2
DEBUG=-g -DDEBUG

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS) 
		$(CC) $(OBJECTS) -o $@ $(LIBS) 

.cpp.o:
		$(CC) $(CFLAGS) $< -o $@ $(IFLAGS) $(DEBUG)

.PHONY: clean

clean:
	rm src/*.o $(EXECUTABLE) > /dev/null 2>&1
