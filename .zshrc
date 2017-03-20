export ZSH=/home/$(whoami)/.oh-my-zsh

ZSH_THEME="solarized-powerline"

plugins=(git extract)


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

color=blue
hostname_=Mint
export PROMPT="%F{15}%K{238} $hostname_ ${VENV}%F{15}%K{10} %D{%H:%M} %F{10}%K{$color}%F{15}%K{$color}%F{15}%K{$color} %2~ %{%f%k%b%}%K{220}%F{$color}%F{220}%K{blue}%F{220}%F{blue}%K{gray}%F{grey}%K{grey}%F{229}%{$reset_color%} "
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
export ip_addr=`/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1  }'`
alias run="python manage.py runserver 0.0.0.0:5000"
alias shell="python manage.py shell"
alias migrate="python manage.py migrate"
alias makemigrations="python manage.py makemigrations"
alias run_loc="python manage.py runserver localhost:5000"
alias pipreq="pip install -r requirements.txt"
alias ls="ls -lh"
transfer() { if [ $# -eq 0  ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi 
    tmpfile=$( mktemp -t transferXXX  ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl  -s --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl -s --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }
alias install="sudo apt-get install"
alias mdroid="adbfs ~/droid"
alias udroid="fusermount -u ~/droid"
notificate() {
    adb connect 192.168.1.23:5555 > /dev/null;
    adb shell am start -n "com.android.mynotif.mynotifservice/com.android.mynotif.mynotifservice.MainActivity" -a android.intent.action.MAIN -c android.intent.category.LAUNCHER -e title "${${2-'Kostya'}// /\ }" -e text "${${1-'Text'}// /\ }" >> /dev/null;
}
mkcd() {
    mkdir $1 ; cd $1
}

alias usdisk="cd ~;fusermount -u ~/sdisk"
alias sdisk="fusermount -u ~/sdisk; encfs /media/profrog/sdisk ~/sdisk; cd ~/sdisk";
