cask "talks-reducer" do
  version "1.9.1"
  sha256 "86f61db3ce3914788b3204586c1b38dc8bac94599fb5a61cbf78aa8a7342445c"

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
