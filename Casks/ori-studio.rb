cask "ori-studio" do
  arch arm: "aarch64", intel: "x64"

  version "0.9.0"
  sha256 arm:   "22a23e084c50e2e94e7e56931473eac9edcee6409adf24df326443e200a3b638",
         intel: "d6228e9af5d72fe299abc4240fb95b1c3f11eab9416b28a6acb9746505e85bdc"

  url "https://github.com/zacharyfmarion/ori-studio/releases/download/v#{version}/Ori.Studio_#{version}_#{arch}.dmg"
  name "Ori Studio"
  desc "Origami design and crease pattern validation tool"
  homepage "https://oristudio.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "Ori Studio.app"

  zap trash: [
    "~/Library/Application Support/com.zacharymarion.oristudio",
    "~/Library/Caches/com.zacharymarion.oristudio",
    "~/Library/Preferences/com.zacharymarion.oristudio.plist",
    "~/Library/Saved Application State/com.zacharymarion.oristudio.savedState",
    "~/Library/WebKit/com.zacharymarion.oristudio",
  ]
end
