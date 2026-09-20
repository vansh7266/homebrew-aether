# Aether - your personal AI, living on your desktop.
# Updated automatically by packaging/publish.py; the source stays private.
class Aether < Formula
  desc "Your personal AI, living on your desktop"
  homepage "https://github.com/vansh7266/aether-releases"
  version "1.0.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/vansh7266/aether-releases/releases/download/v1.0.0/aether-1.0.0-macos-arm64.zip"
      sha256 "b3c1f15d0c0b5e02bb993c1ba96593765afea88b426bb72a253ac82ea6b2450e"
    end
  end

  def install
    # Homebrew steps inside a single top-level folder, so the download may arrive either as
    # "Aether.app" or as the contents of it.
    if (buildpath/"Contents").exist?
      (prefix/"Aether.app").install Dir["*"]
    else
      prefix.install "Aether.app"
    end
    # The command points at the stable path, so starting at sign-in keeps working after an update.
    (bin/"aether").write_env_script opt_prefix/"Aether.app/Contents/MacOS/aether-bin", {}
  end

  def caveats
    <<~EOS
      First time:  aether setup     (asks for your Sarvam API key)
      Then:        aether start     and press Ctrl+Shift+Space

      macOS will ask for Microphone and Accessibility permission the first time.
    EOS
  end

  test do
    assert_match "Aether V#{version}", shell_output("#{bin}/aether --version")
  end
end
