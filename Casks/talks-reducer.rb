cask "talks-reducer" do
  version "1.9.0"
  sha256 "4c76a732bafdab7510353ca9cc6111d47ef587ae58889f758b23f7d71ba1a3e1"

  url "https://github.com/popstas/talks-reducer/releases/download/v#{version}/talks-reducer-macos.app-#{version}.zip"
  name "Talks Reducer"
  desc "Remove silent parts from video recordings"
  homepage "https://github.com/popstas/talks-reducer"

  depends_on :macos

  app "talks-reducer.app"

  zap trash: "~/Library/Preferences/talks-reducer"

  caveats <<~EOS
    #{token} is not signed with an Apple Developer ID.
    macOS may show a warning on first launch.
    To allow it, go to System Settings > Privacy & Security and click "Open Anyway".
  EOS
end
