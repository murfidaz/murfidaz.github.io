## Install Aplikasi

- seletelah selesai install lakukan update via terimnal

  `sudo dnf update && sudo dnf upgrade`

- kemudian restat jika perlu
- install tweaks via Aplikasi Software (Repo: Fedora Linux)

  digunakan untuk merubah tampilan Gnome, seperti tema, icon dan cursor

- install extention manager via Aplikasi Software (Repo: Fedora Linux)
  - install Blur my Shell
  - install Dash to Dock
  - install System Monitor
  - install Tilling Shell
  - install User Themes
- install gdm manager via Aplikasi Software (Repo: Fedora Linux)

  - ubah background login

- install Mission Center via Aplikasi Software (Repo: Fedora Linux)

- install Free dan Non Free Repository via Terminal [Sumber](https://rpmfusion.org/Configuration)

  `sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm`

- install Google Chrome via terminal

  `sudo dnf install google-chrome-stable`

- install VS Code via Terminal [Sumber](https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions)

- install OBS Studio via Aplikasi Software (Repo: Flathub)

  pilih install via repo Flathub, biar bisa install add-ons

  - install GStreamer Multimedia Codecs - Non Free via Aplikasi Software

    agar bsia buka view mkv, mp4 dkk

- install Virtual Machine Manager via Aplikasi Software (Repo: Fedora Linux)

- install 1Password via Terminal
  [Sumber](https://support.1password.com/install-linux/#fedora-or-red-hat-enterprise-linux)

- install DBeaver

  `sudo rpm -ivh dbeaver-ce-24.1.0-stable.x86_64.rpm`
  [Sumber](https://dbeaver.io/download/2/)

- install migrate
  `sudo dnf install  migrate`

- install Kdenlive via Software (Repo: Flathub)

  aplikasi video editor

- install GIMP via Software (Repo: Flathub)

  aplikasi image editor (alternatif photoshop)

- install Dia Diagram Editor via Software (Repo: Fedora Linux)

  aplikasi untuk membuat diagram

- install Eyedroper (Repo: Flathub)

  aplikasi untuk color picker

- install docker engine via terminal

  https://docs.docker.com/engine/install/fedora/

## Ubah Tampilan

- Install Tema [Fluent](https://github.com/vinceliuice/Fluent-gtk-theme)
  `./install.sh -c dark -l`
- Install Icon [Tela Circle](https://github.com/vinceliuice/Tela-circle-icon-theme)
  `./install.sh`
- semuanya diubah via Aplikasi Tweaks

