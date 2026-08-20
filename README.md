# homebrew-cinelark

Project Homebrew tap for [CineLark](https://github.com/SamsonLab/cinelark), a
TV-first macOS media library client using IINA for playback.

## Install

```sh
brew install --cask samsonlab/cinelark/cinelark
```

## Upgrade

```sh
brew update
brew upgrade --cask cinelark
```

The release workflow in the main CineLark repository updates this tap. Releases
use a stable project-controlled self-signed code identity and are not
Apple-notarized. The Cask pins the release DMG by SHA-256 and removes quarantine
after installation.
