cask "claudepilot" do
  version "1.1.10"
  sha256 "79596ae333d0fea99f66e272ea7d7183b644635ecb49762083395b3df39ddc9f"

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
