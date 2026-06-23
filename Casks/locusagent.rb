cask "locusagent" do
  version "0.3.2"
  sha256 "2883dacaeb06ecf7c0a3d38e461de61113e6b684af228c19bf0720745c5de573"

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
    "~/Library/Preferences/cn.tr1ck.locus.plist",
    "~/Library/Saved Application State/cn.tr1ck.locus.savedState",
    "~/Library/Preferences/com.locusagent.desktop.plist",
    "~/Library/Saved Application State/com.locusagent.desktop.savedState",
  ]
end
