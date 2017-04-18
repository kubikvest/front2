NODE_MODULES_DIR = node_modules
NODE_IMG = node:7.8-alpine

$(NODE_MODULES_DIR): package.json
	@docker run --rm \
		-v $(CURDIR):/data \
		-w /data \
		$(NODE_IMG) \
		npm install --quite

dep: $(NODE_MODULES_DIR)

start: dep
	@docker run --rm -it \
		-v $(CURDIR):/data \
		-w /data \
		-p 9020:9020 \
		$(NODE_IMG) \
		npm run start

build: dep
	@docker run --rm -it \
		-v $(CURDIR):/data \
		-w /data \
		-p 9020:9020 \
		$(NODE_IMG) \
		npm run build

clean:
	@docker run --rm -it \
		-v $(CURDIR):/data \
		-w /data \
		$(NODE_IMG) \
		rm -rf node_modules
test:
	@echo Tests...
