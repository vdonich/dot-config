#!/usr/bin/env bash

# Close System Preferences just in case
osascript -e 'tell application "System Preferences" to quit'

# Disable startup noise
sudo nvram SystemAudioVolume=%01

# Enable SSH
sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist

# Accelerated playback when adjusting the window size (Cocoa applications).
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Enable "Reduce Motion" setting to make animations slightly less annoying.
sudo defaults write com.apple.universalaccess reduceMotion -bool true

# Disable animations when you open an application from the Dock.
defaults write com.apple.dock launchanim -bool false

# Enable tab in modal dialogs
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Scrollbars visible when scrolling
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Set dark theme
sudo defaults write /Library/Preferences/.GlobalPreferences AppleInterfaceTheme Dark

# Enable autohide on the Dock.
defaults write com.apple.dock autohide -bool true

# Set minimal autohide/show delay for hidden dock
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.5

# Enable scroll gestures for Dock icons
defaults write com.apple.dock scroll-to-open -bool true

# Show only active apps in Dock
defaults write com.apple.dock static-only -bool true

# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable autocorrect
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable auto-capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Diable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Enable tap-to-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Three-finger drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# Save screenshots as PNG
defaults write com.apple.screencapture type -string "png"

# Set plain text as default format in TextEdit
defaults write com.apple.TextEdit RichText -int 0

# Disable Dock magnification
defaults write com.apple.dock magnification -bool false

# Minimize windows into their application's icon
defaults write com.apple.dock minimize-to-application -bool true

# Show indicator lights for open apps in Dock
defaults write com.apple.dock show-process-indicators -bool true

#  Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# Bottom left >> Put display to sleep
defaults write com.apple.dock wvous-bl-corner -int 10
defaults write com.apple.dock wvous-bl-modifier -int 0

# Remove all default apps from the Dock.
defaults write com.apple.dock persistent-apps -array

# Pin Dock to the right edge.
defaults write com.apple.dock orientation -string right

### Finder ###

# Show all filename extensions.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show Finder status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Show Finder path bar
defaults write com.apple.finder ShowPathbar -bool true

# Disable Quick Look animation
defaults write -g QLPanelAnimationDuration -float 0

# Disable Get Info animation (cmd + i)
defaults write com.apple.finder DisableAllAnimations -bool true

# Show ~/Library
chflags nohidden ~/Library

# Show /Volumes
sudo chflags nohidden /Volumes

# Use column view in Finder by default
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# New Finder window opens in home directory
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Disable warning when emptying trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Disable volume change beeps and UI sound effects (may require restart).
defaults write -g com.apple.sound.beep.feedback -integer 0

# Remove Dropbox's green checkmarks in Finder
file=/Applications/Dropbox.app/Contents/Resources/emblem-dropbox-uptodate.icns
[ -e "${file}" ] && mv -f "${file}" "${file}.bak"
unset file

### Safari ###

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Disable delay when rendering web pages
defaults write com.apple.Safari WebKitInitialTimedLayoutDelay 0.25

# Prevent Safari from opening files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Hide Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true && \
defaults write com.apple.Safari IncludeDevelopMenu -bool true && \
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true && \
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true && \
defaults write -g WebKitDeveloperExtras -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Disable autocorrect in Safari
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

# Block pop-up windows
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Disable auto-playing video
#defaults write com.apple.Safari WebKitMediaPlaybackAllowsInline -bool false
#defaults write com.apple.SafariTechnologyPreview WebKitMediaPlaybackAllowsInline -bool false
#defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false
#defaults write com.apple.SafariTechnologyPreview com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false

### iTerm ###

# Don’t display prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

### Activity Monitor ###

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Disable “natural” (Lion-style) scrolling.
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# don't auto-rearrange spaces
defaults write com.apple.dock mru-spaces -bool false

# don't automatically switch to a space containing windows for an app
defaults write com.apple.dock workspaces-auto-swoosh -bool false

# disable window opening and closing animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# fn + fkey for special behavior, not fkey alone
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true

# Spaces Left
#defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 79 "{enabled = 1; value = { parameters = (65535, 123, 11534336); type = 'standard'; }; }"
#defaults write -g NSUserKeyEquivalents -dict-add "Move left a space" -string "@\UF702"
# Spaces Right
#defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 81 "{enabled = 1; value = { parameters = (65535, 124, 11534336); type = 'standard'; }; }"
# Spaces Down
#defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 83 "{enabled = 1; value = { parameters = (65535, 124, 11534336); type = 'standard'; }; }"
# Spaces Up
#defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 85
#"{enabled = 1; value = { parameters = (65535, 124, 11534336); type = 'standard'; }; }"

killall Dock
killall Finder
