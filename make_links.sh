#!/bin/sh

#bash
ln -si "${0}/.bashrc" "${HOME}/.bashrc"
ln -si "${0}/.bash_profile" "${HOME}/.bash_profile"

#zsh
ln -si "${0}/.zshrc" "${HOME}/.zshrc"
ln -si "${0}/.zshenv" "${HOME}/.zshenv"

#ipython
# ln -si "${0}/.ipython" "${HOME}/.ipython"
# ln i-s "${0}/.ipython/profile_default" "${HOME}/.ipython/profile_default"
# ln i-s ./.ipython/profile_default/startup ${HOME}/./.ipython/profile_default/startup"
ln -si "${0}/.ipython/profile_default/startup/01.py" "${HOME}/.ipython/profile_default/startup/01.py"

#git
ln -si "${0}/.gitignore_global" "${HOME}/.gitignore_global"
ln -si "${0}/.gitattributes" "${HOME}/.gitattributes"
ln -si "${0}/.gitconfig" "${HOME}/.gitconfig"

#vim
ln -si "${0}/.vimrc" "${HOME}/.vimrc"

#latex
ln -si "${0}/.latexmkrc" "${HOME}/.latexmkrc"

#gnuplot
ln -si "${0}/.gnuplot" "${HOME}/.gnuplot"
