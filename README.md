<!-- PARDUS ON ANDROID -->
# 🐯 PARDUS ON ANDROID 
* 🔓 [Setup](#setup)
* 📲 [Installation](#installation)
* 🖥️ [Install desktops](#desktops)
* ⬇️ [Download scripts to run the desktops](#easy-download)

<br>
<br>  

---  
---  

<br>
<br>

### 🔓 SETUP <a name=setup></a> 
⚠️ Note: If you have downloaded a proot distro desktop on android with pulseaudio and if you have completed the setup commands, go to [Installation Pardus](#installation).

ℹ️ I was inspired by [Droidmaster](https://github.com/LinuxDroidMaster).

Requirements

Install [Termux](https://github.com/termux/termux-app/releases/tag/v0.118.0) for use commands and [Termux-x11](https://github.com/termux/termux-x11/releases/tag/nightly) for display.

Commands for setup:

* Allow access to files. 
  ```sh
  termux-setup-storage 
  ```
* Update your packages
   ```sh
  pkg update && upgrade -y
   ```
* Install packages you need to install on Termux
   ```sh
  pkg install x11-repo
  pkg install termux-x11-nightly
  pkg install tur-repo
  pkg install pulseaudio
  pkg install proot-distro
  pkg install wget
  pkg install git 
   ```
### 🖥️ INSTALLATION PARDUS <a name=installation></a>



