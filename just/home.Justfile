uid := `id -u`
gid := `id -g`

# List all available commands
@help:
    just --list

# Get rpm-ostree status
@status *FLAGS:
    rpm-ostree status {{ FLAGS }}

# Update rpm-ostree, flatpak, and distrobox
@update:
    rpm-ostree update
    flatpak update -y
    distrobox upgrade -a

# Update firmware
@update-firmware:
    fwupdmgr refresh
    fwupdmgr update

# Build latex container image
@build:
    podman build -t custom-texlive:latest -f Containerfile ~/Git/privat/custom-settings/container/latex

# Run latexmk on a tex file
@latexmk FILE *FLAGS:
    podman run --rm -it -v {{ invocation_directory() }}:/workdir:z -w /workdir --userns keep-id:uid={{ uid }},gid={{ gid }} custom-texlive:latest latexmk {{ FLAGS }} -output-directory="out" -aux-directory="out" {{ FILE }}

# Run pandoc on a markdown file (pandoc/latex:3-alpine, ~/.local/share/pandoc/templates/eisvogel.latex)
@pandoc FILE *FLAGS:
    podman run --rm -it -v {{ invocation_directory() }}:/workdir:z -v ~/.local/share/pandoc/templates:/templates:z -w /workdir --userns keep-id:uid={{ uid }},gid={{ gid }} custom-texlive:latest pandoc {{ FILE }} -o {{ without_extension(FILE) }}.pdf {{ FLAGS }} --template /templates/eisvogel --listings --resource-path {{ parent_directory(FILE) }}
