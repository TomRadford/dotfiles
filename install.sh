#!/bin/zsh

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Homebrew
## Install
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

## Taps
echo "Tapping Brew..."
brew tap FelixKratz/formulae
brew tap koekeishiya/formulae

## Formulae
echo "Installing Brew Formulae..."
brew install wget
# ripgrep is a line-oriented search tool that recursively searches your current directory for a regex pattern
brew install ripgrep
brew install mas
brew install gh
brew install ifstat
brew install switchaudio-osx
brew install skhd
brew install sketchybar
brew install borders
brew install jq

#  Window Manager
brew install --cask nikitabobko/tap/aerospace 
cp .aerospace.toml $HOME/.aerospace.toml # handles its own autostart
brew install aerospace

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

### Terminal
brew install zsh-autocomplete
brew install btop
brew install lazygit
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Casks
echo "Installing Brew Casks..."
### Terminals & Browsers
brew install --cask iterm2
brew install --cask arc
brew install --cask zen
brew install --cask raycast
brew install --cask spotify
brew install --cask vlc
brew install --cask cursor
brew install --cask bitwarden

### Fonts
brew install --cask sf-symbols
brew install --cask font-hack-nerd-font
brew install --cask font-jetbrains-mono
brew install --cask font-fira-code

# Obligatory
brew install --cask git-credential-manager
brew install --cask google-drive
brew install --cask orbstack

# macOS Settings
echo "Changing macOS defaults..."
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.spaces spans-displays -bool false
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock "mru-spaces" -bool "false"
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain _HIHideMenuBar -bool true
defaults write NSGlobalDomain AppleHighlightColor -string "0.65098 0.85490 0.58431"
defaults write NSGlobalDomain AppleAccentColor -int 1
defaults write com.apple.screencapture location -string "$HOME/Desktop"
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.Finder AppleShowAllFiles -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder ShowStatusBar -bool false
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write -g NSWindowShouldDragOnGesture YES
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
defaults write com.apple.finder CreateDesktop false
defaults write com.apple.spaces spans-displays -bool true && killall SystemUIServer # DISABLES Displays have separate Spaces

sudo killall Finder

# echo "Copying Configuration Files..." 
brew install powerlevel10k
cp .zshrc $HOME/.zshrc
cp .p10k.zsh $HOME/.p10k.zsh
cp com.googlecode.iterm2.plist $HOME/Library/Preferences/com.googlecode.iterm2.plist
cp -r .config $HOME


# Installing Fonts
git clone git@github.com:shaunsingh/SFMono-Nerd-Font-Ligaturized.git /tmp/SFMono_Nerd_Font
mv /tmp/SFMono_Nerd_Font/* $HOME/Library/Fonts
rm -rf /tmp/SFMono_Nerd_Font/

# curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.23/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf
brew install --cask font-sketchybar-app-font  

# Start Services
echo "Starting Services (grant permissions)..."
brew services start skhd
skhd --start-service


brew services start sketchybar
brew services start borders
brew services start svim
   
csrutil status
echo "Installation complete...\n"
