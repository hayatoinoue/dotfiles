# dotfiles

[XDG Base Directory Specification](https://wiki.archlinux.jp/index.php/XDG_Base_Directory_%E3%82%B5%E3%83%9D%E3%83%BC%E3%83%88)

- Installing homebrew

```
$ xcode-select --install
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

- Setup

```
$ git clone https://github.com/hayatoinoue/dotfiles.git $HOME
$ ln -sF $HOME/dotfiles/.config $HOME/.config
$ ln -sF $HOME/dotfiles/.vimrc $HOME/.vimrc
$ brew bundle --file=$HOME/dotfiles/Brewfile
```
