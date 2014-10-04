alias tw='t timeline -r'
alias pw='password'
alias be='bundle exec'
alias minecraft='java -Xmx1660M -Xms1660M -jar ~/minecraft.jar'

if which hub > /dev/null; then
  alias g='hub'
  eval "$(hub alias -s)"
else
  alias g='git'
fi
