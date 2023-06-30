if [ -x /bin/zsh ]; then
  export SHELL=/bin/zsh
  [ -z "$ZSH_VERSION" ] && exec /bin/zsh -l
fi
