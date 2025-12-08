# Bitwarden

## CLI

Ensure you've installed the bitwarden package, e.g. via `paru -S bitwarden-cli`.

```bash
# Set the server
bw config server https://parola.bazzline.net

# Login
# ref: https://bitwarden.com/help/cli/#log-in
# Depends on your workflow
bw login
# By using single signed on
bw login --sso
# By using your api-key
# ref: https://parola.bazzline.net/#/settings/security/security-keys
bw login --apikey

# Unlock your safe
bw unlock

# Optional to prevent calling each of the following commands with
#	--session <string: sessionkey>
export BW_SESSION="<string: session_key>"

# List available entries
# ref: https://bitwarden.com/help/cli/#using-sso
# Use jq to filter and reduce the json
bw list items
# Search for entries
bw list items --search "dnscontrol"
# Fetch single entry
bw get item <string: id>
# Fetch single username
bw get username <string: id>
# Fetch single password
bw get password <string: id>

# lock your safe
bw lock
```

## Links

* [official cli documentation: bitwarden.com](https://bitwarden.com/help/cli) - 20251208

