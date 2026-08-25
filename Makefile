DESTDIR ?=

all: pico-server

clean:
	@rm -rf *.o
	@rm -rf pico-server

pico-server: main.o httpd.o
	gcc -o pico-server $^

main.o: main.c httpd.h
	gcc -c -o main.o main.c

httpd.o: httpd.c httpd.h
	gcc -c -o httpd.o httpd.c

install:
	install -d $(DESTDIR)/usr/sbin
	install --mode=755 pico-server $(DESTDIR)/usr/sbin
	install -d $(DESTDIR)/usr/lib/systemd/system
	install --mode=644 pico-server.service $(DESTDIR)/usr/lib/systemd/system
