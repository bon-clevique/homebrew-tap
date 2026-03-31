# homebrew-tap

Homebrew formulae for [Toukan](https://github.com/bon-clevique/Toukan) — Markdown → Notion sync CLI.

## Install

```bash
brew install bon-clevique/tap/toukan
```

## Usage

```bash
# Set up Notion API token
toukan config set notion-token

# Add a sync target
toukan add ~/notes --data-source <your-data-source-id>

# View configured targets
toukan list

# Sync all targets
toukan sync

# Watch for new files
toukan watch ~/notes --data-source <id>

# Check status
toukan status

# Help
toukan --help
```

## Upgrade

```bash
brew upgrade toukan
```

## Uninstall

```bash
brew uninstall toukan
brew untap bon-clevique/tap
```

## Supported Architectures

| Architecture | Status |
|---|---|
| Apple Silicon (arm64) | ✅ Supported |
| Intel (x86_64) | ✅ Supported |

## Shell Completions

Completions for bash, zsh, and fish are installed automatically by Homebrew.

To generate completions manually:
```bash
toukan --generate-completion-script zsh > ~/.zsh/completions/_toukan
toukan --generate-completion-script bash > /etc/bash_completion.d/toukan
toukan --generate-completion-script fish > ~/.config/fish/completions/toukan.fish
```

## Download Count

Track architecture-specific download counts to inform future support decisions:

```bash
gh api repos/bon-clevique/homebrew-tap/releases/latest --jq '.assets[] | {name, download_count}'
```

## Troubleshooting

### `Error: No Notion token found`
Set your token:
```bash
toukan config set notion-token
# Enter token interactively
```
Or use an environment variable:
```bash
export TOUKAN_TOKEN=your-token-here
```

### `Error: Data source not found`
Verify your data source ID in the Notion API settings. The ID should be from `https://www.notion.so/my-integrations`.

### Formula update issues
```bash
brew untap bon-clevique/tap
brew tap bon-clevique/tap
brew install toukan
```
