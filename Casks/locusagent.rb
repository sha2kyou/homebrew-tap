cask "locusagent" do
  version "0.3.0"
  sha256 "d8d41d8509dfb61f10e3ab64a0d5dc8bb995f466353bf3a94e826ef41e554946"

  url "https://github.com/sha2kyou/locusagent/releases/download/v#{version}/LocusAgent_#{version}_macos-arm64.dmg",
      verified: "github.com/sha2kyou/locusagent/"
  name "Locus Agent"
  desc "macOS desktop AI agent with chat, skills, MCP, and memory"
  homepage "https://github.com/sha2kyou/locusagent"

  auto_updates true
  app "Locus Agent.app"

  postflight do
    app_path = "#{appdir}/Locus Agent.app"
    next unless File.exist?(app_path)

    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", app_path],
                   must_succeed: false
  end

  zap trash: [
    "~/.locusagent",
    "~/Library/Preferences/com.locusagent.desktop.plist",
    "~/Library/Saved Application State/com.locusagent.desktop.savedState",
  ]
end
