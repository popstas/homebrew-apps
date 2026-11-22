cask "talks-reducer" do
  version "1.10.0"
  sha256 "305e5e78aebd1ac98902ebadf01640bcbf45ff8bfca9a44a9c55abf5527353c3"

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
