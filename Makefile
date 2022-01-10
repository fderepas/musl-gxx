
default :
	./build.sh

# not PHONY
fastcgipp-master :
	wget https://github.com/eddic/fastcgipp/archive/refs/heads/master.zip
	unzip master.zip
	rm master.zip

# not PHONY
mariadb-connector-c:
	git clone https://github.com/mariadb-corporation/mariadb-connector-c.git

.PHONY:dl
dl : fastcgipp-master mariadb-connector-c

clean :
	rm -rf fastcgipp-master mariadb-connector-c *~
