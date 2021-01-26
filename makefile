# =============================
# Variables
# =============================

color = on
local = true

SRC = .
WWW = ./www
PPROC = pproc
CP = cp -r

HTMLS = \
	index.html \
	cv.html \
	fichiers.html \

COPIES = \
	css/style.css \
	imgs/FR_flag.svg \
	imgs/UK_flag.svg \
	favicon.ico \

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

en = en
fr = fr

HTML_SOURCES = $(addprefix $(SRC)/, $(HTMLS))
HTML_TARGETS = $(addprefix $(WWW)/, $(addprefix $(en)/, $(HTMLS)) $(addprefix $(fr)/, $(HTMLS)))

COPY_SOURCES = $(addprefix $(SRC)/, $(COPIES))
COPY_TARGETS = $(addprefix $(WWW)/, $(COPIES))

DIRS = $(WWW) $(addprefix $(WWW)/, $(sort $(dir $(HTMLS) $(COPIES)) en fr))

# =============================
# Default target
# =============================

default:

# =============================
# General rules
# =============================

$(WWW)/fr/%.html: $(SRC)/%.html $(SRC)/base.html | dirs
	echo "$(color_s)Rendering $@$(color_e)"
	$(PP) -DLANG=FR -o $@ $<

$(WWW)/en/%.html: $(SRC)/%.html $(SRC)/base.html | dirs
	echo "$(color_s)Rendering $@$(color_e)"
	$(PP) -DLANG=EN -o $@ $<

$(COPY_TARGETS): $(COPY_SOURCES)
	$(foreach file,$(COPIES),\
		echo "$(color_s)Copying $(file)$(color_e)"; \
		$(CP) $(SRC)/$(file) $(WWW)/$(file); \
	)

# =============================
# Specific rules
# =============================

$(DIRS):
	echo "$(color_s)Making build directory: $(WWW)$(color_e)"
	mkdir -p $(DIRS)

$(LINK_TARGETS):

# =============================
# Special Targets
# =============================

# No display of executed commands.
$(VERBOSE).SILENT:

.PHONY: all clean clean-all dirs default firefox chromium

default: all
dirs: $(DIRS)
all: $(HTML_TARGETS) $(COPY_TARGETS) | dirs

firefox: all
	echo "$(color_s)Opening in firefox$(color_e)"
	firefox $(WWW)/fr/index.html

chromium: all
	echo "$(color_s)Opening in firefox$(color_e)"
	chromium $(WWW)/fr/index.html &

clean:
	echo "$(color_s)Removing html file$(color_e)"
	rm -rf $(WWW)/**/*.html

clean-all:
	echo "$(color_s)Removing $(WWW) folder$(color_e)"
	rm -rf $(WWW)
