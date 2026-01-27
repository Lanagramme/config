# ------------------------------------------------------------------------------
# Bash Aliases - Portable & Distro-aware
# ------------------------------------------------------------------------------

# Interactive safety
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# ==============================================================================
# Run programs
# ==============================================================================
alias v="nvim"
alias vimwiki='v -c VimwikiIndex'
alias wiki='v -c VimwikiIndex'

# ==============================================================================
# Config files
# ==============================================================================
alias aw="v ~/.config/awesome/rc.lua"
alias vimrc="v ~/.config/nvim/init.lua"
alias zshrc="v ~/.zshrc"
alias bashrc="v ~/.bashrc"
alias aliases="v ~/.bash_aliases"
alias ohmyrc="v ~/.oh-my-zsh"

# ==============================================================================
# Package manager / distro helpers
# ==============================================================================
detect_pkg_manager() {
    if command -v pacman >/dev/null 2>&1; then
        echo "pacman"
    elif command -v apt >/dev/null 2>&1; then
        echo "apt"
    elif command -v dnf >/dev/null 2>&1; then
        echo "dnf"
    elif command -v zypper >/dev/null 2>&1; then
        echo "zypper"
    else
        echo "unknown"
    fi
}

PKG_MANAGER=$(detect_pkg_manager)

# Example aliases (distro-aware)
case "$PKG_MANAGER" in
    pacman)
        alias p="sudo pacman -S"
        alias d="sudo pacman -Rsn"
        alias update="sudo pacman -Syu"
        alias fixpacman="sudo rm /var/lib/pacman/db.lck"
        ;;
    apt)
        alias p="sudo apt install"
        alias d="sudo apt remove"
        alias update="sudo apt update && sudo apt upgrade"
        ;;
    dnf)
        alias p="sudo dnf install"
        alias d="sudo dnf remove"
        alias update="sudo dnf upgrade"
        ;;
    zypper)
        alias p="sudo zypper install"
        alias d="sudo zypper remove"
        alias update="sudo zypper update"
        ;;
esac

# ------------------------------------------------------------------------------
# Cross-distro orphan cleanup
# ------------------------------------------------------------------------------
cleanup_orphans() {
    case "$PKG_MANAGER" in
        pacman)
            orphans=$(pacman -Qtdq 2>/dev/null)
            if [[ -n $orphans ]]; then
                echo "Removing orphaned packages: $orphans"
                sudo pacman -Rsn $orphans
            else
                echo "No orphaned packages found."
            fi
            ;;
        apt)
            echo "APT: running 'sudo apt autoremove'"
            sudo apt autoremove
            ;;
        dnf)
            echo "DNF: running 'sudo dnf autoremove'"
            sudo dnf autoremove
            ;;
        zypper)
            echo "Zypper: list orphaned packages with 'zypper packages --orphaned'"
            ;;
        *)
            echo "Orphan cleanup not available for $PKG_MANAGER"
            ;;
    esac
}
alias cleanup='cleanup_orphans'

# ==============================================================================
# System helpers
# ==============================================================================
alias jctl="journalctl -p 3 -xb"
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl" 2>/dev/null || true

# ==============================================================================
# General helpers
# ==============================================================================
alias cl="clear"
alias mkd="mkdir -pv"
alias ref='source ${ZDOTDIR:-$HOME}/.zshrc'

# ==============================================================================
# ls / coreutils
# ==============================================================================
if command -v eza >/dev/null 2>&1; then
    alias l='eza -la --header --icons --git'
    alias ls='eza'
elif command -v exa >/dev/null 2>&1; then
    alias l='exa -la --header --icons --git'
else
    alias l='ls -la --color=auto'
    alias ls='ls --color=auto'
fi


alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

# ==============================================================================
# grep
# ==============================================================================
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias zzz="echo test"
