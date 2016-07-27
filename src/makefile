CC=g++
IGLIB=$(shell pkg-config --cflags glib-2.0)
LGLIB=$(shell pkg-config --libs glib-2.0)
CFLAGS=-O3 -Wno-write-strings
SOURCES := $(shell find . -type f -name *.c)
OBJECTS := $(SOURCES:.c=.o)
DEPS := $(OBJECTS:.o=.deps)
 
t_coffee: $(OBJECTS)
	@echo " Linking..."; $(CC) $(LGLIB) $^ -o t_coffee -lm
 
%.o: %.c
	@echo " CC $<"; $(CC) $(IGLIB) $(CFLAGS) -I. -MD -MF $(@:.o=.deps) -c -o $@ $<

clean:
	@echo " Cleaning..." 
	`find . -name *.o | xargs rm -rf {}`