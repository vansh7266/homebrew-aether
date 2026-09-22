# Aether - your personal AI, living on your desktop.
# Updated automatically by packaging/publish.py; the source stays private.
class Aether < Formula
  desc "Your personal AI, living on your desktop"
  homepage "https://github.com/vansh7266/aether-releases"
  version "1.0.3"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/vansh7266/aether-releases/releases/download/v1.0.3/aether-1.0.3-macos-arm64.zip"
      sha256 "0353c431f8df5c03c27fdcf372076fc413a14961c69ade2df4a754a31b9ce0a7"
    end
    on_intel do
      url "https://github.com/vansh7266/aether-releases/releases/download/v1.0.3/aether-1.0.3-macos-x64.zip"
      sha256 "586b87868cae08f4ff7164602a99bb0fd061cfd104cede1f2d6cf4282f6c0059"
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
