<!-- PARDUS ON ANDROID -->
# 📚 INDEX

> [!NOTE]  
>If you have downloaded a proot distro desktop on android with pulseaudio and if you have completed the setup commands, start with [Installation Pardus](#installation).


> [!NOTE]
>I was inspired by [Droidmaster](https://github.com/LinuxDroidMaster).

# PROOT-DISTRO(🐯 PARDUS) 
* 🔓 [Setup](#setup)
* 📲 [Proot installation](#installation)
* 🖥️ [Install desktops](#desktops)
* ⬇️ [Download scripts to run the desktops](#easy-download)

### 🔓 SETUP <a name=setup></a> 

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

First, install pardus and login on proot-distro. 

```
pd install pardus
pd login pardus
```

Change repo with debian, because pardus repo is not working. 

```
nano /etc/apt/sources.list
```

Add these line to end of file. 

```
deb http://ftp.debian.org/debian stable main contrib non-free
```

Then update packages and install the requred packages. 

```
apt update
apt install sudo nano neofetch ##neofetch is optional.
```
