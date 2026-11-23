cask "ori-studio" do
  arch arm: "aarch64", intel: "x64"

  version "0.10.0"
  sha256 arm:   "4c42c3c77c4d90605e62f52859e91cd76649f116fee669e7121b4e0dda399f76",
         intel: "8dd9bd1495d4d72368cd0a3c5248eb23a1f299e17433e83e381e5e5dec048015"

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
