set fish_greeting

if status is-interactive
    catnap
end

string match -q "$TERM_PROGRAM" "vscode"
and . (code --locate-shell-integration-path fish)


# Created by `pipx` on 2024-05-06 08:39:47
set PATH $PATH /home/arch/.local/bin
#set -x PATH $HOME/.local/bin $HOME/bin $PATH
set -gx XDG_SCREENSHOTS_DIR "$HOME/Pictures/"
set -gx PATH $HOME/.nvm/versions/node/v22.11.0/bin $PATH
