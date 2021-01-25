# =============================
# Variables
# =============================

color = on

SRC = .
WWW = ./www
PP = pproc
CP = cp -r

HTMLS = \
	index.html

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

HTML_SOURCES = $(addprefix $(SRC)/, $(HTMLS))
HTML_TARGETS = $(addprefix $(WWW)/, $(HTMLS))

COPY_SOURCES = $(addprefix $(SRC)/, $(COPIES))
COPY_TARGETS = $(addprefix $(WWW)/, $(COPIES))

DIRS = $(WWW) $(addprefix $(WWW)/, $(sort $(dir $(HTMLS) $(COPIES))))

# =============================
# Default target
# =============================

default:

# =============================
# General rules
# =============================

$(WWW)/%.html: $(SRC)/%.html $(SRC)/base.html | dirs
	echo "$(color_s)Rendering $@$(color_e)"
	$(PP) -o $@ $<

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
	firefox $(WWW)/index.html

chromium: all
	echo "$(color_s)Opening in firefox$(color_e)"
	chromium $(WWW)/index.html &

clean:
	echo "$(color_s)Removing html file$(color_e)"
	rm -rf $(WWW)/*.html

clean-all:
	echo "$(color_s)Removing $(WWW) folder$(color_e)"
	rm -rf $(WWW)
