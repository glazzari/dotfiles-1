# zplug
if [[ ! -d $ZPLUG_HOME ]]; then
    curl -sL zplug.sh/installer | zsh
    source $ZPLUG_HOME/init.zsh && zplug update --self
else
    source $ZPLUG_HOME/init.zsh
fi

# Let zplug be managed by itself
zplug "zplug/zplug"

zplug "robbyrussell/oh-my-zsh",	use:"lib/completion.zsh"
zplug "robbyrussell/oh-my-zsh", use:"lib/correction.zsh"
zplug "robbyrussell/oh-my-zsh", use:"lib/directories.zsh"
zplug "robbyrussell/oh-my-zsh", use:"lib/grep.zsh"
zplug "robbyrussell/oh-my-zsh", use:"lib/history.zsh"
zplug "robbyrussell/oh-my-zsh", use:"lib/key-bindings.zsh"
zplug "robbyrussell/oh-my-zsh", use:"lib/theme-and-appearance.zsh"

zplug "plugins/git",      from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh
zplug "plugins/rbenv",    from:oh-my-zsh
zplug "plugins/mix",      from:oh-my-zsh
zplug "plugins/tmux",     from:oh-my-zsh

zplug "zsh-users/zsh-syntax-highlighting", nice:10

zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"

# Configure TERM for tmux
[ -z "$TMUX" ] && export TERM=xterm-256color-italic

# jenv (jenv.be)
if which jenv &> /dev/null; then eval "$(jenv init -)"; fi

# base16-shell - https://github.com/chriskempson/base16-shell
BASE16_SHELL=$HOME/dotfiles/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
