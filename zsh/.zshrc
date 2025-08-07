source ~/.zsh_profile

export PS1='%~ % '

bindkey -s ^f "tmux-sessionizer\n"

# I want to use $@ for all arguments but they don't contain space for me
function flutter-watch(){
  tmux send-keys "flutter run $1 $2 $3 $4 --pid-file=/tmp/tf1.pid" Enter \;\
  split-window -v \;\
  send-keys 'npx -y nodemon -e dart -x "cat /tmp/tf1.pid | xargs kill -s USR1"' Enter \;\
  resize-pane -y 5 -t 1 \;\
  select-pane -t 0 \;
}

function adb-screenshot() {
 adb exec-out screencap -p > /tmp/screenshot.png && open /tmp/screenshot.png
}

## [Completion] 
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/robertbrunhage/.dart-cli-completion/zsh-config.zsh ]] && . /Users/robertbrunhage/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]
export PATH="/Users/robertbrunhage/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/Users/robertbrunhage/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# Added by Windsurf
export PATH="/Users/robertbrunhage/.codeium/windsurf/bin:$PATH"
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"
