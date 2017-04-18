NODE_MODULES_DIR = node_modules
NODE_IMG = node:7.8-alpine

$(NODE_MODULES_DIR): package.json
	@docker run --rm \
		-v $(CURDIR):/data \
		-w /data \
		$(NODE_IMG) \
		npm install --quiet

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

pull_release:
	@touch CNAME;
	@echo "a.kubikvest.xyz" > CNAME
	@git init
	@git config user.name "$(USER_NAME)"
	@git config user.email "$(USER_EMAIL)"
	@git add .
	@git commit -m "deployed to gh-pages"
	@git push --force --quiet "https://$(GH_TOKEN)@github.com/kubikvest/front-release.git" master:master

pull_test:
	@touch CNAME
	@echo "test.kubikvest.xyz" > CNAME
	@git init
	@git config user.name "$(USER_NAME)"
	@git config user.email "$(USER_EMAIL)"
	@git add .
	@git commit -m "deployed to gh-pages"
	@git push --force --quiet "https://$(GH_TOKEN)@github.com/kubikvest/front-test.git" master:master

test:
	@echo Tests...
