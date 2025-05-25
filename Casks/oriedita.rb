cask "oriedita" do
  version "1.1.3"
  sha256 "af64613fb24804f128af323af1277a2fb49685e1ffe081a094394087af468165"

  url "https://github.com/oriedita/oriedita/releases/download/v#{version}/Oriedita-#{version}.dmg",
      verified: "github.com/oriedita/oriedita/"
  name "Oriedita"
  desc "Origami crease pattern editor and folding simulator (fork of Orihime)"
  homepage "https://oriedita.github.io/"

  app "Oriedita.app"

  zap trash: [
    "~/Library/Application Support/oriedita",
    "~/Library/Preferences/oriedita.editor.plist",
    "~/Library/Saved Application State/oriedita.editor.savedState",
  ]
end
