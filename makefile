# =============================
# Variables
# =============================

color = on
local = false

SRC = htmls
INCLUDES = $(SRC)/includes
WWW = www

PPROC = mlpp
CP = cp -r
CHECKER = tidy -eq -config .tidy-config

URL = https://www.normalesup.org/~dlesbre

# Old website (eleves.ens.fr)
URL_ELEVES = https://www.eleves.ens.fr/home/dlesbre
ALT_URL_ELEVES = https://www.eleves.ens.fr/~dlesbre

HTML = index cv logiciels fichiers legal
HTML_DEPS = base defs formatter
SCSS = style
SCSS_DEPS = variables main links header_footer home timeline table collapsible

SSH = dlesbre@phare.normalesup.org:WWW/
SSH_ELEVES = dlesbre@sas.eleves.ens.fr:www/

SASS = sassc
CSS_DIR = $(WWW)/css/
SCSS_DIR = scss/


# =============================
# makefile code and variable setting
# =============================

ifeq ($(color),on)
	# Bold orange text
	color_yellow = \033[33;1m
	color_orange = \033[33m
	color_reset  = \033[38;22m
else
	color_yellow=
	color_reset=
endif

ifeq ($(local),true)
	URL = $(shell pwd)/$(WWW)
	PP = $(PPROC) "-DURL=$(URL)" "-DALT_URL=$(ALT_URL)" "-DOLD_URL=$(URL_ELEVES)" "-DOLD_ALT=$(ALT_URL_ELEVES)" -DDEBUG
	SASSC = $(SASS)
else
	PP = $(PPROC) "-DURL=$(URL)" "-DALT_URL=$(ALT_URL)" "-DOLD_URL=$(URL_ELEVES)" "-DOLD_ALT=$(ALT_URL_ELEVES)" -DRELEASE
	SASSC = $(SASS) -t compressed
endif

HTMLS = $(addsuffix .html, $(HTML))
HTML_SOURCES = $(addprefix $(SRC)/, $(HTMLS))
HTMLS_DEPS = $(addprefix $(INCLUDES)/, $(addsuffix .html, $(HTML_DEPS)))
HTML_TARGETS = $(addprefix $(WWW)/, $(addsuffix .en, $(HTMLS)) $(addsuffix .fr, $(HTMLS)))

TARGETS = $(WWW)/sitemap.xml $(HTML_TARGETS) $(CSS_FILES)

CSS_FILES = $(addsuffix .css, $(addprefix $(CSS_DIR), $(SCSS)))
SCSS_DEPENDS = $(addsuffix .scss, $(addprefix $(SCSS_DIR), $(SCSS_DEPS)))
SCSS_TARGETS = $(addsuffix .scss, $(addprefix $(SCSS_DIR), $(SCSS)))

# =============================
# Default target
# =============================

default:

# =============================
# General rules
# =============================

$(WWW)/%.html.fr: $(SRC)/%.html $(HTMLS_DEPS)
	echo "$(color_yellow)Rendering $@$(color_reset)"
	$(PP) -DLANG=FR -o $@ $<
	$(CHECKER) $@

$(WWW)/%.html.en: $(SRC)/%.html $(HTMLS_DEPS)
	echo "$(color_yellow)Rendering $@$(color_reset)"
	$(PP) -DLANG=EN -o $@ $<
	$(CHECKER) $@

$(WWW)/sitemap.xml: sitemap.xml
	echo "$(color_yellow)Rendering $@$(color_reset)"
	$(PP) -o $@ $<
	$(CHECKER) -xml $@

$(CSS_DIR)%.css: $(SCSS_DIR)%.scss $(SCSS_DEPENDS)
	echo "$(color_yellow)Compiling scss to $@$(color_reset)"
	$(SASSC) "$<" "$@"

# =============================
# Special Targets
# =============================

# No display of executed commands.
$(VERBOSE).SILENT:

.PHONY: default
default: all

.PHONY: all
all: $(TARGETS) ## Build everything

.PHONY: firefox
firefox: all ## Build and open in firefox
	echo "$(color_yellow)Opening in firefox$(color_reset)"
	firefox "$(shell pwd)/$(WWW)/index.html.fr" &

.PHONY: chromium
chromium: all ## Build and open in chromium
	echo "$(color_yellow)Opening in chromium$(color_reset)"
	chromium "$(shell pwd)/$(WWW)/index.html.fr" &

.PHONY: clean
clean: ## Remove generated files
	echo "$(color_yellow)Removing html files$(color_reset)"
	rm -rf $(TARGETS)

.PHONY: deploy
ifeq ($(local),true)
deploy:
	echo "$(color_yellow)ERROR : Should not deploy in local mode$(color_reset)"
else
deploy: clean all ## Rebuild and rsync website
	echo "$(color_yellow)Deploying to online$(color_reset)"
	rsync -rv ./www/ "$(SSH)"
endif

.PHONY: css
css: $(CSS_FILES) ## (re)build css files from scss

.PHONY: css-watch
css-watch: ## continuously rebuild css files (blocking)
	while [ 0 ]; \
	do \
		$(MAKE) --no-print-directory css; \
		sleep 1; \
	done

.PHONY: help
help: ## Show this help
	echo "$(color_yellow)make:$(color_reset) useful targets:"
	egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(color_orange)%-10s$(color_reset) %s\n", $$1, $$2}'
	echo "Call with $(color_yellow)local=true$(color_reset) to build local links"
