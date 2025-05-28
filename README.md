# Comprehensive Arch Linux Guide for a Modern Hyprland Workstation
**HP Pavilion x360 14-cd0xxx | Intel CPU | Integrated Graphics | Hyprland | 2025**

# TODO
- add multilib at the start of the script
- add nvida, amd or intel gpu drivers as an option


## ✨ Preliminary Considerations

*   **Kernel Choice**:
    *   linux
    *   linux-zen (default on boot)
*   **Firmware Updates**:
    *   fwupd [pacman]

## 💻 System Core & Foundation

These packages form the absolute bedrock of your Arch Linux installation, handling boot, system services, display management, and essential graphical components.

### Bootloader and Microcode
*   grub [pacman]
*   intel-ucode [pacman]

### Display Server & Compositor
*   hyprland [pacman]
*   wayland [pacman]
*   wayland-protocols [pacman]

### Graphics Drivers (for Intel Integrated Graphics)
*   mesa [pacman]
*   vulkan-intel [pacman]
*   intel-media-driver [pacman]
*   libva-intel-driver [pacman]
*   libva-utils [pacman]

### Display Manager & Authentication
*   sddm [pacman]
*   polkit [pacman]
*   hyprland-polkit-agent [pacman]

### Essential Display Protocol Portals
*   xdg-desktop-portal-hyprland [pacman]
*   xdg-desktop-portal-gtk [pacman]

### Core Development Tools
*   base-devel [pacman]
*   git [pacman]


## ⚙️ System Utilities & Configuration

This section covers essential tools for managing your system, shell, and basic hardware functionalities.

### Terminal, Shell & Command Line Enhancements
*   foot [pacman]
*   tmux [pacman]
*   zsh [pacman]
*   zsh-completions [pacman]
*   zsh-syntax-highlighting [pacman]
*   zsh-autosuggestions [pacman]
*   starship [pacman]

### Core System Utilities
*   networkmanager [pacman]
*   network-manager-applet [pacman]
*   gnome-keyring [pacman]
*   bluez [pacman]
*   bluez-utils [pacman]
*   blueman [pacman]
*   brightnessctl [pacman]
*   udiskie [pacman]

### Modern CLI Tools (Your Preference)
*   bat [pacman]
*   eza [pacman]
*   fd [pacman]
*   ripgrep [pacman]
*   fzf [pacman]
*   vivid [pacman]
*   whois [pacman]

### System Monitoring
*   btop [pacman]
*   fastfetch [pacman]

### Archive & Network Tools
*   curl [pacman]
*   wget [pacman]
*   unzip [pacman]
*   zip [pacman]
*   tar [pacman]
*   unrar [pacman]
*   rsync [pacman]
*   7zip [pacman]
*   ark [pacman]


## 🎨 Display, Theming & Aesthetics

This section covers elements that define the look and feel of your Hyprland desktop.

### Hyprland Specific Utilities
*   hyprpaper [pacman]
*   hyprlock [pacman]
*   hyprpicker [pacman]
*   hypridle [pacman]

### Notification & Status Bar
*   swaync [pacman]
*   waybar [pacman]
*   waybar-update [AUR]

### Application Launchers
*   rofi-wayland [AUR]
*   rofi-emoji [AUR]

### Theming Tools
*   nwg-look [pacman]
*   kvantum [pacman]
*   qt5ct [pacman]
*   qt6ct [pacman]

### Cursor Themes (AUR)
*   catppuccin-cursors-mocha [AUR]

### Fonts
*   **Essential Fonts**:
    *   ttf-liberation [pacman]
    *   ttf-dejavu [pacman]
    *   noto-fonts [pacman]
    *   noto-fonts-emoji [pacman]
    *   noto-fonts-cjk [pacman]
*   **Programming Fonts**:
    *   ttf-jetbrains-mono [pacman]
    *   ttf-jetbrains-mono-nerd [pacman]


## 🖼️ Screenshots & Clipboard

Tools for capturing your screen and managing clipboard history.

*   grim [pacman]
*   slurp [pacman]
*   hyprshot [AUR]
*   satty [pacman]
*   wl-clipboard [pacman]
*   cliphist [pacman]


## 🎵 Audio & Media Control

A complete PipeWire audio stack with essential control utilities.

### PipeWire Audio Stack
*   pipewire [pacman]
*   wireplumber [pacman]
*   pipewire-audio [pacman]
*   pipewire-pulse [pacman]
*   pipewire-alsa [pacman]
*   pipewire-jack [pacman]
*   lib32-pipewire [pacman]

### Audio Controls and Utilities
*   pavucontrol [pacman]
*   pamixer [pacman]
*   playerctl [pacman]
*   easyeffects [pacman]
*   qpwgraph [pacman]
*   cava [pacman]


## 📁 File Management

GUI and terminal-based file managers with useful utilities.

### GUI File Managers (Choose one or more)
*   dolphin [pacman]

### Terminal File Managers (Choose one or more)
*   yazi [pacman]

### File Manager Utilities
*   ffmpegthumbnailer [pacman]
*   ueberzugpp [AUR]
*   ffmpeg [pacman] (for yazi)
*   poppler [pacman] (for yazi)
*   imagemagick [pacman] (for yazi)
*   resvg [AUR] (for yazi)


## 🌐 Web Browsing & Communication

### Web Browsers (Choose one or more)
*   zen-browser-bin [AUR]

### Communication
*   vesktop-bin [pacman]


## 📝 Productivity & Office

### Office Suite
*   libreoffice-fresh [pacman]

### Note-taking & Knowledge Management
*   obsidian [pacman]

---

## 🛠️ Development Tools

### Code Editors
*   neovim [pacman]
*   visual-studio-code-bin [AUR]

### Version Control
*   lazygit [AUR]
*   git-delta [AUR]
*   github-cli [pacman]
*   commitizen [uv (python package manager]

### Languages and Runtimes (Install only what you need)
*   nodejs [pacman]
*   npm [pacman]
*   python [pacman]
*   uv [curl]
*   rust [pacman]
*   rustup [pacman]
*   cargo [pacman]
*   go [pacman]
*   jdk-openjdk [pacman]


## 🎬 Multimedia & Creativity

### Video Players
*   mpv [pacman]
*   uosc [curl]

### Image Viewers and Editors
*   qimgv [pacman]

### Video/Audio Editing & Streaming
*   obs-studio [pacman]


## 🔧 Hardware Management & Display Configuration

### Partition Management
*   gparted [pacman]

### Wayland Display Configuration
*   wlr-randr [pacman]
*   kanshi [pacman]
*   uwsm [pacman]

### Power Management
*   auto-cpufreq [git clone installer script] (optional if on laptop)


## 🔐 Security & Privacy

*   ufw [pacman]
*   gufw [pacman]
*   gnupg [pacman]


## 📦 Package Management

### AUR Helper (Choose one)
*   yay [makepkg]


## 📋 Installation Priority Order


## 🎨 Theming & Customization
