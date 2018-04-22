fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit
compinit

# pyenv
#export PYENV_ROOT=/usr/local/var/pyenv
#export PATH=$PATH:/Users/andrey/Documents/mybin:$PYENV_ROOT/shims
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export GOPATH=$HOME/.go

# jenv java version maneger
if which jenv > /dev/null; then
  # JENV_ROOTがemptyの場合、'${HOME}/.jenv'がrootと設定される
  export JENV_ROOT="/usr/local/var/jenv"
  eval "$(jenv init -)"
fi

# Zsh
fpath=(~/.functions ${fpath})
autoload -Uz git-escape-magic
git-escape-magic

# tesseract --OCR Google
export TESSDATA_PREFIX="/usr/local/share/tessdata/"

# 少し凝った zshrc
# License : MIT
# http://mollifier.mit-license.org/

########################################
# 環境変数
export LANG=ja_JP.UTF-8


# 色を使用出来るようにする
autoload -Uz colors
colors

# emacs 風キーバインドにする
# bindkey -e

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
# PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
# %# "

# 2行表示
PROMPT="%{${fg[green]}%}%~ %{${reset_color}%}
$ "



# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


########################################
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg


########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

########################################
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

########################################
# エイリアス

alias la='ls -a'
alias ll='ls -l'
alias hs='history | grep '

alias rgr='ranger-cd'
alias relogin='exec $SHELL'
alias vim='gvim'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
#    linux*)
        #Linux用の設定
#        alias ls='ls -F --color=auto'
#        ;;
esac

# vim:set ft=zsh:

eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# ranger file browser in terminal
# privent to open ranger in sub shell
function ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
        /usr/local/bin/ranger $@
    else
        exit
    fi
}
# Compatible with ranger 1.5.3 through 1.7.*
#
# Change the prompt when you open a shell from inside ranger
#
# Add this line to your .bashrc for it to work.

[ -n "$RANGER_LEVEL" ] && PS1="$PS1"'(in ranger) '


# Compatible with ranger 1.4.2 through 1.7.*
#
# Automatically change the directory in bash after closing ranger
#
# This is a bash function for .bashrc to automatically change the directory to
# the last visited one after ranger quits.
# To undo the effect of this function, you can type "cd -" to return to the
# original directory.
#
# On OS X 10 or later, replace `usr/bin/ranger` with `/usr/local/bin/ranger`.

function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/local/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

# sshごとに背景を変える
function ssh_color() {
 case $1 in
   # product- から始まるところは背景を赤くする
   # staging- から始まるところは背景を青くする

   raspi* ) echo -e "\033]50;SetProfile=EricaHartmann\a" ;;
   # staging-* ) echo -e "\033]50;SetProfile=zsh_blue\a" ;;
   * ) echo -e "\033]50;SetProfile=ssh\a" ;;
 esac
  ssh $@
  echo -e "\033]50;SetProfile=Default\a"
}

alias ssh='ssh_color'
compdef _ssh ssh_color=ssh

function pdftoclip {
    tempfile="$(mktemp)"
    pdftotext "$1" "$tempfile"
    cat "$tempfile" | pbcopy
    rm "$tempfile"
}

