#source /opt/boxen/env.sh
autoload -Uz compinit
compinit
. $HOME/code/personal/z/z.sh
#export JAVA_HOME=$(/usr/libexec/java_home)
export SBT_OPTS="-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M -Dsbt.override.build.repos=true"
source $HOME/.shell_prompt.sh
eval "$(nodenv init -)"
eval $("/Users/matt/code/simspace/ci/deploy/portal" env 2> /dev/null)
export DOCKER_HUB_USERNAME=mjrussell
export DOCKER_HUB_PASSWORD=cVrv7JK9qvU6
source <(kubectl completion zsh)

export PATH="/usr/local/sbin:$HOME/.ghcup/bin:$HOME/.local/bin:$PATH"
# /.local/bin:$HOME/.ghcup/bin:$HOME/code/simspace/ld-wrapper-macos:$PATH"
export GOPATH="/Users/matt/go"
export PATH=$PATH:$GOPATH/bin
GPG_TTY=$(tty)
export GPG_TTY
