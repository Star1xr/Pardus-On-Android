#!/bin/bash

echo "========================================="
echo " Pardus on Android Otomatik Kurulum Aracı"
echo "========================================="
echo "Lütfen ekrandaki depolama izni uyarısını onaylayın (Zaten onaylıysa bir şey olmayacaktır)."
termux-setup-storage

echo "[*] Depolar ve paketler güncelleniyor..."
pkg update && pkg upgrade -y

echo "[*] Gerekli Termux paketleri kuruluyor..."
pkg install x11-repo -y
pkg install termux-x11-nightly tur-repo pulseaudio proot-distro wget git -y

echo "[*] Pardus proot ortamına kuruluyor..."
proot-distro install pardus

echo ""
echo "--- Kullanıcı Yapılandırması ---"
read -p "[?] Oluşturulacak kullanıcı adını girin: " USERNAME

echo ""
echo "--- Masaüstü Ortamı Seçimi ---"
echo "[1] XFCE (Test Edildi, Önerilen)"
echo "[2] GNOME (Test Edildi)"
echo "[3] KDE (Test Edildi)"
read -p "[?] Hangi masaüstü ortamını kurmak istersiniz? (1/2/3): " DE_CHOICE

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
        echo "[!] Geçersiz seçim. Varsayılan olarak XFCE kuruluyor."
        DE_PKG="pardus-xfce-desktop"
        START_SCRIPT_URL="https://raw.githubusercontent.com/Star1xr/Pardus-On-Android/main/scripts/startxfce_pardus.sh"
        SCRIPT_NAME="startxfce_pardus.sh"
        ;;
esac

echo "[*] Pardus içerisine giriliyor ve sistem yapılandırılıyor..."

# Pardus içinde çalıştırılacak geçici bir script oluşturuyoruz
cat <<EOF > pardus_setup.sh
#!/bin/bash
echo "[*] Depo adresleri güncelleniyor..."
echo "deb http://depo.pardus.org.tr/pardus yirmiuc-deb main contrib non-free non-free-firmware" > /etc/apt/sources.list
echo "deb-src http://depo.pardus.org.tr/pardus yirmiuc-deb main contrib non-free non-free-firmware" >> /etc/apt/sources.list
echo "deb http://depo.pardus.org.tr/pardus yirmibir main non-free contrib" >> /etc/apt/sources.list
echo "deb-src http://depo.pardus.org.tr/pardus yirmibir main non-free contrib" >> /etc/apt/sources.list

apt update && apt upgrade -y
apt install sudo nano bash-completion neofetch -y

echo "[*] '$USERNAME' kullanıcısı oluşturuluyor."
echo "[!] Lütfen bu kullanıcı için bir şifre belirleyin:"
adduser --gecos "" $USERNAME
echo "$USERNAME ALL=(ALL:ALL) ALL" >> /etc/sudoers

echo "[*] $DE_PKG indiriliyor ve kuruluyor (Bu işlem internet hızınıza bağlı olarak uzun sürebilir)..."
apt install $DE_PKG -y

if [ "$DE_PKG" = "pardus-gnome-desktop" ]; then
    echo "[*] GNOME için login dosyaları temizleniyor..."
    for file in \$(find /usr -type f -iname "*login1*"); do rm -rf \$file; done
fi

echo "[*] OS-Release bilgileri Pardus 21 olarak değiştiriliyor..."
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

# Geçici scripti çalıştırılabilir yapıp Pardus içine enjekte ederek çalıştırıyoruz
chmod +x pardus_setup.sh
proot-distro login pardus --bind /data/data/com.termux/files/home:/root -- /root/pardus_setup.sh

# İşlem bitince geçici scripti siliyoruz
rm pardus_setup.sh

echo "[*] Başlatma scripti ($SCRIPT_NAME) Termux ana dizinine indiriliyor..."
wget $START_SCRIPT_URL -O $SCRIPT_NAME
chmod +x $SCRIPT_NAME

echo "[*] Başlatma scripti içindeki kullanıcı adları '$USERNAME' olarak güncelleniyor..."
# Script içindeki 'your_username' ve eski 'muhammet' stringlerini yeni kullanıcı adıyla değiştirir
sed -i "s/your_username/$USERNAME/g" $SCRIPT_NAME
sed -i "s/muhammet/$USERNAME/g" $SCRIPT_NAME

echo "========================================="
echo "Kurulum Tamamlandı!"
echo "Pardus'u başlatmak için şu komutu girin:"
echo "./$SCRIPT_NAME"
echo "========================================="

