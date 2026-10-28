cask "oripa" do
  version "1.80"
  sha256 "aac1c5f456f9d962a5bb472b8deaa2a280c222fb711b9c68f6640f5937bc5a14"

  url "https://github.com/oripa/oripa/releases/download/v#{version}_release/oripa-#{version}.dmg"
  name "ORIPA"
  desc "Origami crease pattern editor that computes the folded shape"
  homepage "https://github.com/oripa/oripa"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)_release$/i)
    strategy :github_latest
  end

  depends_on :macos

  app "oripa.app", target: "ORIPA.app"

  zap trash: "~/Library/Application Support/oripa"
end
