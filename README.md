# bash-coloured-prompt

Minimal system-wide coloured bash prompt for Debian/Ubuntu.

- Respects terminal theme (classic `01;32` style codes)
- Optional true-colour (`#RRGGBB`)
- Hostname colour is primary
- Username & root fall back automatically
- Colours follow you into `sudo -i`
- Conversion runs only once per shell
- Survives package upgrades

**Authored by KreAch3R**  
**Implemented by Grok (xAI)**

## One-line install

```bash
curl -fsSL https://raw.githubusercontent.com/KreAch3R/bash-coloured-prompt/main/install.sh | bash
```

## Configuration

Add to `~/.bashrc`:

```bash
HOSTNAME_COLOR="01;32"        # stock green (default)
# HOSTNAME_COLOR="01;31"      # red
# HOSTNAME_COLOR="#FF5555"    # true-colour

# Optional overrides
# USERNAME_COLOR="01;36"
# ROOT_COLOR="01;31"
```

## Examples

**Same colour (hostname only)**
```bash
HOSTNAME_COLOR="01;32"
```

**Different user / host colours**
```bash
HOSTNAME_COLOR="01;36"        # cyan hostname
USERNAME_COLOR="01;33"        # yellow username
```

**Root colour (used with `sudo -i`)**
```bash
HOSTNAME_COLOR="01;36"
ROOT_COLOR="01;31"
```

## Disable

```bash
sudo mv /etc/profile.d/coloured-prompt.sh /etc/profile.d/coloured-prompt.sh.disabled
```

## License

Non-commercial. See [LICENSE](LICENSE).
