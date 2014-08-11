## About

This is my dotfiles for **Vim**.

### Target platforms:
- Windows 7
  - Vim+kaoriya
- Mac OS X
  - MacVim-kaoriya
- Linux(Ubuntu)
  - Vim

## File hierarchy

```
dotfiles/
  +--vimfiles/
  |    +--bundle/  for plugins(managed using NeBundle.vim)
  |    +--backup/  for backup files
  |    +--swp/     for swap files
  |    `--undo/    for undo files
  +--_vimrc
  `--_gvimrc
```

### Notes

**.emacs.d** is no maintenance now.


## Install

### Mac OS X or Linux

1. clone this repo
```
$ mkdir ~/projects
$ git clone https://github.com/kaz-oji/dotfiles.git ~/projects/dotfiles
```

2. clone NeoBundle.vim
```
$ git clone https://github.com/Shougo/neobundle.vim ~/projects/dotfiles/vimfiles/bundle/neobundle.vim
```

3. create symlink
```
$ ln -s ~/projects/dotfiles/vimfiles ~/.vim
$ ln -s ~/projects/dotfiles/_vimrc ~/.vimrc
$ ln -s ~/projects/dotfiles/_gvimrc ~/.gvimrc
```

4. Launch **Vim**

### Windows 7

0.  Set the home directory path to **HOME** environment variable

1. clone this repo (on Git Bash)
```
$ mkdir ~/projects
$ git clone https://github.com/kaz-oji/dotfiles.git ~/projects/dotfiles
```

2. clone NeoBundle.vim (on Git Bash)
```
$ git clone https://github.com/Shougo/neobundle.vim ~/projects/dotfiles/vimfiles/bundle/neobundle.vim
```

3. create symlink
  1. Launch command prompt(cmd.exe) with administrative privileges.
     1. Press [Win] key.
     2. Input "cmd.exe" to search box.
     3. Press [Enter] key with [Ctrl]+[Shift] keys.
  2. Move to HOME dir
     ```
     >cd %HOME%
     ```
  3. create symlink
     ```
     >mklink /D vimfiles projects\dotfiles\vimfiles
     >mklink _vimrc projects\dotfiles\_vimrc
     >mklink _gvimrc projects\dotfiles\_gvimrc
     ```

4. Launch **Vim**

