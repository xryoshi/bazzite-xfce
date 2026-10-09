ARG BASE_IMAGE
FROM FROM ghcr.io/ublue-os/bazzite:stable@sha256:9556db65991d57a03a7dc18e4ba28a686d8bcdcd6b61235aa69c8267bb22ff76

# 1. Hapus komponen desktop bawaan (KDE Plasma atau GNOME)
# Sesuaikan paket override remove jika basis bazzite yang kamu pilih adalah GNOME / KDE
RUN rpm-ostree override remove \
        plasmashell \
        plasma-workspace \
        kwin \
        dolphin \
        --install xfce4-session \
        --install xfce4-panel \
        --install xfwm4 \
        --install xfdesktop \
        --install xfce4-terminal \
        --install lightdm-gtk

# 2. Aktifkan service LightDM
RUN systemctl enable lightdm.service

# 3. Bersihkan cache rpm-ostree
RUN rpm-ostree cleanup -a
