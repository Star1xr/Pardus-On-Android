<!-- PARDUS ON ANDROID -->
# PARDUS ON ANDROID 
### 🔓 SETUP <a name=setup></a> 
ℹ️ Note: If you have downloaded a proot distro desktop on android with pulseaudio and if you have completed the setup commands, go to [Installation Pardus](#installation). 

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
### 🖥️ INSTALL PARDUS <a name=installation></a>



