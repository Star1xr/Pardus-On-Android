<!-- PARDUS ON ANDROID -->
# 📚 INDEX

> [!NOTE]  
>If you have downloaded a proot distro desktop on android with pulseaudio and if you have completed the setup commands, start with [Installation Pardus](#installation).


> [!NOTE]
>I was inspired by [Droidmaster](https://github.com/LinuxDroidMaster).If Xfce4 dont works, use another repo, like parrot os repo or ubuntu repo. 

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
### 📲 INSTALLATION PARDUS <a name=installation></a>

First, install pardus and login on proot-distro. 

```
pd install pardus
pd login pardus
```

Change repo with debian, because pardus repo is not working. (If you think that the operating system changes when you change the repo, you are wrong, type neofetch and see.)

```
nano /etc/apt/sources.list
```

Delete all text and add these line to file. 

```
deb http://depo.pardus.org.tr/pardus yirmiuc-deb main contrib non-free non-free-firmware
deb-src http://depo.pardus.org.tr/pardus yirmiuc-deb main contrib non-free non-free-firmware
deb http://ftp.debian.org/debian stable main contrib non-free
```

Then update packages and install the requred packages. 

```
apt update && upgrade -y
apt install sudo nano neofetch ##neofetch is optional.
```

# 👤 Adding users part 
Run **adduser droidmaster and set password, enter on all the information form, and press y enter.**
Then run **nano /etc/sudoers** and write **droidmaster ALL=(ALL:ALL) ALL** to root part. 

Then install desktops. 

### 🖥️ INSTALL DESKTOPS  <a name=desktops></a>

Login to pardus with user:

```
pd login pardus --user droidmaster
```

Install desktops(Choose one):

```
sudo apt install xfce4 ##other desktops: change xfce4 part to

LXDE: lxde

GNOME: gnome-shell gnome-terminal gnome-tweaks gnome-software nautilus gnome-shell-extension-manager/

CINNAMON: cinnamon
```

DON'T USE KDE!

### ⬇️ INSTALL SCRIPTS TO RUN DESKTOPS <a name=easy-download></a>

xfce4:

```
wget https://raw.githubusercontent.com/Star1xr/Pardus-Android/main/scripts/startxfce4_pardus.sh?token=GHSAT0AAAAAACQ3WA3PFHYY7AP44XFY2J2WZSAV5FQ
```

lxde:

```
wget https://raw.githubusercontent.com/Star1xr/Pardus-Android/main/scripts/startlxde_pardus.sh?token=GHSAT0AAAAAACQ3WA3O2ZROVEO322RMNBYGZSAV6FA
```

gnome:

```
wget https://raw.githubusercontent.com/Star1xr/Pardus-Android/main/scripts/startgnome_pardus.sh?token=GHSAT0AAAAAACQ3WA3PSXPKFDCLNXO6U4S4ZSAV6UA
```

cinnamon:

```
wget https://raw.githubusercontent.com/Star1xr/Pardus-Android/main/scripts/startcinnamon_pardus.sh?token=GHSAT0AAAAAACQ3WA3PPQ67QWWDWDW5DQ6CZSAV7MA
```

Run scripts:

```
chmod +x startdesktop_pardus.sh
./startdesktop_pardus.sh
```

(change desktop with your desktops like xfce4, lxde or cinnamon.)

Enjoy Pardus On Android! 

