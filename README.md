## About

This is my dotfiles for **Vim**.

### Target Vim version:
- Vim 9.0.1276 or later

### Target platforms:
- Windows 10
  - Vim
- Linux(Ubuntu)
  - Vim

## Requirements

- git
- curl
- GNU global
- ctags (universal-ctags)
- ripgrep
- make
- [Deno](https://deno.land/)
    - for ddu.vim
- [denops.vim](https://github.com/vim-denops/denops.vim)
    - for ddu.vim

## File hierarchy

```
dotfiles/
  +--vimfiles/
  |    +--backups/          for backup files
  |    +--swp/              for swap files
  |    +--undo/             for undo files
  |    `--plug_rc.vim       for vim-plug
  +--_vimrc
  +--_gvimrc
  `--mklink.sh
```

### Notes

Nothing...

## Install

### Linux

1. Clone this repo
  ```
  $ cd ~
  $ git clone https://github.com/kaz-oji/dotfiles.git
  ```

2. Create symlink
  ```
  $ cd dotfiles/
  $ ./mklink.sh
  ```

3. Launch **Vim**

4. Download **plug.vim** automatically
  
    If **plug.vim** is not installed, download will be performed automatically.

5. Install plugins automatically
  
    If some plugins are not installed, installation will be performed automatically.

### Windows 10

0. Set the home directory path to **HOME** environment variable

1. clone this repo (on Git Bash)

  ```
  $ cd ~
  $ git clone https://github.com/kaz-oji/dotfiles.git
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

4. Download **plug.vim** automatically  
  
    If **plug.vim** is not installed, download will be performed automatically.

5. Install plugins automatically  
  
    If some plugins are not installed, installation will be performed automatically.

## Installed plugins

### unite.vim

It works with the following plugins.

* unite-outline
* unite-gtags

### ddu.vim

> Ddu is the abbreviation of "dark deno-powered UI". 

It works with the following plugins.

* 'Shougo/ddu.vim'
* 'Shougo/ddu-ui-ff'
* 'Shougo/ddu-source-file_rec'
* 'Shougo/ddu-filter-matcher_substring'
* 'Shougo/ddu-kind-file'
* 'Shougo/ddu-kind-word'
* 'shun/ddu-source-buffer'
* 'kuuote/ddu-source-mr'
* 'shun/ddu-source-rg'
* 'kaz-oji/ddu-source-gtags'

### vim-lsp

> Async Language Server Protocol plugin for vim8 and neovim.

It works with the following plugins.

* 'prabirshrestha/asyncomplete.vim'
* 'prabirshrestha/asyncomplete-lsp.vim'
* 'mattn/vim-lsp-settings'
* 'mattn/vim-lsp-icons'
* 'hrsh7th/vim-vsnip'
* 'hrsh7th/vim-vsnip-integ'

### lightline.vim

### vim-gitgutter

### vim-fugitive

## TODO

- add description of install for PowerShell
