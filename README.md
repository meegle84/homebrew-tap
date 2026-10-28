# homebrew-tap

Personal Homebrew tap with casks for free macOS apps that have no official Homebrew cask.

## Casks

| Cask | App | Upstream |
|------|-----|----------|
| `oriedita` | Origami crease pattern editor and folding simulator (fork of Orihime) | [oriedita/oriedita](https://github.com/oriedita/oriedita) |
| `oripa` | Origami crease pattern editor that computes the folded shape | [oripa/oripa](https://github.com/oripa/oripa) |

## Usage

```sh
brew tap meegle84/tap
brew install --cask meegle84/tap/oripa
```

## Updates

Every cask has a `livecheck` block. A weekly GitHub Actions workflow (`.github/workflows/bump-casks.yml`) checks upstream releases and opens one pull request per outdated cask with the new version and checksum; nothing is merged automatically.

Only free, legitimate apps go in: no paid or commercial software.
