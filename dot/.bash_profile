# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

alias aimp="wine /home/alexs/.wine/drive_c/Program Files (x86)/AIMP/aimp.exe"
. "$HOME/.cargo/env"
export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"

source /home/alexs/.config/broot/launcher/bash/br
