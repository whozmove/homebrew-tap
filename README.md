# Whozmove's Homebrew tap

[Whozmove](https://github.com/whozmove/whozmove) is a floating macOS panel listing every Claude Code session on your
Mac, with what each is doing and whose move it is.

## Install

```bash
brew install --cask whozmove/tap/whozmove
```

Whozmove isn't signed by Apple yet, so macOS stops it the first time you open it: go to System Settings › Privacy &
Security and press **Open Anyway**, once. Whozmove then sets itself up, adding its hooks to Claude Code and opening
at every login (turned off and on with **Open at Login** in its menu). Needs a Mac with Apple silicon and macOS 13 or
later, and, for the hooks, Apple's command line developer tools (`xcode-select --install`).

`brew upgrade` brings each new version.

## Uninstall

```bash
brew uninstall --cask --zap whozmove
claude plugin uninstall whozmove@whozmove
claude plugin marketplace remove whozmove
```

The first line takes the app, its login item and its folder; the other two take its hooks out of Claude Code (or use
`/plugin` in a Claude Code session). A plain `brew uninstall --cask whozmove` leaves the login item and the folder.
