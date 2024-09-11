ZSH_THEME="theme"

# node
export NODE_MODULES_CACHE="$HOME/.node/cache"
export NODE_COMPILE_CACHE="$HOME/.node/cache"

export DISABLE_AUTO_TITLE='true'

export HISTFILE=~/.zsh_history
export HISTFILESIZE=10000000
export HISTSIZE=10000000
export SAVEHIST=10000000
export SYSTEMD_EDITOR=nvim

export GIT_EDITOR=nvim
export EDITOR=nvim
export LESSHISTFILE=-

export NODE_REPL_HISTORY=""
export ERL_AFLAGS="-kernel shell_history enabled"

export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.deno/bin:$PATH"
export PATH="$HOME/usr/local/go/bin:$PATH"
export PATH="$HOME/elixir/scrips/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/bin/custom:$PATH"
export PATH="$HOME/.config/tmuxifier/bin:$PATH"
export PATH="$HOME/.atuin/bin:$PATH"
export PATH="$HOME/.spoof-dpi/bin:$PATH"
export PATH="$HOME/scripts/bin:$PATH"
export PATH="/home/alexs/REPOS/depot_tools/:$PATH"
export PATH="$HOME/bin/js:$PATH"
export PATH="$$HOME/.composer/vendor/bin:$PATH"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# https://stackoverflow.com/a/71271754/17619964
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# Go path
GOPATH=$HOME/.go
export GOPATH
export PATH="$PATH:/$GOPATH/bin"
export PATH=$PATH:/usr/local/go/bin

# Relocate .zcompdump files from home directory
# https://stackoverflow.com/a/71271754
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

CASE_SENSITIVE="true" # case-sensitive completion.
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="false" # command auto-correction.
DISABLE_UNTRACKED_FILES_DIRTY="false"

# Bun
export BUN_INSTALL="/home/alexs/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# bun completions
[ -s "/home/alexs/.bun/_bun" ] && source "/home/alexs/.bun/_bun"

# pnpm
# export PNPM_HOME="/home/alexs/.local/share/pnpm"
# export PATH="$PNPM_HOME:$PATH"

# cargo
. "$HOME/.cargo/env"
export PATH=$PATH:/usr/local/go/bin

# Stylef fot history search
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
source $HOME/.zsh_keybindings
source $HOME/.functions
source $HOME/.zstyle
# source ~/.local/fzf/key-bindings.zsh
# source ~/.local/fzf/completion.zsh
# source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ~/.oh-my-zsh/plugins/golang/golang.plugin.zsh
# source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# SOURCING
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
	print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
	command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
	command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" &&
		print -P "%F{33} %F{34}Installation successful.%f%b" ||
		print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

# Snippet
# zinit snippet https://gist.githubusercontent.com/hightemp/5071909/raw

# Load the pure theme, with zsh-async library that's bundled with it.
# zi ice pick"async.zsh"
# src"pure.zsh"
# zi light sindresorhus/pure

# A glance at the new for-syntax – load all of the above
# plugins with a single command. For more information see:
# https://zdharma-continuum.github.io/zinit/wiki/For-Syntax/
# zinit for \
#     light-mode \
#   zsh-users/zsh-autosuggestions \
#     light-mode \
#   zdharma-continuum/fast-syntax-highlighting \
#   zdharma-continuum/history-search-multi-word \
#     light-mode \
#     pick"async.zsh" \
#     src"pure.zsh" \
#   sindresorhus/pure

# Binary release in archive, from GitHub-releases page.
# After automatic unpacking it provides program "fzf".
# zi ice from"gh-r" as"program"
# zi light junegunn/fzf

# One other binary release, it needs renaming from `docker-compose-Linux-x86_64`.
# This is done by ice-mod `mv'{from} -> {to}'. There are multiple packages per
# single version, for OS X, Linux and Windows – so ice-mod `bpick' is used to
# select Linux package – in this case this is actually not needed, Zinit will
# grep operating system name and architecture automatically when there's no `bpick'.
# zi ice from"gh-r" as"program" mv"docker* -> docker-compose" bpick"*linux*"
# zi load docker/compose

# Vim repository on GitHub – a typical source code that needs compilation – Zinit
# can manage it for you if you like, run `./configure` and other `make`, etc.
# Ice-mod `pick` selects a binary program to add to $PATH. You could also install the
# package under the path $ZPFX, see: https://zdharma-continuum.github.io/zinit/wiki/Compiling-programs
# zi ice \
#   as"program" \
#   atclone"rm -f src/auto/config.cache; ./configure" \
#   atpull"%atclone" \
#   make \
#   pick"src/vim"
# zi light vim/vim

# Scripts built at install (there's single default make target, "install",
# and it constructs scripts by `cat'ing a few files). The make'' ice could also be:
# `make"install PREFIX=$ZPFX"`, if "install" wouldn't be the only default target.
# zi ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"
# zi light tj/git-extras

# Handle completions without loading any plugin; see "completions" command.
# This one is to be ran just once, in interactive session.
# zi creinstall %HOME/my_completions

plugins=(git docker docker-compose)

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# User configs

# Reference: http://zsh.sourceforge.net/Doc/Release/Options.html
setopt glob_dots              # glob matches files starting with dot; `*` becomes `*(D)`
setopt hist_ignore_dups       # don't add dups to history
setopt hist_find_no_dups      # don't show dups when searching history
setopt hist_expire_dups_first # IF HISTORY NEEDS TO BE TRIMMED, EVICT DUPS FIRST
setopt hist_ignore_space      # DON'T ADD COMMANDS STARTING WITH SPACE TO HISTORY
setopt hist_reduce_blanks     # REMOVE JUNK WHITESPACE FROM COMMANDS BEFORE ADDING TO HISTORY
setopt interactive_comments   # ALLOW COMMENTS IN COMMAND LINE
setopt share_history          # WRITE AND IMPORT HISTORY ON EVERY COMMAND
setopt extended_history       # WRITE TIMESTAMPS TO HISTORY
setopt bang_hist              # tREAT THE '!' CHARACTER SPECIALLY DURING EXPANSION.
setopt hist_ignore_all_dups   # dELETE OLD RECORDED ENTRY IF NEW ENTRY IS A DUPLICATE.
setopt hist_save_no_dups      # dON'T WRITE DUPLICATE ENTRIES IN THE HISTORY FILE.
setopt hist_verify            # dON'T EXECUTE IMMEDIATELY UPON HISTORY EXPANSION.
# setopt no_clobber             # don't override file with redirections if file exists

# Emulates Vim's `smartcase` for tab completion. (If lower-case, matches botch lower- and upper-case.)
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

[[ ${chpwd_functions[(r)auto_ls]} == auto_ls ]] ||
chpwd_functions=( auto_ls $chpwd_functions )

# Make beam cursor https://unix.stackexchange.com/a/496878
_fix_cursor() {
	echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)

bindkey "^n" sudo-command-line # [Ctrl + N] (for Negate) Prepend/remove 'sudo' for current/previous command

# add do-ls to chpwd hook
do-ls() { exa; }
add-zsh-hook chpwd do-ls

# Creating hashes for us to be able to navigate with ~t ~f etc
declareHashes
autoload -U zmv

alias luamake=/home/alexs/repos/lua-language-server/3rd/luamake/luamake

# fnm
export PATH=/home/alexs/.fnm:$PATH
eval "$(fnm env --use-on-cd)"

# source <(kubectl completion zsh)

# pnpm
export PNPM_HOME="/home/alexs/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Bind ctrl-r but not up arrow
eval "$(atuin init zsh --disable-up-arrow)"

# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd() {
	\builtin pwd -L
}

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd() {
	# shellcheck disable=SC2164
	\builtin cd -- "$@"
}

# =============================================================================
#
# Hook configuration for zoxide.
#

# Hook to add new entries to the database.
function __zoxide_hook() {
	# shellcheck disable=SC2312
	\command zoxide add -- "$(__zoxide_pwd)"
}

# Initialize hook.
# shellcheck disable=SC2154
if [[ ${precmd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]] && [[ ${chpwd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]]; then
    chpwd_functions+=(__zoxide_hook)
fi

# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

__zoxide_z_prefix='z#'

# Jump to a directory using only keywords.
function __zoxide_z() {
	# shellcheck disable=SC2199
	if [[ "$#" -eq 0 ]]; then
		__zoxide_cd ~
	elif [[ "$#" -eq 1 ]] && { [[ -d "$1" ]] || [[ "$1" = '-' ]] || [[ "$1" =~ ^[-+][0-9]$ ]]; }; then
		__zoxide_cd "$1"
	elif [[ "$@[-1]" == "${__zoxide_z_prefix}"?* ]]; then
		# shellcheck disable=SC2124
		\builtin local result="${@[-1]}"
		__zoxide_cd "${result:${#__zoxide_z_prefix}}"
	else
		\builtin local result
		# shellcheck disable=SC2312
		result="$(\command zoxide query --exclude "$(__zoxide_pwd)" -- "$@")" &&
			__zoxide_cd "${result}"
	fi
}

# Jump to a directory using interactive search.
function __zoxide_zi() {
	\builtin local result
	result="$(\command zoxide query --interactive -- "$@")" && __zoxide_cd "${result}"
}

# Completions.
if [[ -o zle ]]; then
	function __zoxide_z_complete() {
		# Only show completions when the cursor is at the end of the line.
		# shellcheck disable=SC2154
		[[ "${#words[@]}" -eq "${CURRENT}" ]] || return 0

		if [[ "${#words[@]}" -eq 2 ]]; then
			_files -/
		elif [[ "${words[-1]}" == '' ]] && [[ "${words[-2]}" != "${__zoxide_z_prefix}"?* ]]; then
			\builtin local result
			# shellcheck disable=SC2086,SC2312
			if result="$(\command zoxide query --exclude "$(__zoxide_pwd)" --interactive -- ${words[2, -1]})"; then
				result="${__zoxide_z_prefix}${result}"
				# shellcheck disable=SC2296
				compadd -Q "${(q-)result}"
			fi
			\builtin printf '\e[5n'
		fi
		return 0
	}

	\builtin bindkey '\e[0n' 'reset-prompt'
	[[ "${+functions[compdef]}" -ne 0 ]] && \compdef __zoxide_z_complete __zoxide_z
fi

# =============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#

\builtin alias c=__zoxide_z
\builtin alias ci=__zoxide_zi

# =============================================================================
#
# To initialize zoxide, add this to your configuration (usually ~/.zshrc):
#
eval "$(zoxide init zsh)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
