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

**Update**

```bash
brew update && brew upgrade aether
```

**Remove Aether completely** (the app, its memory, logs, settings and the API key in your Keychain)

```bash
aether uninstall
```

Answer `y`, then `y` again, then type `DELETE`. Then:

```bash
brew uninstall aether
brew untap vansh7266/aether
```

Optional: to also clear the Microphone and Accessibility permissions macOS gave Aether, run
`tccutil reset All Aether`.
Downloads come from [aether-releases](https://github.com/vansh7266/aether-releases).
