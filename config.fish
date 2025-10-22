# Remove greeting message
set -U fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path /opt/homebrew/bin/
fish_add_path /opt/homebrew/opt/postgresql@15/bin
fish_add_path ~/.cargo/bin

if type -q gdal-config
    set GDAL_LIBRARY_PATH $(gdal-config --prefix)/lib/libgdal.dylib
    set GEOS_LIBRARY_PATH $(geos-config --prefix)/lib/libgeos_c.dylib
end

alias vi="nvim"
alias k="kubectl"
alias ls="eza"
alias ll="eza -l"
alias lll="eza -la"

abbr -a -- activate ". .venv/bin/activate.fish"

abbr -a -- gs 'git status'
abbr -a -- gd 'git diff'
abbr -a -- gf 'git fetch'
abbr -a -- gp 'git pull'
abbr -a -- gpr 'git pull --rebase'
abbr -a -- gsw 'git switch'
abbr -a -- grh 'git reset --hard'
abbr -a -- ga 'git add'
abbr -a -- gc 'git commit -m'
abbr -a -- gca 'git commit --amend'
abbr -a -- gpu 'git push'
abbr -a -- gpuf 'git push --force'

abbr -a -- bru 'brew update && brew upgrade'

function update-all
    update-brew
    update-mise
    update-fish
    update-fish-plugins
    update-nvim
    update-tmux
end

function update-brew
    brew update && brew upgrade && brew cleanup
end

function update-mise
    mise upgrade
end

function update-fish
    pushd . && cd ~/.config/fish && git reset --hard && git pull && popd
end

function update-fish-plugins
    fisher update
end

function update-nvim
    pushd . && cd ~/.config/nvim && git reset --hard && git pull && popd
end

function update-tmux
    pushd . && cd ~/.config/tmux && git reset --hard && git pull && popd
end

set -gx GPG_TTY $(tty)
/Users/johan/.local/bin/mise activate fish | source
