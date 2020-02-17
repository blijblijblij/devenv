.PHONY: build

build:
	docker build -t blijblijblij/neovim .

push:
	docker login
	docker push blijblijblij/neovim
