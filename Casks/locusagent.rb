cask "locusagent" do
  version "0.4.0"
  sha256 "863142da2a47a8ef00f0800f987c75a252e1fcdb48fe708228ab05107e25c862"

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
