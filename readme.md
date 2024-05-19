<!-- PARDUS ON ANDROID -->
# 📚 INDEX

> [!NOTE]  
>If you have downloaded a proot distro desktop on android with pulseaudio and if you have completed the setup commands, start with [Installation Pardus](#installation).


> [!NOTE]
>I was inspired by Muhammet on Pardus forum and Droidmaster on github. 

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

### ⬇️ INSTALL SCRIPTS TO RUN DESKTOPS <a name=easy-download></a>

> xfce pardus:

```
wget https://raw.githubusercontent.com/Star1xr/Pardus-Android/main/scripts/startxfce4_pardus.sh?token=GHSAT0AAAAAACQ3WA3PFHYY7AP44XFY2J2WZSAV5FQ

mv "startxfce4_pardus.sh?token=GHSAT0AAAAAACQ3WA3PFHYY7AP44XFY2J2WZSAV5FQ" startxfce_pardus.sh

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

for login with user, you need to change your_username part to your username script with `nano script.sh`, for example
`nano startkde_pardus.sh`. Change your_username to which is your added user on [users part](#users) example:

```
inproot-distro login pardus --user your_username -- /bin/bash -c  'export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=${TMPDIR} && env DISPLAY=:0 dbus-launch --exit-with-session startplasma-x11'
```

to username like muhammet

```console
proot-distro login pardus --user muhammet --shared-tmp -- /bin/bash -c  'export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=${TMPDIR} && env DISPLAY=:0 dbus-launch --exit-with-session startplasma-x11'
```

(To stop use log out part.Go to username,exit logo or menu>log out>log out, exit the termux if you want *exit* on termux.)

if you want to use mouse and keyboard you can edit termux-x11 preference:
for example:

- display resolution -> native
- touch screen input mode -> direct touch


Enjoy Pardus On Android! 

