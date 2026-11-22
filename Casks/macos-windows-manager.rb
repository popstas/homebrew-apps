cask "macos-windows-manager" do
  # Версию и sha256 правит работа `update-homebrew` в
  # .github/workflows/release.yml репозитория popstas/macos-windows-manager —
  # sed'ом по этим двум строкам. Правки руками переживут ровно до следующего
  # релиза.
  version "0.8.0"
  sha256 "251d013960c6c012bb19ede947030b3402b6e471e3259b570c5644371494e06c"

  url "https://github.com/popstas/macos-windows-manager/releases/download/v#{version}/macos-windows-manager-macos-arm64-#{version}.zip"
  name "macos-windows-manager"
  desc "Window tracker binding terminal windows to claude-wt sessions"
  homepage "https://github.com/popstas/macos-windows-manager"

  # Сборка идёт на macos-latest, то есть под Apple Silicon. Минимума macOS
  # проект нигде не заявляет, поэтому версия тут не названа.
  depends_on arch: :arm64
  depends_on :macos

  app "macos-windows-manager.app"

  zap trash: [
    "~/.config/macos-windows-manager",
    "~/.local/state/macos-windows-manager",
    "~/Library/Saved Application State/pro.popstas.macos-windows-manager.savedState",
  ]

  caveats <<~EOS
    Grant Accessibility in System Settings > Privacy & Security, and grant it
    AGAIN after every upgrade. The permission is bound to the code signature, and
    an unsigned build gets a fresh one each time it is built. Nothing announces
    the loss: the process stays alive, the icon stays in the status bar, and the
    window list goes stale.

    The app is not signed with an Apple Developer ID, so Gatekeeper also refuses
    it with a "damaged" message unless it is installed without quarantine:

      brew install --cask --no-quarantine popstas/apps/macos-windows-manager

    macos-windows-manager lives in the status bar and has no Dock icon. It does
    not start on login on its own — add it in System Settings > General >
    Login Items.
  EOS
end
