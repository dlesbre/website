color = on

jekyll = bundle exec jekyll

CHECKER = tidy -eq --drop-empty-elements no --fix-style-tags no

SSH = dlesbre@phare.normalesup.org:WWW/

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
build: ## Build the website
	$(jekyll) build

.PHONY: clean
clean: ## Remove the site generated files
	$(jekyll) clean

.PHONY: check
check: build  ## Verify HTML files using tidy
	find _site \( -name '*.html' -or -name '*.html.en' -or -name '*.html.fr' \) \
	  -exec bash -c "echo \"{}:\" && cat \"{}\" | $(CHECKER)" ';'

.PHONY: deploy
deploy: clean build ## Rebuild and rsync website
	echo "$(color_yellow)Deploying to online$(color_reset)"
	rsync -rv ./_site/ "$(SSH)"

.PHONY: help
help: ## Show this help
	echo "$(color_yellow)make:$(color_reset) useful targets:"
	egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(color_orange)%-10s$(color_reset) %s\n", $$1, $$2}'
