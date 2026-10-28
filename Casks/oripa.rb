cask "oripa" do
  version "1.75"
  sha256 "4757d3398e1bcd01f87b796e02589c53446ccd9b92418694993f0d1d50883e8b"

  url "https://github.com/oripa/oripa/releases/download/v#{version}_release/oripa-#{version}.dmg"
  name "ORIPA"
  desc "Origami crease pattern editor that computes the folded shape"
  homepage "https://github.com/oripa/oripa"

  depends_on :macos

  app "ORIPA.app"

  zap trash: "~/Library/Application Support/oripa"
end
