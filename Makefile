REPO := $(notdir $(realpath .))

SERVER = doge.stanford.edu
gitdir = /home/giovanni/cs294s/$(REPO).git
workdir = /var/www/html/cs294s/$(REPO)

push:
	git push $(SERVER):$(gitdir) master

receive:
	git fetch origin
	git reset --hard $(HEAD)
	git clean -fdx
	make all

update: push
	ssh $(SERVER) make -C $(workdir) receive HEAD=$(shell git rev-parse HEAD)

all:
	@:
