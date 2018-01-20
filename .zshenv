export PATH=/usr/local/bin:$PATH
# pyenv
export PYENV_ROOT=/usr/local/var/pyenv
export PATH=$PYENV_ROOT/shims:$PATH:/Users/andrey/Documents/mybin:$PYENV_ROOT/shims
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# vim-pyenv
export PYTHONPATH='/usr/local/var/pyenv/'
#export PYENV_VIRTUALENV_DISABLE_PROMPT=1

export LC_CTYPE="ja_JP.UTF-8"

export GOPATH=$HOME/.go
# docker 証明書を使ってイメージの発行元を確認
# export DOCKER_CONTENT_TRUST=1


