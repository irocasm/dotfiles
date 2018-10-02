MODULES = i3 textadept wallpaper
CLEARMODULES = $(MODULES:%=clear-%) # All modules prepended with "clear-"

# Everything should be phony as the modules are existing folder names
.PHONY: all clearall $(MODULES) $(CLEARMODULES)

all: $(MODULES)

# Declare dependencies
i3: wallpaper

$(MODULES):
	stow $@

clearall: $(CLEARMODULES)

$(CLEARMODULES):
	stow -D $(subst clear-,,$@)
