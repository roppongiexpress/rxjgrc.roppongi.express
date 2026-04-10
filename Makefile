.PHONY: init build clean

init:
	git submodule update --init --recursive

build: init
	docker build -t rxjgrc-builder .
	rm -rf docs
	mkdir -p docs
	docker run --rm -v "$$(pwd)/docs:/output" rxjgrc-builder

clean:
	git submodule deinit --all -f 2>/dev/null || true
	docker rmi rxjgrc-builder 2>/dev/null || true
