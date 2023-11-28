# Show help by default
@default:
    just --list

# Create synmbolic links
@link:
    -ln -s {{ justfile_directory() }}/config/tmux/tmux.conf ~/.tmux.conf
    -ln -s {{ justfile_directory() }}/config/nvim/init.vim ~/.config/nvim/init.vim
    -ln -s {{ justfile_directory() }}/config/zellij/config.kdl ~/.config/zellij/config.kdl
    -ln -s {{ justfile_directory() }}/just/home.justfile ~/Justfile

# Assemble distrobox
@distrobox *FLAGS:
    distrobox-assemble create {{ FLAGS }} --file ./distrobox/distrobox.ini
