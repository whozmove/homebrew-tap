cask "whozmove" do
  version "0.2.0"
  sha256 "d3d855bcde955f4b35263559d2242ede198e96c2786eeeda74cb3c9ebc6a7e03"

  url "https://github.com/whozmove/whozmove/releases/download/v#{version}/Whozmove-#{version}.zip"
  name "Whozmove"
  desc "Floating panel for following and answering Claude Code sessions"
  homepage "https://github.com/whozmove/whozmove"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  # Claude Code, whose sessions Whozmove follows, needs macOS 13 or later.
  depends_on macos: :ventura

  app "Whozmove.app"

  uninstall quit: "com.whozmove.app"

  zap launchctl: "com.whozmove.app",
      trash:     [
        "~/Library/Application Support/Whozmove",
        "~/Library/Caches/com.whozmove.app",
        "~/Library/HTTPStorages/com.whozmove.app",
        "~/Library/LaunchAgents/com.whozmove.app.plist",
        "~/Library/Preferences/com.whozmove.app.plist",
        "~/Library/WebKit/com.whozmove.app",
      ]

  caveats <<~EOS
    Whozmove isn't signed by Apple yet, so macOS stops it the first time you open it.
    Go to System Settings > Privacy & Security and press Open Anyway.

    Its hooks, which show what each Claude Code session is doing, run on Apple's
    command line developer tools. If they aren't installed: xcode-select --install

    To remove it, its login item and its folder: brew uninstall --cask --zap whozmove
    Then take its hooks out of Claude Code: https://github.com/whozmove/whozmove#uninstalling
  EOS
end
