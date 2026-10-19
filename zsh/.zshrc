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
[[ -f $HOME/.dart-cli-completion/zsh-config.zsh ]] && . $HOME/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

# Node, keg-only so it isn't in the Homebrew bin
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

# steve
export PATH="$HOME/.steve/bin:$PATH"

# kellix
export PATH="$HOME/.kellix/bin:$PATH"

# Maestro CLI and its required Java 17 runtime
export JAVA_HOME="/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$HOME/.maestro/bin:$PATH"

# Setup for this machine only (work tools etc), kept out of this repo
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
