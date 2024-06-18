# DESY system

## sssd

* `sudo apt install sssd`
* use `/etc/sssd/sssd.conf` from `https://it.desy.de/services/directory_services/ldap/index_eng.html`
* add `override_homedir = /home/%u` to `domain/LDAP" section of /etc/sssd.conf
* `chmod 0400 sssd.conf`
* run `pam-auth-update`, select "Create home directory on login"

## sudo

* run `visudo`, add user account to "User privilege specification"

## lab network

```
echo "network: {config: disabled}" > /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg
vi /etc/netplan/01-network-manager-all.yaml

# Let NetworkManager manage all devices on this system
network:
  version: 2
  renderer: NetworkManager

  ethernets:
      enp4s0:
          dhcp4: true
          dhcp4-overrides:
              use-routes: false
          routes:
              - to: 192.168.1.0/24
```

## email

```
sudo apt install thunderbird
```
* `https://it.desy.de/dienste/e_mail/mail_clients/thunderbird/index_ger.html`

# Basic tools

```
sudo apt install git fzf tmux zsh curl
sudo apt install golang build-essential python3
sudo apt install cmake clang-format clangd
```

# Shell

## Font

```
git clone --filter=blob:none --sparse git@github.com:ryanoasis/nerd-fonts
cd nerd-fonts
git sparse-checkout add patched-fonts/UbuntuMono
./install.sh UbuntuMono
```

## kitty

```
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
mkdir -p .local/bin
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
```
restart shell
```
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator `which kitty` 60
sudo update-alternatives --config x-terminal-emulator
```

## nvim

```
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
```

# Advanced stuff

## Yocto

```
sudo apt install gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 python3-subunit zstd liblz4-tool file locales libacl1
sudo locale-gen en_US.UTF-8
```

## LVM

```
sudo apt install lvm2
```

## Docker

```
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

## Groups

```
sudo usermod -a -G docker $USER
sudo usermod -a -G dialout $USER
sudo usermod -a -G adm $USER
sudo usermod -a -G sudo $USER
```

Adding to groups requires not only a logout, but a full reboot for some reason :-(

## dmesg permission

```
sudo vi /etc/sysctl.conf
kernel.dmesg_restrict = 0
```

# Filesystems

## CIFS client

This is required to fix "CIFS: Unable to determine destination address"

```
sudo apt-get install cifs-utils
```

## SFTP client

```
sudo apt install sshfs
sudo vi /etc/fuse.conf # uncomment user_allow_other
```

# GUI

```
sudo apt install gnome-tweaks
```

* Enter tweaks
  * Keyboard -> Additional Layout Options -> Caps Lock behavior -> Make Caps Lock an additional ESC
  * 
