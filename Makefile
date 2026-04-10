.PHONY: init build clean

init:
	@if [ ! -d jgrc2023/.git ]; then \
		git clone https://github.com/roppongiexpress/rxjgrc2023.git jgrc2023; \
	else \
		cd jgrc2023 && git pull; \
	fi
	@if [ ! -d jgrc2020/.git ]; then \
		git clone --recursive https://github.com/roppongiexpress/rxjgrc2020.git jgrc2020; \
	else \
		cd jgrc2020 && git pull; \
	fi

build: init
	docker build -t rxjgrc-builder .
	rm -rf docs
	mkdir -p docs
	docker run --rm -v "$$(pwd)/docs:/output" rxjgrc-builder
	touch docs/.nojekyll

clean:
	rm -rf jgrc2020 jgrc2023
	docker rmi rxjgrc-builder 2>/dev/null || true
