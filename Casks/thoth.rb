cask "thoth" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.0"
  sha256 arm:   "c86d9d8693dc92d7c87b366b3bfa45aa74be0a22d262129e9defea9d7e42ee21",
         intel: "43a57a672896d73e90e7d44bf45e49bcede3cd2534c84052189b833402fdc2a7"

  url "https://github.com/anitnilay20/thoth/releases/download/v#{version}/Thoth_#{version}_#{arch}.dmg"
  name "Thoth"
  desc "Fast desktop workspace for exploring JSON, NDJSON, and structured data"
  homepage "https://github.com/anitnilay20/thoth"

  app "Thoth.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Thoth.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.thoth.app",
    "~/Library/Application Support/thoth",
    "~/Library/Preferences/com.thoth.app.plist",
  ]
end
