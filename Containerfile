ARG BASE_IMAGE
FROM ghcr.io/ublue-os/bazzite:stable@sha256:9556db65991d57a03a7dc18e4ba28a686d8bcdcd6b61235aa69c8267bb22ff76

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

RUN systemctl enable lightdm.service

RUN rpm-ostree cleanup -a
