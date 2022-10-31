See [ArchWiki](https://wiki.archlinux.org/title/Dotfiles#Tracking_dotfiles_directly_with_Git)

```bash
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config clone --bare git@github.com:patrislav1/.dotfiles.git ~/.dotfiles
config config status.showUntrackedFiles no
config restore --staged .
config status
```
