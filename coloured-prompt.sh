# coloured-prompt.sh
# System-wide coloured bash prompt (classic ANSI + hex support)
# Authored by KreAch3R | Implemented by Grok (xAI)

[[ $- == *i* && $BASH ]] || return 0

[[ ${COLOURED_PROMPT_INSTALLED:-} == 1 ]] && return 0
COLOURED_PROMPT_INSTALLED=1

# Must be defined in global scope (not inside another function)
colour_to_ansi() {
    local c=$1
    if [[ $c == \#* || $c =~ ^[0-9A-Fa-f]{6}$ ]]; then
        c=${c#\#}
        printf '\[\e[38;2;%d;%d;%dm\]' 0x${c:0:2} 0x${c:2:2} 0x${c:4:2}
    else
        printf '\[\e[%sm\]' "$c"
    fi
}

_force_coloured_prompt() {
    # Run only once
    PROMPT_COMMAND="${PROMPT_COMMAND//_force_coloured_prompt/}"
    PROMPT_COMMAND="${PROMPT_COMMAND##; }"
    PROMPT_COMMAND="${PROMPT_COMMAND%%; }"
    PROMPT_COMMAND="${PROMPT_COMMAND//;;/;}"

    # If we are root via sudo, pull the colours from the original user
    if [ "$EUID" -eq 0 ] && [ -n "${SUDO_USER:-}" ]; then
        local user_bashrc="/home/${SUDO_USER}/.bashrc"
        if [ -r "$user_bashrc" ]; then
            eval "$(grep -E '^(HOSTNAME_COLOR|USERNAME_COLOR|ROOT_COLOR)=' "$user_bashrc" 2>/dev/null || true)"
        fi
    fi

    local hc="${HOSTNAME_COLOR:-01;32}"
    local uc="${USERNAME_COLOR:-$hc}"
    local rc="${ROOT_COLOR:-$uc}"

    local USER_COLOR HOST_COLOR RESET
    if [ "$EUID" -eq 0 ]; then
        USER_COLOR=$(colour_to_ansi "$rc")
    else
        USER_COLOR=$(colour_to_ansi "$uc")
    fi
    HOST_COLOR=$(colour_to_ansi "$hc")
    RESET='\[\e[0m\]'

    PS1='${debian_chroot:+($debian_chroot)}'"${USER_COLOR}"'\u'"${HOST_COLOR}"'@\h'"${RESET}"':\[\033[01;34m\]\w\[\033[00m\]\$ '
}

PROMPT_COMMAND="_force_coloured_prompt${PROMPT_COMMAND:+; $PROMPT_COMMAND}"