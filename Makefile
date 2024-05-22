.PHONY: dev
dev:
	wrangler dev --ip 0.0.0.0

.PHONY: build
build:
	go run github.com/syumai/workers/cmd/workers-assets-gen@latest
	tinygo build -o ./build/app.wasm -target wasm ./...

.PHONY: deploy
deploy:
	wrangler deploy
