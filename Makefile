REPO := $(notdir $(realpath .))

SERVER = doge.stanford.edu
workdir = cs294s/repos/$(REPO)

push:
	git push origin

receive:
	git fetch origin
	git reset --hard $(HEAD)

update: push
	ssh $(SERVER) make -C $(workdir) HEAD=$(shell git-rev-parse HEAD)
