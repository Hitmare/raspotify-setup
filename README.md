# Raspotify on OrangePi Zero3 (1GB RAM)

A small, very specific setup guide for running **Raspotify** on an **OrangePi Zero3 (1GB RAM)**.  
I wrote this down so I don’t have to rebuild everything from scratch _again_.

---

## 📁 File Placement Overview

These are the files included in this repo and where they must be installed on the system.

### Config file
- **conf** → `/etc/raspotify/conf`  
  Replaces the default Raspotify configuration.

### Audio device updater
- **update_audio.sh** → `/usr/local/bin/`  
  - `chmod +x /usr/local/bin/update_audio.sh`

### Systemd service
- **update-audio.service** → `/etc/systemd/system/`  
  - `systemctl daemon-reload`  
  - `systemctl enable update-audio.service`

### udev rule
- **99-usb-audio-update.rules** → `/etc/udev/rules.d/`  
  - `udevadm control --reload-rules`  
  - `udevadm trigger`

---

## 🎧 Purpose of This Setup

This configuration ensures that:

- The correct audio output device is detected automatically  
- The Raspotify config is updated accordingly  
- Raspotify restarts itself when needed  
- USB audio devices trigger an automatic refresh  

---

## 📦 Raspotify Version Used

At the time of writing, the installation was based on:

**`raspotify_0.48.1.librespot.v0.8.0-ea81314_arm64.deb`**

This package was obtained from the  
👉 [Raspotify GitHub Project](https://github.com/dtcooper/raspotify)
