cask "agentpod" do
  version "0.1.2"
  sha256 "af20700af7a4870500d93d5c5db95e98e14c1a79830944292bfdb75681cbce6d"

  url "https://github.com/sha2kyou/agentpod/releases/download/v#{version}/AgentPod_#{version}_aarch64.dmg",
      verified: "github.com/sha2kyou/agentpod/"
  name "AgentPod"
  desc "macOS desktop AI agent with chat, skills, MCP, and memory"
  homepage "https://github.com/sha2kyou/agentpod"

  auto_updates true
  app "AgentPod.app"

  postflight do
    app_path = "#{appdir}/AgentPod.app"
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", app_path] if File.exist?(app_path)
  end

  zap trash: [
    "~/.agentpod",
    "~/Library/Preferences/com.agentpod.desktop.plist",
    "~/Library/Saved Application State/com.agentpod.desktop.savedState",
  ]
end
