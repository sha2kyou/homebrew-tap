cask "claudepilot" do
  version "1.1.9"
  sha256 "bfd30e0f757ee8e2c5eb26cd47c397bcf1842cd8377766500e01c54e905786fa"

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
