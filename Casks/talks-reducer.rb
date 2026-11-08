cask "talks-reducer" do
  version "1.7.1"
  sha256 "f4a85b2603801ed336ecbd9b5af929ae72d0c2c5f885398b16e209d0f32a6f72"

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
