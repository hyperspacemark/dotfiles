#!/usr/bin/env bash
set -euo pipefail

echo "Applying macOS defaults..."

# -------------------------
# Trackpad
# -------------------------

# Three finger drag (lives in Accessibility, needs both domains)
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -int 1

# Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Two-finger right-click
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true

# Two-finger double-tap (smart zoom)
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -int 1

# Three-finger tap (disable — conflicts with three-finger drag)
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 0

# -------------------------
# Keyboard
# -------------------------

# Fast key repeat
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Disable autocorrect annoyances
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# -------------------------
# Dock
# -------------------------

# Auto-hide
defaults write com.apple.dock autohide -bool true

# Icon size
defaults write com.apple.dock tilesize -int 64

# -------------------------
# Finder
# -------------------------

# Show path bar at bottom
defaults write com.apple.finder ShowPathbar -bool true

# Column view as default
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# -------------------------
# Touch ID for sudo
# -------------------------

# Uses /etc/pam.d/sudo_local (Sonoma+) which persists across macOS updates
if ! grep -q "pam_tid.so" /etc/pam.d/sudo_local 2>/dev/null; then
  echo "Enabling Touch ID for sudo (requires sudo)..."
  echo "auth       sufficient     pam_tid.so" | sudo tee /etc/pam.d/sudo_local > /dev/null
  echo "Touch ID for sudo enabled."
else
  echo "Touch ID for sudo already configured."
fi

# -------------------------
# Apply
# -------------------------

killall Dock
killall Finder

echo
echo "Done. Some changes (e.g. three-finger drag) may require a logout to take effect."
