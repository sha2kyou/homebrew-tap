cask "agentpod" do
  version "0.1.18"
  sha256 "f0b3b06cd1a3b833c1aeec8daa2e875225bd2bf97ebbcacb866d06acedcf0f4d"

  url "https://github.com/sha2kyou/agentpod/releases/download/v#{version}/AgentPod_#{version}_macos-arm64.dmg",
      verified: "github.com/sha2kyou/agentpod/"
  name "AgentPod"
  desc "macOS desktop AI agent with chat, skills, MCP, and memory"
  homepage "https://github.com/sha2kyou/agentpod"

  auto_updates true
  app "AgentPod.app"

  postflight do
    app_path = "#{appdir}/AgentPod.app"
    next unless File.exist?(app_path)

    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", app_path],
                   must_succeed: false
  end

  zap trash: [
    "~/.agentpod",
    "~/Library/Preferences/com.agentpod.desktop.plist",
    "~/Library/Saved Application State/com.agentpod.desktop.savedState",
  ]
end
