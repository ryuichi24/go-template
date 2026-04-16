# You can override the default APP or you can pass it in runtime as "make APP=<NAME> <TARGET> 
GO  ?= go
APP ?= tmpcli
OUTPUT_DIR ?= release/bin

define require_app
@ # this "@" symbol is used to suppress the output of the command
@if [ -z "$(APP)" ]; then \
		echo "Error: \"APP\" is not specified. Use: make <target> APP=<name>"; \
		exit 1; \
fi
endef

.PHONY: build run clean test

build:
	@echo "Building app: $(APP)"
	$(require_app)
	$(MAKE) -C apps/$(APP) APP=$(APP) GO=$(GO) OUTPUT_DIR=$(abspath $(OUTPUT_DIR)) build

run:
	@echo "Running app: $(APP)"
	$(require_app)
	$(MAKE) -C apps/$(APP) APP=$(APP) GO=$(GO) run

clean:
	@echo "Cleaning app: $(APP)"
	$(require_app)
	$(MAKE) -C apps/$(APP) APP=$(APP) GO=$(GO) clean

test:
	@echo "Testing app: $(APP)"
	$(require_app)
	$(MAKE) -C apps/$(APP) APP=$(APP) GO=$(GO) test

