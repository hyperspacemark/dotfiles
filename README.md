# dotfiles

See [USAGE.md](USAGE.md) for a guide to all tools and aliases.

## Fresh macOS install

```bash
# 1. Install Homebrew (also triggers Xcode CLT install if needed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Add Homebrew to PATH for this session
eval "$(/opt/homebrew/bin/brew shellenv)"

# 3. Clone dotfiles
mkdir -p ~/Developer/github.com/hyperspacemark
git clone https://github.com/hyperspacemark/dotfiles ~/Developer/github.com/hyperspacemark/dotfiles

# 4. Bootstrap
cd ~/Developer/github.com/hyperspacemark/dotfiles
./install.sh
brew bundle --file ./Brewfile
./macos.sh
```

Restart the terminal, then complete the manual steps below.

## Updating an existing install

```bash
git pull
./install.sh
```

## Manual steps

These can't be automated via symlinks:

### gh config
After `brew install gh` and `gh auth login`, set:
```bash
gh config set color_labels enabled
gh alias set pv 'pr view --web'
gh alias set il 'issue list'
```

### SSH signing key
Generate a dedicated key for commit signing:
```bash
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_signing -C "signing"
```
Add the public key to GitHub → Settings → SSH keys → type: Signing.

Then register it as an allowed signer:
```bash
echo "$(git config user.email) namespaces=\"git\" $(cat ~/.ssh/id_ed25519_signing.pub)" > ~/.config/git/allowed-signers
```
