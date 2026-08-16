# dotfiles (managed with [chezmoi](https://www.chezmoi.io))

A minimal, opinionated macOS dotfiles starter. It bootstraps Homebrew,
installs apps from a `Brewfile`, sets up Oh My Zsh, and applies a few
macOS tweaks — all reproducibly on a fresh machine.

## Quick start (new machine)

One-liner that installs Homebrew + chezmoi and applies this repo:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/adivardhan1000/dotFiles/main/initialize.sh)"
```

Or, if you already have chezmoi:

```sh
chezmoi init --apply adivardhan1000
```

## How it works

Files are named using chezmoi conventions. On `chezmoi apply`:

| File | Purpose |
| --- | --- |
| `.chezmoi.toml.tmpl` | Prompts for config (e.g. username) on first init; defines template data. |
| `initialize.sh` | Bootstrap for a brand-new machine (installs Homebrew + chezmoi). Repo-only. |
| `run_once_before_00_install_prerequisites.sh.tmpl` | Installs Bitwarden first (SSH agent) before other steps. |
| `run_onchange_before_10_install_packages.sh.tmpl` | Runs `brew bundle` + installs Oh My Zsh. Re-runs whenever `dot_Brewfile` changes. |
| `dot_Brewfile` | The list of Homebrew formulae/casks to install (becomes `~/.Brewfile`). |
| `dot_zshrc.tmpl` | Your `~/.zshrc` (Homebrew env, Oh My Zsh, plugins, brew auto-sync wrapper). |
| `run_once_after_99_macos_settings.sh.tmpl` | Removes unwanted default apps; place for `defaults write` tweaks. |
| `.chezmoiignore` | Files kept in the repo but not applied to `$HOME`. |

Script run order: `before` scripts → files → `after` scripts, each in
alphanumeric order (hence the `00`, `10`, `99` prefixes).

## Managing Homebrew packages

`dot_zshrc.tmpl` wraps `brew` so that whenever you
`brew install|uninstall|tap|untap`, the `Brewfile` in this repo is
automatically re-dumped. After a change:

```sh
chezmoi cd        # jump to the source dir
git add -A && git commit -m "Update Brewfile" && git push
```

## Common commands

```sh
chezmoi diff       # preview what would change
chezmoi apply -v   # apply changes
chezmoi cd         # open a shell in the source directory
chezmoi update     # pull latest from git and apply
```

## Customizing

- **Add a package:** just `brew install <pkg>` — the Brewfile updates itself.
- **Add a dotfile:** `chezmoi add ~/.somerc`
- **Edit a managed file:** `chezmoi edit ~/.zshrc`

> Update the GitHub username in `initialize.sh` and the commands above if
> you fork this repo.
