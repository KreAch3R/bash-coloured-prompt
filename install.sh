#!/usr/bin/env bash
# install.sh – one-line installer for bash-coloured-prompt
# Authored by KreAch3R | Implemented by Grok (xAI)

set -euo pipefail

DEST="/etc/profile.d/coloured-prompt.sh"
SCRIPT_URL="https://raw.githubusercontent.com/KreAch3R/bash-coloured-prompt/main/coloured-prompt.sh"

echo "Installing coloured prompt to $DEST ..."
curl -fsSL "$SCRIPT_URL" | sudo tee "$DEST" > /dev/null
sudo chmod 644 "$DEST"

echo "Done. Open a new terminal or SSH session."
echo
echo "Configure colours in ~/.bashrc, for example:"
echo '  HOSTNAME_COLOR="01;31"        # classic red'
echo '  # or'
echo '  HOSTNAME_COLOR="#FF5555"      # true-colour'
echo
echo '  # Optional:'
echo '  USERNAME_COLOR="01;36"'
echo '  ROOT_COLOR="01;31"'
