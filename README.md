# psmon/homebrew-codescan

Homebrew tap for [CodeScan](https://github.com/psmon/CodeScan).

## Install

```bash
brew tap psmon/codescan
brew install codescan
codescan --version
```

Or one-shot:

```bash
brew install psmon/codescan/codescan
```

## Supported platforms

| OS | Architecture | Status |
|----|--------------|--------|
| macOS | arm64 (Apple Silicon) | Supported |
| macOS | x64 (Intel) | Not supported in v1 — build from source or use Rosetta with the arm64 build |

## User data

CodeScan stores DB, logs, and config under `~/.codescan/`. That directory is preserved across upgrade and uninstall.

The v1 binary is not notarized. If macOS Gatekeeper blocks first run:

```bash
xattr -d com.apple.quarantine $(brew --prefix)/bin/codescan
```

Or allow it from System Settings → Privacy & Security.

## How this tap is maintained

The formula is generated from a template in the main CodeScan repo at [`packaging/homebrew/`](https://github.com/psmon/CodeScan/tree/main/packaging/homebrew) via `update-formula.sh`. For each release, the SHA256 from `checksums.txt` is substituted in.

See [`Docs/install-distribution-strategy.md`](https://github.com/psmon/CodeScan/blob/main/Docs/install-distribution-strategy.md) in the main repo for the full distribution plan.
