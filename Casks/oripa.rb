cask "oripa" do
  version "1.75"
  sha256 "4757d3398e1bcd01f87b796e02589c53446ccd9b92418694993f0d1d50883e8b"

  url "https://github.com/oripa/oripa/releases/download/v#{version}_release/oripa-#{version}.dmg",
      verified: "github.com/oripa/oripa/"
  name "ORIPA"
  desc "ORIPA is a drawing software dedicated to designing the crease patterns of origami. The unique feature of ORIPA is calculation of the folded shape from the pattern."
  homepage "https://github.com/oripa/oripa"

  app "ORIPA.app"

  zap trash: [
    "~/Library/Application Support/oripa",
  ]
end
