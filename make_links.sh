#!/usr/local/bin/zsh

cd `dirname ${0}`
for file in `find . -type f`; do
  echo "$(dirname ${0})/${file}"
  if [ `echo $file | grep ".git/\|.DS_Store\|make_links.sh"` ] ; then
    continue
  else
    ln -si "$(dirname ${0})/${file}" "${HOME}/${file}"
  fi
done

