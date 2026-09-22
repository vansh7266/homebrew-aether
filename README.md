# Aether for macOS (Homebrew)

**1. Install Homebrew** (skip if `brew --version` already works)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

At the end it prints "Next steps" with two commands that put `brew` on your PATH - run them.

**2. Install Aether**

```bash
brew install vansh7266/aether/aether
```

**3. Set up and start**

```bash
aether setup
aether start
```

Then press **Ctrl+Shift+Space**, and allow Microphone and Accessibility when macOS asks.

Update: `brew update && brew upgrade aether` - Uninstall: `aether uninstall`, then `brew uninstall aether`.
Downloads come from [aether-releases](https://github.com/vansh7266/aether-releases).
