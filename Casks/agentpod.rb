cask "agentpod" do
  version "0.1.15"
  sha256 "a31fbd773782a8360797d99a6c761036b0c504b3e69451e5ff239ca9f0d87f6d"

  url "https://github.com/sha2kyou/agentpod/releases/download/v#{version}/AgentPod_#{version}_aarch64.dmg",
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
