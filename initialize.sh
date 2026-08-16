#!/usr/bin/env bash
set -e

echo "🚀 Bootstrapping new machine..."

# 1. Install Homebrew if it isn't installed
if ! command -v brew &> /dev/null; then
    echo "🍺 Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Configure brew for the current shell session depending on architecture
    if [ -d "/opt/homebrew/bin" ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [ -d "/usr/local/bin" ]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
else
    echo "✅ Homebrew is already installed."
fi

# 2. Install chezmoi
if ! command -v chezmoi &> /dev/null; then
    echo "📦 Installing chezmoi..."
    brew install chezmoi
else
    echo "✅ chezmoi is already installed."
fi

# 3. Initialize and apply chezmoi
echo "🛠️ Initializing chezmoi from GitHub..."
# Replace adivardhan1000 with the correct username if different
chezmoi init --apply adivardhan1000

echo "🎉 Bootstrap complete!"
