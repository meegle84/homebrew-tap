cask "origami-diagram-maker" do
  version "1.4.0"
  sha256 "6dc4cda901727e116919d24e8c257c303814b8c8b1b6eef8c4e29b204c005d84"

  url "https://github.com/origamidiagrammaker/origamidiagrammaker.github.io/releases/download/v#{version}/OrigamiDiagramMaker-osx-arm64-Portable.zip"
  name "Origami Diagram Maker"
  desc "Step-by-step origami diagrams from crease patterns"
  homepage "https://origamidiagrammaker.github.io/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Origami Diagram Maker.app"

  zap trash: [
    "~/Library/Application Support/Origami Diagram Maker",
    "~/Library/Caches/Origami Diagram Maker",
  ]
end
