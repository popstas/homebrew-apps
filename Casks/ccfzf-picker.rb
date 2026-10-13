cask "ccfzf-picker" do
  # Версию и sha256 правит работа `update-homebrew` в
  # .github/workflows/release.yml репозитория popstas/ccfzf-picker — sed'ом по
  # этим двум строкам. Правки руками переживут ровно до следующего релиза.
  version "0.11.0"
  sha256 "832b17f025b02a5edf831d90a79dd1b500222b72f9da6e729f9fac926b7c2b7b"

  url "https://github.com/popstas/ccfzf-picker/releases/download/v#{version}/ccfzf-picker-macos-arm64-#{version}.zip"
  name "ccfzf-picker"
  desc "Picker for Claude Code sessions living on this and other machines"
  homepage "https://github.com/popstas/ccfzf-picker"

  # Сборка идёт на macos-latest, то есть под Apple Silicon. Universal не
  # собирается намеренно — он удвоил бы вес приложения.
  depends_on arch: :arm64
  depends_on :macos

  app "ccfzf-picker.app"

  zap trash: [
    "~/.config/ccfzf-picker",
    "~/Library/Saved Application State/pro.popstas.ccfzf-picker.savedState",
  ]

  caveats <<~EOS
    The app is not signed with an Apple Developer ID, so Gatekeeper refuses it
    with a "damaged" message unless it is installed without quarantine:

      brew install --cask --no-quarantine popstas/apps/ccfzf-picker

    ccfzf-picker lives in the menu bar and has no Dock icon. Copy
    config.example.yml from the repository to
    ~/.config/ccfzf-picker/config.yaml before the first run.
  EOS
end
