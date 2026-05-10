[🇺🇸 English](README.md) | [🇹🇷 Türkçe](README_TR.md)

# Pardus on Android - Otomatik Kurulum Rehberi 🚀

Bu rehber, Android cihazınızda Termux kullanarak Pardus Linux'u en hızlı ve hatasız şekilde nasıl kuracağınızı anlatır. Hazırlanan script; gerekli tüm paketleri kurar, kullanıcı hesabınızı oluşturur ve masaüstü ortamını (XFCE, GNOME veya KDE) sizin için hazır hale getirir.

## 🛠️ Ön Gereksinimler

Kuruluma başlamadan önce cihazınızda aşağıdaki uygulamaların en güncel sürümlerinin kurulu olduğundan emin olun:
1.  **Termux:** [GitHub'dan İndir](https://github.com/termux/termux-app/releases)
2.  **Termux-X11:** [GitHub'dan İndir](https://github.com/termux/termux-x11/releases) (Görüntü aktarımı için gereklidir.)

## 📥 Kurulum Adımları

Kurulumu tamamen otomatik hale getirmek için aşağıdaki komutları sırasıyla Termux terminaline yapıştırın:

1.  **Kurulum betiğini indirin:**
    ```bash
    wget [https://raw.githubusercontent.com/Star1xr/Pardus-On-Android/main/install_tr.sh](https://raw.githubusercontent.com/Star1xr/Pardus-On-Android/main/install_tr.sh)
    ```

2.  **Dosyaya çalıştırma izni verin:**
    ```bash
    chmod +x install_tr.sh
    ```

3.  **Scripti başlatın:**
    ```bash
    ./install_tr.sh
    ```

### 📋 Kurulum Sırasında Dikkat Edilmesi Gerekenler:
* **Kullanıcı Adı:** Script size hangi kullanıcı adını oluşturmak istediğinizi soracaktır.
* **Şifre:** Linux kullanıcınız için bir şifre belirlemeniz istenecektir (Yazarken ekranda karakterler görünmez, bu normaldir).
* **Masaüstü Seçimi:** XFCE, GNOME veya KDE arasından bir seçim yapmanız istenecektir.

## 🚀 Pardus'u Başlatma

Kurulum tamamlandıktan sonra, seçtiğiniz masaüstü ortamına göre ana dizininize bir başlatma dosyası gelecektir. Pardus'u başlatmak için şu komutu kullanın (Örn. XFCE seçtiyseniz):

```bash
./startxfce_pardus.sh

