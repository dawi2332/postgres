GPG=gpg2
DOCKER_USERNAME=dawi2332
DOCKER_NAME=postgres
DOCKER_TAG=$(DOCKER_USERNAME)/$(DOCKER_NAME)

.PHONY=all deps build push clean clean

all:

push: build
	docker push $(DOCKER_TAG)

run: build
	docker run -it --rm $(DOCKER_TAG)

build: deps
	docker build -t $(DOCKER_TAG) .

deps: gosu

gosu:
	wget https://github.com/tianon/gosu/releases/download/1.4/gosu-amd64 https://github.com/tianon/gosu/releases/download/1.4/gosu-amd64.asc
	$(GPG) --verify gosu-amd64.asc gosu-amd64
	mv gosu-amd64 gosu
	rm gosu-amd64.asc
	chmod +x gosu

clean-gosu:
	-rm -f gosu

clean: clean-gosu

