#!/bin/bash

packagesdnf="glab \
  exa \
  procs \
  tokei \
  tealdeer \
  ripgrep \
  ranger\
  emacs \
  neovim \
  neofetch"

packagesflatpak="cc.arduino.IDE2 \
  com.discordapp.Discord \
  com.logseq.Logseq \
  com.mattjakeman.ExtensionManager \
  com.rafaelmardojai.Blanket \
  com.raggesilver.BlackBox \
  com.spotify.Client \
  com.usebottles.bottles \
  info.febvre.Komikku \
  io.bassi.Amberol \
  md.obsidian.Obsidian \
  me.kozec.syncthingtk \
  org.gnome.Boxes \
  org.gnome.Builder \
  org.gnome.Geary \
  org.gnome.Solanum \
  org.gnome.World.PikaBackup \
  org.gnome.World.Secrets \
  org.gnome.gitlab.somas.Apostrophe \
  org.pitivi.Pitivi \
  org.telegram.desktop \
  re.sonny.Tangram"

# Install packages
echo "Installing DNF packages..."
sudo dnf install $packagesdnf
echo "Installing Flatpak packages..."
flatpak install flathub $packageflatpak
echo "Package installation complete."

