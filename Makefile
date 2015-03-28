REPO := $(notdir $(realpath .))

SERVER = doge.stanford.edu
gitdir = ~/cs294s/repos/$(REPO)
workdir = \~/cs294s/web/$(REPO)

push:
	git push $(SERVER):$(gitdir) master

receive:
	git fetch origin
	git reset --hard $(HEAD)

update: push
	ssh $(SERVER) make -C $(workdir) receive HEAD=$(shell git rev-parse HEAD)
