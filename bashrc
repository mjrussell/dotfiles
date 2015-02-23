source /opt/boxen/env.sh
. $HOME/src/z/z.sh
export JAVA_HOME=$(/usr/libexec/java_home)
export SBT_OPTS="-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M -Dsbt.override.build.repos=true"
source $HOME/.shell_prompt.sh
