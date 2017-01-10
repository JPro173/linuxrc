export ZSH=/home/profrog/.oh-my-zsh

ZSH_THEME="solarized-powerline"

plugins=(git)


export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/john_the_ripper/run"

source $ZSH/oh-my-zsh.sh

export WORKON_HOME=~/envs
source /usr/local/bin/virtualenvwrapper.sh

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export TERM=xterm-256color

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

prompt_end() {
if [[ -n $CURRENT_BG  ]]; then
print -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
else
print -n "%{%k%}"
fi
print -n "%{%f%}"
CURRENT_BG=''
}

function virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "%F{15}%K{yellow} $venv %F{yellow}%K{10}"
}

# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1

local VENV="\$(virtualenv_info)";

#$(git_prompt_info)
export PROMPT="%F{15}%K{238} Mint ${VENV}%F{15}%K{10} %D{%H:%M} %F{10}%K{blue}%F{15}%K{blue}%F{15}%K{blue} %2~ %{%f%k%b%}%K{220}%F{blue}%F{220}%K{blue}%F{220}%F{blue}%K{gray}%F{grey}%K{grey}%F{229}%{$reset_color%} "
export SIMPLE="%K{blue}%F{220}%K{220} %K{blue}%F{220}%F{blue}%K{gray}%F{grey}%K{grey}%F{229}%{$reset_color%} "

alias gas="git add -A; git status -s"

alias grepr='grep -r'
alias grepri='grep -r -i'

bindkey '^R' history-incremental-pattern-search-backward

export TERM='screen-256color'

export smile_n="$(( ( RANDOM % 15 ) + 1))"
smiles=('( •_•)'
        'ᕕ(ᐛ)ᕗ'
        '•ᴗ•'
        'ಠᴗಠ'
        'ʕ•ᴥ•ʔ'
        'ʘ‿ʘ'
        '(╯°□°)╯'
        'ಥ_ಥ'
        '(⊙_☉)'
        '(●__●)'
        '(☉_☉)'
        '(╥_╥)'
        '( ͡° ͜ʖ ͡°)'
        '¯\_(ツ)_/¯'
        '(✖╭╮✖)'
)
smile=0
was_smile=0
alias 'smile=1'='smile=1; was_smile=0'
export RPROMPT='$smiles[$((smile*(1-was_smile)*(RANDOM%15+1+0*(was_smile=1-was_smile))))]'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval $(thefuck --alias)
export ip_addr=`/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1  }'`
alias run="python manage.py runserver 0.0.0.0:5000"
alias run_loc="python manage.py runserver localhost:5000"
alias ls="ls -lah"
