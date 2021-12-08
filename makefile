# =============================
# Variables
# =============================

color = on
local = false

SRC = htmls
WWW = www

PPROC = pproc
CP = cp -r
CHECKER = tidy -eq -config .tidy-config

URL = https://www.eleves.ens.fr/home/dlesbre
ALT_URL = https://www.eleves.ens.fr/~dlesbre

HTMLS = \
	index.html \
	cv.html \
	fichiers.html \

SSH = dlesbre@sas.eleves.ens.fr:www/

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
	PP = $(PPROC) "-DURL=$(URL)" "-DALT_URL=$(ALT_URL)" -Ddefaultlang=fr -DDEBUG
else
	PP = $(PPROC) "-DURL=$(URL)" "-DALT_URL=$(ALT_URL)" -Ddefaultlang=fr -DRELEASE
endif

HTML_SOURCES = $(addprefix $(SRC)/, $(HTMLS))
HTML_TARGETS = $(addprefix $(WWW)/, $(addsuffix .en, $(HTMLS)) $(addsuffix .fr, $(HTMLS)))

TARGETS = $(WWW)/sitemap.xml $(HTML_TARGETS)

# =============================
# Default target
# =============================

default:

# =============================
# General rules
# =============================

$(WWW)/%.html.fr: $(SRC)/%.html $(SRC)/base.html $(SRC)/formatter.html
	echo "$(color_yellow)Rendering $@$(color_reset)"
	$(PP) -DLANG=FR -o $@ $<
	$(CHECKER) $@

$(WWW)/%.html.en: $(SRC)/%.html $(SRC)/base.html $(SRC)/formatter.html
	echo "$(color_yellow)Rendering $@$(color_reset)"
	$(PP) -DLANG=EN -o $@ $<
	$(CHECKER) $@

$(WWW)/sitemap.xml: sitemap.xml
	echo "$(color_yellow)Rendering $@$(color_reset)"
	$(PP) -o $@ $<
	$(CHECKER) -xml $@

# =============================
# Special Targets
# =============================

# No display of executed commands.
$(VERBOSE).SILENT:

.PHONY: all clean default firefox chromium sync

default: all
all: $(TARGETS) ## Build everything

firefox: all ## Build and open in firefox
	echo "$(color_yellow)Opening in firefox$(color_reset)"
	firefox $(WWW)/index.html &

chromium: all ## Build and open in chromium
	echo "$(color_yellow)Opening in chromium$(color_reset)"
	chromium $(WWW)/index.html &

clean: ## Remove generated files
	echo "$(color_yellow)Removing html files$(color_reset)"
	rm -rf $(TARGETS)

ifeq ($(local),true)
deploy:
	echo "$(color_yellow)ERROR : Should not deploy in local mode$(color_reset)"
else
deploy: clean all ## Rebuild and rsync website
	echo "$(color_yellow)Deploying to online$(color_reset)"
	rsync -rv ./www/ "$(SSH)"
endif

help: ## Show this help
	echo "$(color_yellow)make:$(color_reset) usefull targets:"
	egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(color_orange)%-10s$(color_reset) %s\n", $$1, $$2}'
