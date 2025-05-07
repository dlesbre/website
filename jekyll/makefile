color = on

jekyll = bundle exec jekyll

# ==============================================================================
# makefile code and variable setting
# ==============================================================================

ifeq ($(color),on)
	# Bold orange text
	color_yellow = \033[33;1m
	color_orange = \033[33m
	color_reset  = \033[38;22m
else
	color_yellow=
	color_reset=
endif

# ==============================================================================
# Default target
# ==============================================================================

default: serve
.PHONY: default

# ==============================================================================
# Targets
# ==============================================================================

# Disable command output unless VERBOSE is set
$(VERBOSE).SILENT:

.PHONY: serve
serve: ## Serve a development version of the site
	$(jekyll) serve --livereload --trace

.PHONY: build
build: ## Remove the site generated files
	$(jekyll) build

.PHONY: clean
clean: ## Remove the site generated files
	$(jekyll) clean
