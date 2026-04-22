# Usage Guide

## Shell

### Autosuggestions
As you type, a grey suggestion appears based on history.

| Key | Action |
|---|---|
| `Ctrl+Space` | Accept suggestion |
| `→` | Accept suggestion |

### Completion
| Key | Action |
|---|---|
| `Tab` | Open completion menu |
| Arrow keys | Navigate menu |
| `Shift+Tab` | Navigate menu backwards |

---

## Navigation

### zoxide — smart `cd`
Learns from your history. Gets smarter the more you use it.

| Command | Action |
|---|---|
| `z dotfiles` | Jump to best match for "dotfiles" |
| `zi` | Interactive fuzzy picker |
| `z -` | Jump back to previous directory |

### `j` — project picker
Fuzzy-searches all git repos under `~/Developer`.

```bash
j          # browse all projects
j my-app   # pre-filter by name
```

---

## File Finding & Searching

### `ff` — fuzzy file opener
Opens a file in VS Code using fzf. Inside a git repo uses `git ls-files` (tracked + untracked). Outside, uses `find`.

```bash
ff         # browse and open a file
```

### `ffa` — fuzzy file opener (all files)
Same as `ff` but ignores git — includes gitignored files.

```bash
ffa        # browse all files including ignored ones
```

### `fif` — fuzzy in-file search
Search file *contents* with ripgrep, preview with bat, open in VS Code at the exact line.

```bash
fif "TODO"         # find all TODOs
fif "func main"    # search for a function
```

### `rg` — ripgrep
Fast recursive search. Respects `.gitignore`.

| Command | Action |
|---|---|
| `rg "pattern"` | Search recursively |
| `rg "pattern" -t js` | Limit to file type |
| `rg "pattern" -l` | List matching files only |
| `rg "pattern" -C 3` | Show 3 lines of context |
| `rg "pattern" -i` | Case insensitive |
| `rg "pattern" --no-ignore` | Include gitignored files |

### fzf — fuzzy finder
Built into the shell globally.

| Key | Action |
|---|---|
| `Ctrl+R` | Fuzzy search shell history |
| `Ctrl+T` | Fuzzy insert file path at cursor |
| `Alt+C` | Fuzzy `cd` into a directory |
| `**Tab` | Fuzzy completion (e.g. `kill **Tab`, `ssh **Tab`) |

---

## File Viewing

### `cat` → bat
`cat` is aliased to `bat` — syntax highlighted, with line numbers.

| Command | Action |
|---|---|
| `cat file.js` | Syntax-highlighted view |
| `cat -p file` | Plain output (pipe-safe) |
| `cat -A file` | Show non-printable characters |

---

## Directory Listing

### `ls` / `ll` / `lt` → eza

| Command | Action |
|---|---|
| `ls` | Clean listing, directories first |
| `ll` | Detailed list with git status per file |
| `lt` | Tree view |
| `lt --level=2` | Tree limited to 2 levels deep |

---

## Git

### Core aliases
| Command | Action |
|---|---|
| `g` | `git status` with no args, otherwise proxies to `git` |
| `gbc <branch>` | Create branch + push with tracking in one command |
| `gco [branch]` | Switch branch, or list branches if no arg |
| `gcof` | Fuzzy branch switcher |
| `glogf` | Fuzzy git log with full commit diff preview |
| `gprune` | Delete all local branches whose remotes are gone |
| `gbd <branch>` | Delete branch locally and remotely |
| `gbd -D <branch>` | Force-delete branch locally and remotely |

### Power features (configured automatically)
| Feature | What it does |
|---|---|
| `git pull` | Rebases + auto-stashes dirty work |
| `git push` | Auto-sets upstream on new branches |
| `git fetch` | Auto-prunes deleted remote branches |
| `git branch` | Shows most recently used branches first |
| `git diff` | Side-by-side via delta, syntax highlighted |
| `git rerere` | Remembers and replays conflict resolutions |

### delta (git diff pager)
| Key | Action |
|---|---|
| `n` / `N` | Next / previous file |
| `q` | Quit |

---

## GitHub CLI

| Command | Action |
|---|---|
| `gh pr create` | Open PR (interactive) |
| `gh pv` | Open current PR in browser |
| `gh co <num>` | Checkout PR by number |
| `gh pr list` | List open PRs |
| `gh pr merge` | Merge current PR |
| `gh il` | List issues |
| `gh issue create` | Create issue |
| `gh run list` | List CI runs |
| `gh run view --log` | View CI logs |

---

## Node

### fnm — Node version manager
Auto-switches version on `cd` if a `.node-version` file is present.

| Command | Action |
|---|---|
| `fnm install 22` | Install Node 22 |
| `fnm use 22` | Switch to it in current shell |
| `fnm list` | List installed versions |
| `fnm current` | Show active version |

Pin a project's Node version:
```bash
echo "22" > .node-version
```

### pnpm

| Command | Action |
|---|---|
| `pnpm install` | Install deps |
| `pnpm add <pkg>` | Add dependency |
| `pnpm add -D <pkg>` | Add dev dependency |
| `pnpm dlx <pkg>` | Run without installing (like npx) |
| `pnpm why <pkg>` | Show why a package is installed |
| `pnpm up --interactive` | Interactive dependency upgrades |
| `pnpm store prune` | Clean unused packages from global store |

---

## Python

### pyenv — Python version manager

| Command | Action |
|---|---|
| `pyenv install 3.13` | Install a version |
| `pyenv global 3.13` | Set global default |
| `pyenv local 3.12` | Pin project (writes `.python-version`) |
| `pyenv versions` | List installed versions |

---

## Cloudflare Workers

### wrangler

| Command | Action |
|---|---|
| `wrangler dev` | Local dev server |
| `wrangler deploy` | Deploy to Cloudflare |
| `wrangler tail` | Stream live logs from deployed worker |
| `wrangler secret put NAME` | Set environment secret |
| `wrangler pages dev` | Local dev for Pages projects |

---

## Homebrew

```bash
brew update && brew upgrade   # Update everything
brew cleanup                  # Remove old versions
brew doctor                   # Diagnose issues
brew bundle --file ./Brewfile # Restore env on a new machine
```

---

## Prompt (Starship)

| Symbol | Meaning |
|---|---|
| `⎇ main` | Current branch |
| `?` | Untracked files |
| `!` | Modified files |
| `+` | Staged files |
| `2s` | Last command took 2+ seconds |
| `❯` (green) | Ready |
| `❯` (red) | Last command failed |

---

## VS Code Extensions

| Extension | Key feature |
|---|---|
| **GitLens** | Inline blame, file history, commit explorer |
| **ErrorLens** | Errors shown inline — no hover needed |
| **VSCodeVim** | `gd` go to definition, `gr` references, full vim motions |
| **Even Better TOML** | Validation for `wrangler.toml`, `Cargo.toml` |
