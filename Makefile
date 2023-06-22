all: server

clean:
	@rm -rf *.o
	@rm -rf pico-server

server: main.o httpd.o
	gcc -o pico-server $^

main.o: main.c httpd.h
	gcc -c -o main.o main.c

httpd.o: httpd.c httpd.h
	gcc -c -o httpd.o httpd.c

install:
	install --mode=755 pico-server /usr/sbin
	install --mode=644 pico-server.service /etc/systemd/system

