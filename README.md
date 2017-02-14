## About

This is my dotfiles for **Vim**.

### Target Vim version:
- Vim 8.0 or later

### Target platforms:
- Windows 7, 10
  - Vim+kaoriya
- Mac OS X
  - MacVim-kaoriya
- Linux(Ubuntu)
  - Vim

## File hierarchy

```
dotfiles/
  +--vimfiles/
  |    +--bundle/  for plugins(managed using NeoBundle.vim - Not used anymore)
  |    +--dein/    for plugins(managed using dein.vim)
  |    +--backup/  for backup files
  |    +--swp/     for swap files
  |    `--undo/    for undo files
  +--_vimrc
  `--_gvimrc
```

### Notes

**.emacs.d** is no longer under maintenance.
**NeoBundle.vim** is not used now.


## Install

### Mac OS X or Linux

1. Clone this repo
  ```
  $ mkdir ~/projects
  $ git clone https://github.com/kaz-oji/dotfiles.git ~/projects/dotfiles
  ```

2. Create symlink
  ```
  $ ln -s ~/projects/dotfiles/vimfiles ~/.vim
  $ ln -s ~/projects/dotfiles/_vimrc ~/.vimrc
  $ ln -s ~/projects/dotfiles/_gvimrc ~/.gvimrc
  ```

3. Launch **Vim**

4. Clone dein.vim automatically

  If **dein.vim** is not installed, 'clone' will be performed automatically.

5. Install plugins automatically

  If some plugins are not installed, installation will be performed automatically.

### Windows 7, 10

0. Set the home directory path to **HOME** environment variable

1. clone this repo (on Git Bash)

  ```
  $ mkdir ~/projects
  $ git clone https://github.com/kaz-oji/dotfiles.git ~/projects/dotfiles
  ```

2. Create symlink
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

3. Launch **Vim**

4. Clone dein.vim automatically

  If **dein.vim** is not installed, 'clone' will be performed automatically.

5. Install plugins automatically

  If some plugins are not installed, installation will be performed automatically.

