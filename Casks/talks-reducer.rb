cask "talks-reducer" do
  version "1.4.1"
  sha256 "97d6ac2747f1a6dc045a22d4fa9490e9091de11e05bc4592387e64bf9cdebd69"

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
