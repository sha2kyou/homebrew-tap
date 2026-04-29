cask "claudepilot" do
  version "1.1.8"
  sha256 "b6b3126c5741e6f3958c7d7186147e5bf1075e547805e58996d3807888b6937a"

  url "https://github.com/sha2kyou/ClaudePilot/releases/download/v#{version}/ClaudePilot-v#{version}.dmg",
      verified: "github.com/sha2kyou/ClaudePilot/"
  name "ClaudePilot"
  desc "Menu bar trigger manager for Claude Desktop"
  homepage "https://github.com/sha2kyou/ClaudePilot"

  auto_updates true
  app "ClaudePilot.app"

  postflight do
    app_path = "#{appdir}/ClaudePilot.app"
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", app_path] if File.exist?(app_path)
  end

  zap trash: [
    "~/Library/Application Support/ClaudePilot",
    "~/Library/Preferences/cn.tr1ck.ClaudePilot.plist",
    "~/Library/Saved Application State/cn.tr1ck.ClaudePilot.savedState",
  ]
end
