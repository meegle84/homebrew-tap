# homebrew-tap

Personal Homebrew tap with casks for free macOS apps that have no official Homebrew cask.

## Casks

| Cask | App | Upstream |
|------|-----|----------|
| `ori-studio` | Origami design and crease pattern validation tool | [zacharyfmarion/ori-studio](https://github.com/zacharyfmarion/ori-studio) |
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

## Adding a cask

1. Check that no official cask exists: `brew search --cask <name>`. The app needs a stable, versioned download (GitHub release DMG or ZIP).
2. Scaffold it in this tap: `brew create --cask --tap meegle84/tap <download-url>`.
3. Fill in `version` and `sha256` (per `arch` when there are separate builds), `url` built from `#{version}`, `name`, `desc`, `homepage`, a `livecheck` block (so the weekly workflow keeps it current), `depends_on :macos` and the `app` stanza. Add `zap trash:` paths found under `~/Library` for the app's bundle id (`Application Support`, `Caches`, `Preferences`, `Saved Application State`, `WebKit`…).
4. Validate: `brew style meegle84/tap/<token>`, `brew audit --cask --new meegle84/tap/<token>` (implies `--strict --online`) and `brew livecheck meegle84/tap/<token>`.
5. Install it: `brew install --cask meegle84/tap/<token>`. When the same version is already installed by hand, add `--adopt` so Homebrew takes over the existing app instead of failing on it (adoption only works for identical artifacts; otherwise remove the manual copy first).
6. Add a row to the table above, then commit as `add: <token> cask`.

Once an app meets the official [acceptable casks](https://docs.brew.sh/Acceptable-Casks) rules (notability and Gatekeeper), propose it to `homebrew/cask` and remove it from this tap with an entry in `tap_migrations.json`, so existing installs move to the official cask.

## Contributing

Pull requests that update or fix an existing cask (version, checksum, broken URL or `livecheck`) are welcome. New casks are not accepted: this tap only holds apps its owner uses. For another app, open an issue or fork the tap.
