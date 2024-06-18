# DESY system

## sssd

* `sudo apt install sssd`
* use `/etc/sssd/sssd.conf` from `https://it.desy.de/services/directory_services/ldap/index_eng.html`
* add `override_homedir = /home/%u` to `domain/LDAP" section of /etc/sssd.conf
* `chmod 0400 sssd.conf`
* run `pam-auth-update`, select "Create home directory on login"

## sudo

* run `visudo`, add user account to "User privilege specification"

# Basic tools

sudo apt install git fzf tmux zsh curl
sudo apt install golang build-essential python3
sudo apt install cmake clang-format clangd

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
