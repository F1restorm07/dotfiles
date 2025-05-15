# Setup
***

## Required Packages

### Common
**system setup**
- brightnessctl
- pipewire
    - pipewire-alsa
    - pipewire-gstreamer
    - wireplumber
    - pipewire-pulse
- river
- swaybg
- tofi
- yambar
- mako
- flatpak
    - enable the flathub repo:
        - `sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo`
- zsh
- mesa

**applications**
- foot
- sxiv

**cli commands**
- bat
- btop
- eza
- zoxide

**tooling**
- neovim
- grim
- slurp
- zathura
- librewolf
    - `sudo flatpak install flathub io.gitlab.librewolf-community`

**changing login shell**
`chsh -s /bin/zsh`

### Void Linux
**setup packages**
- seatd
    - setting up the seatd service:
        - `sudo ln -s /etc/sv/seatd /var/service`
        - `sudo sv up seatd`
    - adding the user to the _seatd group: `sudo usermod -a -G _seatd \<user\>`
    - add the XDG_RUNTIME_DIR: `sudo mkdir /run/user/$(id -u)`
- pam_rundir
    - add the pam_rundir entry to /etc/pam.d/system-login
        - `-session optional pam_rundir.so`
    - this automatically sets up XDG_RUNTIME_DIR when you log in
