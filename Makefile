PROJECTNAME=$(shell basename "$(PWD)")

GOBASE=$(shell pwd)
GOBIN=$(GOBASE)/bin

install:
	go mod download

build:
	go build -o $(GOBIN)/$(PROJECTNAME) ./cmd/$(PROJECTNAME)/main.go || exit
	./bin/godiscourse

production:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o $(GOBIN)/$(PROJECTNAME) ./cmd/$(PROJECTNAME)/main.go
