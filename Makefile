.PHONY: all sync-fish-functions sync-nvim sync-starship
.DEFAULT_GOAL := all

all: sync-fish-functions sync-nvim sync-starship

sync-fish-functions:
	@echo "Syncing fish functions..."
	rsync -z --mkpath ~/.config/fish/functions/* ./fish/functions/

sync-nvim:
	@echo "Syncing nvim..."
	rsync -z --mkpath ~/.config/nvim/* ./nvim/

sync-starship:
	@echo "Syncing starship..."
	rsync -z --mkpath ~/.config/starship.toml ./starship/
