cask "whozmove" do
  version "0.3.0"
  sha256 "2835f022807b0ded48b63b637f987bc57d54f434c2c1d3f5a8738cc50351818d"

  url "https://github.com/whozmove/whozmove/releases/download/v#{version}/Whozmove-#{version}.zip"
  name "Whozmove"
  desc "Floating panel for following and answering Claude Code sessions"
  homepage "https://github.com/whozmove/whozmove"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

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
    Its hooks, which show what each Claude Code session is doing, run on Apple's
    command line developer tools. If they aren't installed: xcode-select --install

    To remove it, its login item and its folder: brew uninstall --cask --zap whozmove
    Then take its hooks out of Claude Code: https://github.com/whozmove/whozmove#uninstalling
  EOS
end
