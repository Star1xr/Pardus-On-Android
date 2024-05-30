<!-- PARDUS ON ANDROID -->

![GitHub forks](https://img.shields.io/github/forks/Star1xr/Pardus-On-Android?style=flat)
![GitHub followers](https://img.shields.io/github/followers/Star1xr?style=flat&color=Green) 
![YouTube Channel Subscribers](https://img.shields.io/youtube/channel/subscribers/UCjiPDxDhuZ4oVivXLA_O_TA?style=flat&logoColor=Orange)

# 📚 INDEX

> [!NOTE]  
>If you have downloaded a proot distro desktop on android with pulseaudio and if you have completed the setup commands, start with [Installation Pardus](#installation).


> [!NOTE]
>We did this with Muhammet from the Pardus forum. 

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

Change the repos to working ones

```
nano /etc/apt/sources.list
```

Delete all text and add these line to file. 

```
deb http://depo.pardus.org.tr/pardus yirmiuc-deb main contrib non-free non-free-firmware
deb-src http://depo.pardus.org.tr/pardus yirmiuc-deb main contrib non-free non-free-firmware
deb http://depo.pardus.org.tr/pardus yirmibir main non-free contrib
deb-src http://depo.pardus.org.tr/pardus yirmibir main non-free contrib
```

Then update packages and install the requred packages. 

```
apt update && apt upgrade -y
apt install sudo nano bash-completion neofetch ##neofetch is optional.
```

## 👤 Adding users part  <a name=users></a>
Run **adduser your_username and set password, enter on all the information form, and press y enter.**
Then run **nano /etc/sudoers** and write **your_username ALL=(ALL:ALL) ALL** to root part. 

Then install desktops. 

### 🖥️ INSTALL DESKTOPS  <a name=desktops></a>

Login to pardus with user:

```
pd login pardus --user YOUR_USERNAME
```

Install desktops(Choose one):

```
#xfce(tested):
sudo apt install pardus-xfce-desktop
#gnome(Not tested!):
sudo apt install pardus-gnome-desktop
#kde(tested)
sudo apt install kde-standard
```

Delete all text on os-release with **nano /etc/os-release** and change info debian to pardus:

```
echo 'PRETTY_NAME="Pardus GNU/linux 21"
NAME="Pardus"
VERSION_ID="yirmibir"
VERSION="21"
ID="pardus"
ID_LIKE="debian"
HOME_URL="https://www.pardus.org.tr/"
SUPPORT_URL="https://forum.pardus.org.tr/"
BUG_REPORT_URL="https://talep.pardus.org.tr/servicedesk/customer/user/login?destination=portals"
LOGO="pardus"' > /etc/os-release 
``` 

### ⬇️ INSTALL SCRIPTS TO RUN DESKTOPS <a name=easy-download></a>

> xfce pardus:

```
wget https://raw.githubusercontent.com/Star1xr/Pardus-On-Android/main/scripts/startxfce_pardus.sh

chmod +x startxfce_pardus.sh

./startxfce_pardus.sh
```

> kde pardus

```
wget https://raw.githubusercontent.com/halak0013/Pardus-On-Android/main/scripts/startkde_pardus.sh

chmod +x startkde_pardus.sh

./startkde_pardus.sh
```

> gnome pardus

```
wget https://raw.githubusercontent.com/Star1xr/Pardus-On-Android/main/scripts/startgnome_pardus.sh

chmod +x startgnome_pardus.sh

./startgnome_pardus.sh
```

for login with user, you need to change your_username part to your username with `nano script.sh`command, for example
`nano startgnome/xfce_pardus.sh`. Change your_username to which is your added user on [users part](#users) example:

```
proot-distro login pardus --shared-tmp...XDG_RUNTIME_DIR=${TMPDIR} && su - your_username... etc.
```

to username like muhammet

```console
proot-distro login pardus --shared-tmp...XDG_RUNTIME_DIR=${TMPDIR} && su - muhammet...etc.
```

In kde the part changed(cuz idk how to run kde pardus on termux-x11, Muhammet helped me too much, thanks to him):
```
proot-distro login pardus --your_username --shared-tmp -- /bin/bash -c  'export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=${TMPDIR} && su - muhammet env DISPLAY=:0 dbus-launch --exit-with-session startplasma-x11'
```

Change your_username part to your username. 

(To stop use log out part.Go to username,exit logo or menu>log out>log out, exit the termux if you want use *exit* on termux.)

if you want to use mouse and keyboard you can edit termux-x11 preference:
for example:

- display resolution -> native
- touch screen input mode -> direct touch


Enjoy Pardus On Android! 

