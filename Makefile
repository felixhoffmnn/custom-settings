.PHONY: sync-fish-functions, sync-nvim

sync-fish-functions:
	@echo "Syncing fish functions..."
	rsync -z --mkpath ~/.config/fish/functions/* ./fish/functions/

sync-nvim:
	@echo "Syncing nvim..."
	rsync -z --mkpath ~/.config/nvim/* ./nvim/