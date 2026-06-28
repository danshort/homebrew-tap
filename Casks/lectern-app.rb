# Homebrew cask for the native macOS app, distributed alongside the `lectern`
# CLI formula. `version`/`sha256` are updated by the macOS-app release workflow;
# the cask is published to the danshort/homebrew-tap tap.
#
#   brew install --cask danshort/tap/lectern-app
#
# The `caveats` block documents the one-time Gatekeeper step for the interim,
# unnotarized builds. Remove it once notarized (Developer-ID) builds ship.
cask "lectern-app" do
  version "0.21.0"
  sha256 "5f91ea5c477b585c8ba9133576005bd717a390bca25ad40654e8a3ccddc0aed7"

  url "https://github.com/danshort/lectern/releases/download/v#{version}/Lectern-#{version}.zip"
  name "Lectern"
  desc "Native macOS reader for OpenSpec artifacts"
  homepage "https://github.com/danshort/lectern"

  depends_on macos: ">= :ventura"

  app "Lectern.app"

  caveats <<~EOS
    Preview builds are ad-hoc signed but not yet notarized, so macOS blocks the
    first launch. To open it, either:

      • Terminal (works on every macOS version):
          xattr -dr com.apple.quarantine "#{appdir}/Lectern.app"

      • Or: open System Settings -> Privacy & Security, scroll to Security, and
        click "Open Anyway" next to the Lectern message, then launch again.
        (On macOS 15 Sequoia and later, the old right-click -> Open no longer
        offers a bypass — use one of the above.)

    This step goes away once notarized builds ship.
  EOS
end
