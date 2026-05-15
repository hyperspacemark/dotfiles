# dotfiles

See [USAGE.md](USAGE.md) for a guide to all tools and aliases.

## Fresh macOS install — personal

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

## Fresh macOS install — work

```bash
# 1. Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Add Homebrew to PATH for this session
eval "$(/opt/homebrew/bin/brew shellenv)"

# 3. Clone dotfiles
mkdir -p ~/Developer/github.com/hyperspacemark
git clone https://github.com/hyperspacemark/dotfiles ~/Developer/github.com/hyperspacemark/dotfiles

# 4. Bootstrap
cd ~/Developer/github.com/hyperspacemark/dotfiles
./install.sh --work
brew bundle --file ./Brewfile.work
./macos.sh
```

Then update `~/.gitconfig` with your work email:
```bash
git config --global user.email "you@work.com"
```

Restart the terminal, then complete the manual steps below.

## Updating an existing install

```bash
git pull
./install.sh           # personal
./install.sh --work    # work
```

## Manual steps

These can't be automated via symlinks:

### VS Code extensions (work)
`code --install-extension` is blocked by ZScaler SSL inspection. Install these manually via the VS Code marketplace UI:

- `eamodio.gitlens`
- `editorconfig.editorconfig`
- `llvm-vs-code-extensions.lldb-dap`
- `swiftlang.swift-vscode`
- `tamasfe.even-better-toml`
- `usernamehw.errorlens`
- `vscodevim.vim`

### gh config
After `brew install gh` and `gh auth login`, set:
```bash
gh config set color_labels enabled
gh alias set pv 'pr view --web'
gh alias set il 'issue list'
```

### Local shell config & secrets
`install.sh` creates two stubs automatically:
- `~/.zshrc.d/local.zsh` — machine-specific shell config, gitignored
- `~/.secrets` — sourced by `local.zsh`, chmod 600 automatically

Just fill in `~/.secrets` with your tokens:
```bash
# ~/.secrets — never commit this
export GITHUB_TOKEN=""
export ANTHROPIC_API_KEY=""
export CLOUDFLARE_API_TOKEN=""  # personal only
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
