#!/bin/bash

echo "========================================="
echo " Pardus on Android Automated Setup Tool"
echo "========================================="
echo "Please allow storage access on the popup (If already granted, nothing will happen)."
termux-setup-storage

echo "[*] Updating repositories and packages..."
pkg update && pkg upgrade -y

echo "[*] Installing required Termux packages..."
pkg install x11-repo -y
pkg install termux-x11-nightly tur-repo pulseaudio proot-distro wget git -y

echo "[*] Installing Pardus into proot environment..."
proot-distro install pardus

echo ""
echo "--- User Configuration ---"
read -p "[?] Enter the username to create: " USERNAME

echo ""
echo "--- Desktop Environment Selection ---"
echo "[1] XFCE (Tested, Recommended)"
echo "[2] GNOME (Tested)"
echo "[3] KDE (Tested)"
read -p "[?] Which desktop environment would you like to install? (1/2/3): " DE_CHOICE

case $DE_CHOICE in
    1) 
        DE_PKG="pardus-xfce-desktop"
        START_SCRIPT_URL="https://raw.githubusercontent.com/Star1xr/Pardus-On-Android/main/scripts/startxfce_pardus.sh"
        SCRIPT_NAME="startxfce_pardus.sh"
        ;;
    2) 
        DE_PKG="pardus-gnome-desktop"
        START_SCRIPT_URL="https://raw.githubusercontent.com/Star1xr/Pardus-On-Android/main/scripts/startgnome_pardus.sh"
        SCRIPT_NAME="startgnome_pardus.sh"
        ;;
    3) 
        DE_PKG="kde-standard"
        START_SCRIPT_URL="https://raw.githubusercontent.com/halak0013/Pardus-On-Android/main/scripts/startkde_pardus.sh"
        SCRIPT_NAME="startkde_pardus.sh"
        ;;
    *) 
        echo "[!] Invalid selection. Defaulting to XFCE."
        DE_PKG="pardus-xfce-desktop"
        START_SCRIPT_URL="https://raw.githubusercontent.com/Star1xr/Pardus-On-Android/main/scripts/startxfce_pardus.sh"
        SCRIPT_NAME="startxfce_pardus.sh"
        ;;
esac

echo "[*] Entering Pardus and configuring the system..."

cat <<EOF > pardus_setup.sh
#!/bin/bash
echo "[*] Updating repository addresses..."
echo "deb http://depo.pardus.org.tr/pardus yirmiuc-deb main contrib non-free non-free-firmware" > /etc/apt/sources.list
echo "deb-src http://depo.pardus.org.tr/pardus yirmiuc-deb main contrib non-free non-free-firmware" >> /etc/apt/sources.list
echo "deb http://depo.pardus.org.tr/pardus yirmibir main non-free contrib" >> /etc/apt/sources.list
echo "deb-src http://depo.pardus.org.tr/pardus yirmibir main non-free contrib" >> /etc/apt/sources.list

apt update && apt upgrade -y
apt install sudo nano bash-completion neofetch -y

echo "[*] Creating user '$USERNAME'..."
echo "[!] Please set a password for this user:"
adduser --gecos "" $USERNAME
echo "$USERNAME ALL=(ALL:ALL) ALL" >> /etc/sudoers

echo "[*] Downloading and installing $DE_PKG (This might take a while depending on your internet speed)..."
apt install $DE_PKG -y

if [ "$DE_PKG" = "pardus-gnome-desktop" ]; then
    echo "[*] Cleaning up login files for GNOME..."
    for file in \$(find /usr -type f -iname "*login1*"); do rm -rf \$file; done
fi

echo "[*] Changing OS-Release info to Pardus 21..."
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
EOF

chmod +x pardus_setup.sh
proot-distro login pardus --bind /data/data/com.termux/files/home:/root -- /root/pardus_setup.sh

rm pardus_setup.sh

echo "[*] Downloading startup script ($SCRIPT_NAME) to Termux home directory..."
wget $START_SCRIPT_URL -O $SCRIPT_NAME
chmod +x $SCRIPT_NAME

echo "[*] Automatically configuring the startup script for user '$USERNAME'..."
sed -i "s/your_username/$USERNAME/g" $SCRIPT_NAME

echo "========================================="
echo "Installation Complete!"
echo "To start Pardus, simply run:"
echo "./$SCRIPT_NAME"
echo "========================================="

