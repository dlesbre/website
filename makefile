# =============================
# Variables
# =============================

color = on
local = true

SRC = ./htmls
WWW = ./www
PPROC = pproc
CP = cp -r

HTMLS = \
	index.html \
	cv.html \
	fichiers.html \

# =============================
# makefile code and variable setting
# =============================

ifeq ($(color),on)
	# Bold orange text
	color_s=\033[33;1m
	color_e=\033[38;22m
else
	color_s=
	color_e=
endif

ifeq ($(local),true)
	URL = $(shell pwd)/$(WWW)/
	PP = $(PPROC) "-DURL=$(URL)"
else
	PP = $(PPROC)
endif

en = $(WWW)/en
fr = $(WWW)/fr

HTML_SOURCES = $(addprefix $(SRC)/, $(HTMLS))
HTML_TARGETS = $(WWW)/index.html $(addprefix $(en)/, $(HTMLS)) $(addprefix $(fr)/, $(HTMLS))

DIRS = $(en) $(fr)

# =============================
# Default target
# =============================

default:

# =============================
# General rules
# =============================

$(fr)/%.html: $(SRC)/%.html $(SRC)/base.html | dirs
	echo "$(color_s)Rendering $@$(color_e)"
	$(PP) -DLANG=FR -o $@ $<

$(en)/%.html: $(SRC)/%.html $(SRC)/base.html | dirs
	echo "$(color_s)Rendering $@$(color_e)"
	$(PP) -DLANG=EN -o $@ $<

$(WWW)/index.html: $(SRC)/redirect.html
	echo "$(color_s)Rendering $@$(color_e)"
	$(PP) -o $@ $<

# =============================
# Specific rules
# =============================

$(DIRS):
	echo "$(color_s)Making build directories$(color_e)"
	mkdir -p $(DIRS)

# =============================
# Special Targets
# =============================

# No display of executed commands.
$(VERBOSE).SILENT:

.PHONY: all clean dirs default firefox chromium

default: all
dirs: $(DIRS)
all: $(HTML_TARGETS) $(COPY_TARGETS) | dirs

firefox: all
	echo "$(color_s)Opening in firefox$(color_e)"
	firefox $(WWW)/index.html &

chromium: all
	echo "$(color_s)Opening in firefox$(color_e)"
	chromium $(WWW)/index.html &

clean:
	echo "$(color_s)Removing html files$(color_e)"
	rm -rf $(WWW)/index.html $(en) $(fr)
