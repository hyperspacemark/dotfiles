# dotfiles

## Install

```bash
./install.sh
brew bundle --file ./Brewfile
./macos.sh
```

To update local setup after repo changes:

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
