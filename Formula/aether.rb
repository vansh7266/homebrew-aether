# Aether - your personal AI, living on your desktop.
# Updated automatically by packaging/publish.py; the source stays private.
class Aether < Formula
  desc "Your personal AI, living on your desktop"
  homepage "https://github.com/vansh7266/aether-releases"
  version "1.0.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/vansh7266/aether-releases/releases/download/v1.0.1/aether-1.0.1-macos-arm64.zip"
      sha256 "51c9d8b7a01a02322ce15e96a93deb89fa90202d8930d71c8055739c4a12c54d"
    end
    on_intel do
      url "https://github.com/vansh7266/aether-releases/releases/download/v1.0.1/aether-1.0.1-macos-x64.zip"
      sha256 "d6e822003dba5e217ec49a568dc3c06d34ecd9f527a3cf0969a270f75143908a"
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
