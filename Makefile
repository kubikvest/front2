NODE_MODULES_DIR = node_modules

$(NODE_MODULES_DIR): package.json
	@docker run --rm \
		-v $(CURDIR):/data \
		-w /data \
		node:6.6.0 \
		npm install

dep: $(NODE_MODULES_DIR)

start: dep
	@docker run --rm -it \
		-v $(CURDIR):/data \
		-w /data \
		-p 9020:9020 \
		node:6.6.0 \
		npm run start

build: dep
	@docker run --rm -it \
		-v $(CURDIR):/data \
		-w /data \
		-p 9020:9020 \
		node:6.6.0 \
		npm run build

test:
	@echo Tests...
